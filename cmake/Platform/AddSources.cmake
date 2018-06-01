set(_add_sources_list_dir ${CMAKE_CURRENT_LIST_DIR})

# This function initializes global variables
function(_initialize BOARD DEVICE)
    _set_series(${DEVICE})
    _set_line(${DEVICE})
    _set_openocd_target(${DEVICE})
    set(BOARD ${BOARD} CACHE STRING "Board")
    set(STM32_SDK_PATH ${_add_sources_list_dir}/../../stm32cube/stm32cube${SERIES} CACHE FILEPATH "Path to HAL and CMSIS libraries")
    set(STM32_BOARDS_PATH ${_add_sources_list_dir}/../../stm32cube/boards CACHE FILEPATH "Path to board specific files")
endfunction(_initialize)

function(_add_definitions)
    add_definitions(-D${LINE})
    add_definitions(-D${BOARD})
endfunction(_add_definitions)

function(_generate_cmsis_library BOARD DEVICE)
    set(CMSIS_SRCS
        ${STM32_SDK_PATH}/cmsis/device/src/startup/startup_${LINE}.s
        ${STM32_SDK_PATH}/cmsis/device/src/system_stm32${SERIES}xx.c)
    set(CMSIS_INCLUDE_DIRS
        ${STM32_SDK_PATH}/cmsis/include
        ${STM32_SDK_PATH}/cmsis/device/include)
    add_library(cmsis
        ${CMSIS_SRCS})
    target_include_directories(cmsis
        PUBLIC ${CMSIS_INCLUDE_DIRS})
endfunction(_generate_cmsis_library)

function(_generate_hal_libraries BOARD DEVICE)
    add_library(hal_init STATIC
        ${STM32_SDK_PATH}/hal_drivers/src/stm32${SERIES}xx_hal.c)
    target_include_directories(hal_init
        PUBLIC ${STM32_SDK_PATH}/hal_drivers/include
        PUBLIC ${STM32_BOARDS_PATH}/${BOARD}
        PUBLIC ${STM32_SDK_PATH}/cmsis/device/include
        PUBLIC ${STM32_SDK_PATH}/cmsis/include)
    foreach(driver cortex flash gpio spi i2c adc can cec crc dac dma rcc rtc sd uart usart)
        add_library(hal_${driver} STATIC
            ${STM32_SDK_PATH}/hal_drivers/src/stm32${SERIES}xx_hal_${driver}.c)
        target_include_directories(hal_${driver}
            PUBLIC ${STM32_SDK_PATH}/hal_drivers/include
            PUBLIC ${STM32_BOARDS_PATH}/${BOARD}
            PUBLIC ${STM32_SDK_PATH}/cmsis/device/include
            PUBLIC ${STM32_SDK_PATH}/cmsis/include)
    endforeach(driver)
endfunction(_generate_hal_libraries)

# This is not a good way to set these parameters
# But I'm not trying to support every device,
# it's a fine hack for now

# Sets the device series e.g. F1, F2, F3, or F4
# Parameters:
#   DEVICE - e.g. STM32F11RE
function(_set_series DEVICE)
    string(REGEX MATCH [LF][123456789] SERIES ${DEVICE})
    set(SERIES ${SERIES} CACHE STRING "STM32 Device Series")
endfunction(_set_series)

# Sets the device line e.g. STM32F411xE
# Parameters:
#   DEVICE - e.g. STM32F411RE
function(_set_line DEVICE)
    if(${DEVICE} STREQUAL STM32F411RE)
        set(LINE STM32F411xE CACHE STRING "STM32 Line")
    endif(${DEVICE} STREQUAL STM32F411RE)
endfunction(_set_line)

# Sets the name of the configuration file describing
# the target to openocd
function(_set_openocd_target DEVICE)
    if(${DEVICE} STREQUAL STM32F411RE)
        set(OPENOCD_TARGET stm32f4x CACHE STRING "STM32 Line")
    endif(${DEVICE} STREQUAL STM32F411RE)
endfunction(_set_openocd_target)