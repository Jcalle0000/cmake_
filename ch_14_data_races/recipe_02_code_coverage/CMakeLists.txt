cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(recipe_01_dash LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ✅ Set global coverage compile/link flags here
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-instr-generate -fcoverage-mapping -g")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-instr-generate")


# process src/CMakeLists.txt
add_subdirectory(src) # src is the name of the directory
enable_testing()

# allow to report to a cdash dashboard
include(CTest)

# ✅ Copy CTestCustom.cmake to build directory (CTest only looks there)
configure_file(
  ${CMAKE_SOURCE_DIR}/CTestCustom.cmake
  ${CMAKE_BINARY_DIR}/CTestCustom.cmake
  COPYONLY
)

# this lets CTest know which tool to run when performing 
# ctest -T Coverage or cmake --build .-- target Experimental
set(COVERAGE_COMMAND "/usr/local/opt/llvm/bin/llvm-cov")

# process tests/CMakeLists.txt
add_subdirectory(tests) # tests is the name of the directory

add_custom_target(generate_coverage
  COMMAND /usr/local/opt/llvm/bin/llvm-profdata merge -sparse ${CMAKE_BINARY_DIR}/tests/*.profraw -o ${CMAKE_BINARY_DIR}/coverage.profdata
  COMMAND /usr/local/opt/llvm/bin/llvm-cov show ${CMAKE_BINARY_DIR}/src/sum_up
          -instr-profile=${CMAKE_BINARY_DIR}/coverage.profdata
          -format=html -output-dir=${CMAKE_BINARY_DIR}/coverage_html
  COMMENT "Generating LLVM coverage report"
)

# then we create CTestConfig.cmake 

# manual way
# llvm-profdata merge -sparse sum_up.profraw -o sum_up.profdata
# llvm-cov show ./src/sum_up -instr-profile=sum_up.profdata -format=html -output-dir=coverage_html open coverage_html/index.html