
execute_process(
  COMMAND "/usr/local/bin/git" rev-list --max-count=1 HEAD
  WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
  RESULT_VARIABLE error_code
  OUTPUT_VARIABLE head_sha
  OUTPUT_STRIP_TRAILING_WHITESPACE
  )
if(error_code)
  message(FATAL_ERROR "Failed to get the hash for HEAD")
endif()

execute_process(
  COMMAND "/usr/local/bin/git" show-ref release-1.8.0
  WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
  OUTPUT_VARIABLE show_ref_output
  )
# If a remote ref is asked for, which can possibly move around,
# we must always do a fetch and checkout.
if("${show_ref_output}" MATCHES "remotes")
  set(is_remote_ref 1)
else()
  set(is_remote_ref 0)
endif()

# Tag is in the form <remote>/<tag> (i.e. origin/master) we must strip
# the remote from the tag.
if("${show_ref_output}" MATCHES "refs/remotes/release-1.8.0")
  string(REGEX MATCH "^([^/]+)/(.+)$" _unused "release-1.8.0")
  set(git_remote "${CMAKE_MATCH_1}")
  set(git_tag "${CMAKE_MATCH_2}")
else()
  set(git_remote "origin")
  set(git_tag "release-1.8.0")
endif()

# This will fail if the tag does not exist (it probably has not been fetched
# yet).
execute_process(
  COMMAND "/usr/local/bin/git" rev-list --max-count=1 release-1.8.0
  WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
  RESULT_VARIABLE error_code
  OUTPUT_VARIABLE tag_sha
  OUTPUT_STRIP_TRAILING_WHITESPACE
  )

# Is the hash checkout out that we want?
if(error_code OR is_remote_ref OR NOT ("${tag_sha}" STREQUAL "${head_sha}"))
  execute_process(
    COMMAND "/usr/local/bin/git" fetch
    WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
    RESULT_VARIABLE error_code
    )
  if(error_code)
    message(FATAL_ERROR "Failed to fetch repository 'https://github.com/google/googletest.git'")
  endif()

  if(is_remote_ref)
    # Check if stash is needed
    execute_process(
      COMMAND "/usr/local/bin/git" status --porcelain
      WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
      RESULT_VARIABLE error_code
      OUTPUT_VARIABLE repo_status
      )
    if(error_code)
      message(FATAL_ERROR "Failed to get the status")
    endif()
    string(LENGTH "${repo_status}" need_stash)

    # If not in clean state, stash changes in order to be able to be able to
    # perform git pull --rebase
    if(need_stash)
      execute_process(
        COMMAND "/usr/local/bin/git" stash save --all;--quiet
        WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
        RESULT_VARIABLE error_code
        )
      if(error_code)
        message(FATAL_ERROR "Failed to stash changes")
      endif()
    endif()

    # Pull changes from the remote branch
    execute_process(
      COMMAND "/usr/local/bin/git" rebase ${git_remote}/${git_tag}
      WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
      RESULT_VARIABLE error_code
      )
    if(error_code)
      # Rebase failed: Restore previous state.
      execute_process(
        COMMAND "/usr/local/bin/git" rebase --abort
        WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
      )
      if(need_stash)
        execute_process(
          COMMAND "/usr/local/bin/git" stash pop --index --quiet
          WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
          )
      endif()
      message(FATAL_ERROR "\nFailed to rebase in: '/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src/'.\nYou will have to resolve the conflicts manually")
    endif()

    if(need_stash)
      execute_process(
        COMMAND "/usr/local/bin/git" stash pop --index --quiet
        WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
        RESULT_VARIABLE error_code
        )
      if(error_code)
        # Stash pop --index failed: Try again dropping the index
        execute_process(
          COMMAND "/usr/local/bin/git" reset --hard --quiet
          WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
          RESULT_VARIABLE error_code
          )
        execute_process(
          COMMAND "/usr/local/bin/git" stash pop --quiet
          WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
          RESULT_VARIABLE error_code
          )
        if(error_code)
          # Stash pop failed: Restore previous state.
          execute_process(
            COMMAND "/usr/local/bin/git" reset --hard --quiet ${head_sha}
            WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
          )
          execute_process(
            COMMAND "/usr/local/bin/git" stash pop --index --quiet
            WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
          )
          message(FATAL_ERROR "\nFailed to unstash changes in: '/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src/'.\nYou will have to resolve the conflicts manually")
        endif()
      endif()
    endif()
  else()
    execute_process(
      COMMAND "/usr/local/bin/git" checkout release-1.8.0
      WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src"
      RESULT_VARIABLE error_code
      )
    if(error_code)
      message(FATAL_ERROR "Failed to checkout tag: 'release-1.8.0'")
    endif()
  endif()

  execute_process(
    COMMAND "/usr/local/bin/git" submodule update --recursive --init 
    WORKING_DIRECTORY "/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src/"
    RESULT_VARIABLE error_code
    )
  if(error_code)
    message(FATAL_ERROR "Failed to update submodules in: '/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_04/gunit_ex/build/_deps/googletest-src/'")
  endif()
endif()

