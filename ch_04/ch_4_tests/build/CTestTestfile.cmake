# CMake generated Testfile for 
# Source directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests
# Build directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(bash_test "/bin/bash" "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/the_bash_script.sh" "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/build/MAIN_EXEC_NAME")
set_tests_properties(bash_test PROPERTIES  _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/CMakeLists.txt;28;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/CMakeLists.txt;0;")
add_test(cpp_test "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/build/cpp_test_exec")
set_tests_properties(cpp_test PROPERTIES  _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/CMakeLists.txt;30;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/ch_4_tests/CMakeLists.txt;0;")
