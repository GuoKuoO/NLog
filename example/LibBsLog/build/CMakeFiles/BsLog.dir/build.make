# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/guoyaosong/Workspace/example/LibBsLog

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/guoyaosong/Workspace/example/LibBsLog/build

# Include any dependencies generated for this target.
include CMakeFiles/BsLog.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/BsLog.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/BsLog.dir/flags.make

CMakeFiles/BsLog.dir/src/bsLog.cpp.o: CMakeFiles/BsLog.dir/flags.make
CMakeFiles/BsLog.dir/src/bsLog.cpp.o: ../src/bsLog.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoyaosong/Workspace/example/LibBsLog/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/BsLog.dir/src/bsLog.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/BsLog.dir/src/bsLog.cpp.o -c /home/guoyaosong/Workspace/example/LibBsLog/src/bsLog.cpp

CMakeFiles/BsLog.dir/src/bsLog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/BsLog.dir/src/bsLog.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/guoyaosong/Workspace/example/LibBsLog/src/bsLog.cpp > CMakeFiles/BsLog.dir/src/bsLog.cpp.i

CMakeFiles/BsLog.dir/src/bsLog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/BsLog.dir/src/bsLog.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/guoyaosong/Workspace/example/LibBsLog/src/bsLog.cpp -o CMakeFiles/BsLog.dir/src/bsLog.cpp.s

# Object files for target BsLog
BsLog_OBJECTS = \
"CMakeFiles/BsLog.dir/src/bsLog.cpp.o"

# External object files for target BsLog
BsLog_EXTERNAL_OBJECTS =

../lib/libBsLog.so: CMakeFiles/BsLog.dir/src/bsLog.cpp.o
../lib/libBsLog.so: CMakeFiles/BsLog.dir/build.make
../lib/libBsLog.so: CMakeFiles/BsLog.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/guoyaosong/Workspace/example/LibBsLog/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../lib/libBsLog.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BsLog.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/BsLog.dir/build: ../lib/libBsLog.so

.PHONY : CMakeFiles/BsLog.dir/build

CMakeFiles/BsLog.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/BsLog.dir/cmake_clean.cmake
.PHONY : CMakeFiles/BsLog.dir/clean

CMakeFiles/BsLog.dir/depend:
	cd /home/guoyaosong/Workspace/example/LibBsLog/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/guoyaosong/Workspace/example/LibBsLog /home/guoyaosong/Workspace/example/LibBsLog /home/guoyaosong/Workspace/example/LibBsLog/build /home/guoyaosong/Workspace/example/LibBsLog/build /home/guoyaosong/Workspace/example/LibBsLog/build/CMakeFiles/BsLog.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/BsLog.dir/depend

