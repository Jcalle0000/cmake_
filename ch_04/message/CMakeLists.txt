# CmakeVersion, project name, supported language

cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project( recipe_04 LANGUAGES CXX)

set(USE_LIBRARY OFF)
message(STATUS "Compile sources into library? ${USE_LIBRARY}")
# 
set(BUILD_SHARED_LIBS OFF)
list(APPEND _sources Message.hpp Message.cpp)

if(USE_LIBRARY)
    #add_libary will create a static library
    # since BUILD_SHARED_LIBS is OFF
    add_library(message ${_sources}) # define library name?
    add_executable(hello_world the_main.cpp)
    target_link_libraries(hello_world message) # reuse library name?
else()
    add_executable(hello_world the_main.cpp ${_sources})
endif()

# cd build
# cmake -s ..
# cmake --build . 