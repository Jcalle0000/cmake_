# CMake generated Testfile for 
# Source directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex
# Build directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(google_test "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/cpp_test")
set_tests_properties(google_test PROPERTIES  _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/CMakeLists.txt;116;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/CMakeLists.txt;0;")
subdirs("_deps/googletest-build")
