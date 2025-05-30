# need to compile our code with flags to take 
# advantage of ASan
add_library(buggy "")

target_include_directories(buggy
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(buggy
    PRIVATE
        buggy.cpp
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}
)
 
option(ENABLE_ASAN "Enable AddressSantizer" OFF)

if(ENABLE_ASAN)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        message(STATUS "AddressSanitzer enabled")
        
        target_compile_options(buggy
            PUBLIC
            #-g -01 -fsanitize=address -fno-omit-frame-pointer
            -g -O1 -fsanitize=address -fno-omit-frame-pointer
        )

        # target_link_libraries(buggy
        #     PUBLIC  
        #         asan
        # )
        target_link_options(buggy
            PUBLIC
                -fsanitize=address
        )
    else()
            message(WARNING "AddressSanitzer not supported for this compiler")
    endif()
endif()