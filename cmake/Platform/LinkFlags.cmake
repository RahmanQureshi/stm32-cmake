set(LINK_FLAGS "-Wl,--gc-sections -mthumb -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(CMAKE_C_LINK_FLAGS "")
# Avoid known bug in osx that causes "cannot find entry symbol arch_paths_first" error
set(CMAKE_CXX_LINK_FLAGS "") 
set(CMAKE_EXE_LINKER_FLAGS "")
# Avoid known bug in linux: 
# "arm-none-eabi-gcc: error: unrecognized command line option '-rdynamic'"
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

if(NOT CMAKE_BUILD_TYPE)
set(CMAKE_EXE_LINKER_FLAGS "${LINK_FLAGS} --specs=nosys.specs")
else()
set(CMAKE_EXE_LINKER_FLAGS "${LINK_FLAGS}")
endif(NOT CMAKE_BUILD_TYPE)

set(CMAKE_EXE_LINKER_FLAGS_DEBUG "--specs=rdimon.specs -lc -lrdimon") # Link semihosting sys calls
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "--specs=nosys.specs") # Link sys dummy call implementation
