# create a new target: a static library 
# the name of the library will be the name of the target and the sources
# are listed as follow - under add_library

# set minimum cmake version
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# project name and language
project(recipe-03 LANGUAGES CXX)

# generate a library from sources
add_library(message # library name , adds lib word to the front
  STATIC # other library types are shared, which can be linked dynamically and loaded at runtime
    Message.hpp
    Message.cpp
  )

# SHARED libraries are (dyanmic shared objects (DSO) )
# can also be  OBJECT

add_executable(hello-world the_main.cpp) # hello-world is the executable name 

target_link_libraries(hello-world message) # library name used again

# cd build
# cmake -s ..
# cmake --build . 