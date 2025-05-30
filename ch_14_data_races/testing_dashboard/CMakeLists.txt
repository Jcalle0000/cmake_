cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(recipe_01_dash LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# process src/CMakeLists.txt
add_subdirectory(src) # src is the name of the directory
enable_testing()

enable_testing()
# allow to report to a cdash dashboard
include(CTest)

# process tests/CMakeLists.txt
add_subdirectory(tests) # tests is the name of the directory

# then we create CTestConfig.cmake 