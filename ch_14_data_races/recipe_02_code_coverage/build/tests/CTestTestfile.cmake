# CMake generated Testfile for 
# Source directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/tests
# Build directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_short "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/build/tests/test_short")
set_tests_properties(test_short PROPERTIES  ENVIRONMENT "LLVM_PROFILE_FILE=test_short_%p.profraw" _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/tests/CMakeLists.txt;24;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/tests/CMakeLists.txt;0;")
add_test(test_long "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/build/tests/test_long")
set_tests_properties(test_long PROPERTIES  ENVIRONMENT "LLVM_PROFILE_FILE=test_long_%p.profraw" _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/tests/CMakeLists.txt;25;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_02_code_coverage/tests/CMakeLists.txt;0;")
