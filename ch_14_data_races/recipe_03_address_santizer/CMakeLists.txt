cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(recipe_03 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(src)
enable_testing()

include(CTest)
add_subdirectory(tests)
#allow to report to a cdash dashboard
# do we need more configurations for mac?

#CTestConfig.cmake