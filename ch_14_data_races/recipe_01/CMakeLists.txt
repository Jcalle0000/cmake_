cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(recipe_04 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# location thread library, define the executable and link it against the threads lib
find_package(Threads REQUIRED)
add_executable(example_exe the_main.cpp)

target_link_libraries(example_exe
    PUBLIC
        Threads::Threads # what is this
)

# offer the option and code to compile and link with support for the thread santizer
option(ENABLE_TSAN "Enable ThreadSantizer" OFF)

if(ENABLE_TSAN)

    if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
        message(STATUS "ThreadSantizer enabled")
        target_compile_options(example_exe
            PUBLIC  
                -g -01 -fsanitize=thread -fno-omit-frame-pointer-fPIC
        )
        target_link_libraries(example_exe
            PUBLIC  
                tsan
        )
    else()
        message(WARNING "ThreadSanitizer not supported for this compiler")
    endif()

endif()

# execute the compiled example itself
enable_testing()

# allow to report to a cdash dashboard
include(CTest)
add_test(NAME
    example_exe
    COMMAND $<TARGET_FILE:example_exe>
)

