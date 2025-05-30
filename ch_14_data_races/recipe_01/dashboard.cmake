set(CTEST_PROJECT_NAME "example_exe")
cmake_host_system_information(RESULT _site QUERY HOSTNAME)
set(CTEST_SITE ${_site})
set(CTEST_BUILD_NAME "${CMAKE_SYSTEM_NAME}-${CMAKE_HOST_SYSTEM_PROCESSOR}")

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}" )
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/build")

include(ProcessorCount)
ProcessorCount(N)

if(NOT N EQUAL 0)
    set(CTEST_BUILD_FLAG -j${N})
    set(ctest_test_args ${ctest_test_args} PARALLEL_LEVEL ${N})
endif()

ctest_start(Experimental)

ctest_configure(
    OPTIONS
        -DENABLE_TSAN:BOOL=ON
)

ctest_build()
ctest_test()

set(CTEST_MEMORYCHECK_TYPE "ThreadSantizer")
ctest_memcheck()

ctest_submit()
