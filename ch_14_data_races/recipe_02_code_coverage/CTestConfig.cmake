set(CTEST_PROJECT_NAME "recipe_01_dash")

set(CTEST_DROP_METHOD "http")
set(CTEST_DROP_SITE "my.cdash.org" )
set(CTEST_DROP_LOCATION "/submit.php?project=cmake-cookbook")
set(CTEST_DROP_SITE_CDASH TRUE)

# mkdir -p build
# cd build
# cmake ..
# cmake --build .

# run the test set and report the test results to the dashboard
# ctest --dashboard Experimental

# view results 
# https://my.cdash.org/index.php?project=cmake-cookbook