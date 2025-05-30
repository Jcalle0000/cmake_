# tests defined 

foreach(_test IN ITEMS leaky use_after_free) # names of the test files
    add_executable(${_test} ${_test}.cpp )

    target_link_libraries(${_test} buggy) # name of the library

    add_test(
        NAME
            ${_test}
        COMMAND 
        $<TARGET_FILE:${_test}>
    )
endforeach()