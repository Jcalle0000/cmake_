cmake_minimum_required( VERSION 3.5 FATAL_ERROR)

project( using_python_proj LANGUAGES NONE)

find_package(PythonInterp REQUIRED)

execute_process(
    # path to the executable for the python interpreter 
    COMMAND ${PYTHON_EXECUTABLE} "-c" "print('Hello, World!')"
    RESULT_VARIABLE _status
    OUTPUT_VARIABLE _hello_world
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS "RESULT_VARIABLE is ${_status}")
message(STATUS "OUTPUT_VARIABLE is: ${_hello_world}")

# mkdir build
# cd build
# cmake ..