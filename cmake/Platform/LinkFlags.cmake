set(CMAKE_C_LINK_FLAGS "")
# Avoid known bug in osx that causes "cannot find entry symbol arch_paths_first" error
set(CMAKE_CXX_LINK_FLAGS "") 
set(CMAKE_EXE_LINKER_FLAGS "")
# Avoid known bug in linux: 
# "arm-none-eabi-gcc: error: unrecognized command line option '-rdynamic'"
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} --specs=rdimon.specs -lc -lrdimon") # Link semihosting sys calls
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} --specs=nosys.specs") # Link sys dummy call implementation