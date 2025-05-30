# create library
add_library(sum_integers "")

target_sources(sum_integers
  PRIVATE
    sum_integers.cpp
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/sum_integers.hpp
  )

target_include_directories(sum_integers
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
  )


# add library to the main executable
add_executable(sum_up main.cpp)
target_link_libraries(sum_up sum_integers)

# extending to add an option to add compile flags for code coverage
option(ENABLE_COVERAGE "Enable coverage" ON)
if(ENABLE_COVERAGE)
  if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    message(STATUS "Coverage analysis with gcov enabled")
    target_compile_options(sum_integers
      PUBLIC
        -fprofile-arcs -ftest-coverage -g
    )

    target_link_libraries(sum_integers
      PUBLIC
        gcov
    
        )
  
  
  elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    message(STATUS "Coverage analysis with llvm-profdata and llvm-cov enabled")

    # we need to move these to topLevel so theyre global flags
    # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-instr-generate -fcoverage-mapping -g")
    # set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-instr-generate")

    target_compile_options(sum_integers
      PUBLIC -fprofile-instr-generate -fcoverage-mapping -g
    )
    target_link_options(sum_integers
      PUBLIC -fprofile-instr-generate
    )

    target_compile_options(sum_up
      PRIVATE -fprofile-instr-generate -fcoverage-mapping -g
    )
    target_link_options(sum_up
      PRIVATE -fprofile-instr-generate
    )

  else()
    message(WARNING "Coverage not supported for this compiler")
  endif()
endif()

# # add library to the main executable
# add_executable(sum_up main.cpp)
# target_link_libraries(sum_up sum_integers)

# we modifiy this since we made a copy