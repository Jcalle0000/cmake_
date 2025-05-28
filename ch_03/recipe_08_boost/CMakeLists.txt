cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(recipe_08_proj LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# what if you dont have boost?
find_package(Boost 1.54 REQUIRED COMPONENTS filesystem)

add_executable(path_info_exec path_info.cpp)

# link the target to the boost library component
# since the dependency is declared public, it will be picked up automatically
target_link_libraries(path_info_exec PUBLIC Boost::filesystem )


# mkdir build
# cd build
# cmake .. // generated the files
# cmake --build . // builds the executable