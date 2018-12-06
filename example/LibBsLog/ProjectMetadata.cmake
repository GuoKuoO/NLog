# 设置项目名称。set project name.
project(BsLog C CXX)

# 编译平台 ON表示ubuntu，OFF表示arm
option(Ubuntu "x86_64" OFF)

# 是否显示编译细节
if(NOT CMAKE_VERBOSE_MAKEFILE)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()

# 设置编译类型 Debug | Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

if(Ubuntu)
    message("################################  Ubuntu   ###############################")
	set(BUILD_PLATFORM "x86_64")
else()
    message("################################  ARM   ###############################")
endif()

# 输出文件路径，相对于当前路径。set output directories
if(NOT OUT_DIR)
    set(OUT_DIR out)
endif()

if(NOT LIB_DIR)
    set(LIB_DIR lib${BUILD_PLATFORM})
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${OUT_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${LIB_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${LIB_DIR})

# 设置 C/C++ 的编译选项
# set(CMAKE_C_FLAGS "-mcpu=cortex-a7 -mfloat-abi=softfp -mfpu=neon-vfpv4 -mno-unaligned-access -fno-aggressive-loop-optimizations -DUSE_MAKEFILE -std=c99 ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "-std=c++11 -fpermissive ${CMAKE_C_FLAGS}")

# 添加子模块
###################################################################################################
# 设置子模块 如果存在，设置。路径在modules目录下。
# 为了使module子模块先编译需要设置依赖关系，module下子文件夹名称必须和module子模块的输出名称相同 BsLog子文件夹输出为 BsLog
# set(META_MODULE_LIST
#     # modules/BsLog
#     # modules/libBsLog2
#     # modules/module-2
# )
# add_modules()

# 生成 library
###################################################################################################
# 设置可执行程序文件名 不可与重复其它 library 或者其它 exe 文件名重复
set(META_PROJECT_NAME BsLog)
set(META_PROJECT_NAME ${META_PROJECT_NAME})
#remove_definitions(-DWITH_GRPC)

# 设置头文件路径，相对路径和绝对路径均可。
set(META_INCLUDE_PATH
    inc
    # other include find_path
)

# 包含的c或者cpp文件。两种方法均可。
# 包含src目录下及其子目录所有c或cpp,包含子文件夹下的文件,单独指定不包含哪些文件
file(GLOB_RECURSE META_SRC_LISTS 
    src/bsLog.cpp
)

# 设置依赖库查找路径
set(META_LIB_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}/lib${BUILD_PLATFORM}
    # other lib find_path  
)

# 需要连接的库。三种写法都可以，每行一个库。
set(META_DEP_LISTS
	-pthread
	libglog.a
	libgflags.a
	#-lBsDbgLog
    # pthread 
    # -lpthread
    # libmpi.a
)

# 编译成 library，设置库类型 STATIC | SHARED。
set(META_LIB_TYPE SHARED)
build_library()

# 生成可执行程序 test
###################################################################################################
# 设置可执行程序文件名 不可与重复其它 library 或者其它 exe 文件名重复
set(META_PROJECT_NAME Test)
set(META_PROJECT_NAME ${META_PROJECT_NAME})

# 设置头文件路径，相对路径和绝对路径均可。
set(META_INCLUDE_PATH
    inc	
    # ${CMAKE_CURRENT_SOURCE_DIR}/../OpenLibs/Libgrpc/inc
    # other include find_path
)

# 包含的c或者cpp文件。两种方法均可。
# 包含src目录下及其子目录所有c或cpp,包含子文件夹下的文件,单独指定不包含哪些文件
file(GLOB_RECURSE META_SRC_LISTS 
    test/*.c 
    test/*.cpp
)

# 依次列出需要包含的文件。
# set(META_SRC_LISTS
#     ${CMAKE_CURRENT_SOURCE_DIR}/src/a.c 
#     ${CMAKE_CURRENT_SOURCE_DIR}/src/b.c
# )

# 单独指定不包含哪些文件
# list(REMOVE_ITEM META_SRC_LISTS
#     ${CMAKE_CURRENT_SOURCE_DIR}/src/a.c 
# )

# 设置依赖库查找路径

set(META_LIB_PATH
	${CMAKE_CURRENT_SOURCE_DIR}/lib${BUILD_PLATFORM}
	${CMAKE_CURRENT_SOURCE_DIR}/../OpenLibs/Libgrpc/lib${BUILD_PLATFORM}
	#${CMAKE_CURRENT_SOURCE_DIR}/lib/ubuntu
	# other lib find_path  
)

# 需要连接的库。三种写法都可以，每行一个库。
set(META_DEP_LISTS
	-pthread
	-lstdc++
	-lBsLog
    # libpthread.so 
    # pthread 
    # -pthread
    # libmpi.a
)

build_exe()
