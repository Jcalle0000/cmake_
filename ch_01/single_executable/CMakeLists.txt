cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project(recipe_01 LANGUAGES CXX) # project name is recipe_01


add_executable( hello_world main_hello.cpp ) # instruct to make executable, compile and link the source file 

# mkdir -p build
# cd build
# cmake .. // essentaily we build from where the CMakeLists.txt lives

# the following configuration files will have been generated
# 1. CmakeCache.txt
# 2. CmakeFiles
# 3. Makefile
# 4. cmake_install.cmake

# we can now compile the executable
# "cmake --build ."
# this will make the hello_world executable where CmakeCache.txt lives: ./hello_world