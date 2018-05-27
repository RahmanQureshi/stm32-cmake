set(_add_sources_list_dir ${CMAKE_CURRENT_LIST_DIR})

# Sets STM32_SDK_PATH and STM32_BOARDS_PATH in the cache given the device.
function(_set_paths DEVICE)
    _get_series(SERIES ${DEVICE})
    _get_line(LINE ${DEVICE})
    set(STM32_SDK_PATH ${_add_sources_list_dir}/../../stm32cube/stm32cube${SERIES} CACHE FILEPATH "Path to HAL and CMSIS libraries")
    set(STM32_BOARDS_PATH ${_add_sources_list_dir}/../../stm32cube/boards CACHE FILEPATH "Path to board specific files")
endfunction(_set_paths)

function(_generate_cmsis_library BOARD DEVICE)
    _get_series(SERIES ${DEVICE})
    _get_line(LINE ${DEVICE})
    add_definitions(-D${LINE})
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
    _get_series(SERIES ${DEVICE})
    _get_line(LINE ${DEVICE})
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

# Returns the device series e.g. F1, F2, F3, or F4
# Parameters:
#   DEVICE - e.g. STM32F11RE
#   VAR_NAME - variable name to set
function(_get_series VAR_NAME EVICE)
    string(REGEX MATCH F[123456789] SERIES ${DEVICE})
    set(${VAR_NAME} ${SERIES} PARENT_SCOPE)
endfunction(_get_series)

# Returns the device line. e.g. STM32F411xE
# Parameters:
#   DEVICE - e.g. STM32F411RE
#   VAR_NAME - variable name to set
function(_get_line VAR_NAME DEVICE)
    if(${DEVICE} STREQUAL STM32F411RE)
        set(${VAR_NAME} STM32F411xE PARENT_SCOPE)
    endif(${DEVICE} STREQUAL STM32F411RE)
endfunction(_get_line)