# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.15.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.15.4/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build

# Include any dependencies generated for this target.
include CMakeFiles/message.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/message.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/message.dir/flags.make

CMakeFiles/message.dir/Message.cpp.o: CMakeFiles/message.dir/flags.make
CMakeFiles/message.dir/Message.cpp.o: ../Message.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/message.dir/Message.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/message.dir/Message.cpp.o -c /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/Message.cpp

CMakeFiles/message.dir/Message.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/message.dir/Message.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/Message.cpp > CMakeFiles/message.dir/Message.cpp.i

CMakeFiles/message.dir/Message.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/message.dir/Message.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/Message.cpp -o CMakeFiles/message.dir/Message.cpp.s

# Object files for target message
message_OBJECTS = \
"CMakeFiles/message.dir/Message.cpp.o"

# External object files for target message
message_EXTERNAL_OBJECTS =

libmessage.a: CMakeFiles/message.dir/Message.cpp.o
libmessage.a: CMakeFiles/message.dir/build.make
libmessage.a: CMakeFiles/message.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmessage.a"
	$(CMAKE_COMMAND) -P CMakeFiles/message.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/message.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/message.dir/build: libmessage.a

.PHONY : CMakeFiles/message.dir/build

CMakeFiles/message.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/message.dir/cmake_clean.cmake
.PHONY : CMakeFiles/message.dir/clean

CMakeFiles/message.dir/depend:
	cd /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03 /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03 /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build /Users/jasoncalle/Desktop/2025/cmake_cookbook_examples/ch_01/recipe_03/build/CMakeFiles/message.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/message.dir/depend

