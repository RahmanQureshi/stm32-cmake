set(COMPILE_FLAGS "-mthumb -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16")
set(COMPILE_DEBUG_FLAGS "-g -ggdb")
set(COMPILE_CXX_FLAGS "-std=gnu++11")
set(COMPILE_RELEASE_FLAGS "-O0 -DNDEBUG")

set(CMAKE_C_FLAGS "")
set(CMAKE_CXX_FLAGS "")
set(CMAKE_C_FLAGS_DEBUG "")
set(CMAKE_C_FLAGS_RELEASE "")
set(CMAKE_CXX_FLAGS_DEBUG "")
set(CMAKE_CXX_FLAGS_RELEASE "") 

set(CMAKE_ASM_FLAGS "${COMPILE_FLAGS}")
set(CMAKE_C_FLAGS "${COMPILE_FLAGS}")
# Cache is required otherwise calling Project() overwrites CMAKE_CXX_FLAGS
set(CMAKE_CXX_FLAGS "${COMPILE_FLAGS} ${COMPILE_CXX_FLAGS}" CACHE INTERNAL "LOL")

set(CMAKE_C_FLAGS_DEBUG "${COMPILE_DEBUG_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${COMPILE_DEBUG_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE "${COMPILE_RELEASE_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${COMPILE_RELEASE_FLAGS}")