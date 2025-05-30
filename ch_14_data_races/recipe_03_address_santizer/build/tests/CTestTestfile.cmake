# CMake generated Testfile for 
# Source directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/tests
# Build directory: /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(leaky "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/build/tests/leaky")
set_tests_properties(leaky PROPERTIES  _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/tests/CMakeLists.txt;8;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/tests/CMakeLists.txt;0;")
add_test(use_after_free "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/build/tests/use_after_free")
set_tests_properties(use_after_free PROPERTIES  _BACKTRACE_TRIPLES "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/tests/CMakeLists.txt;8;add_test;/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_14_data_races/recipe_03_address_santizer/tests/CMakeLists.txt;0;")
