set(STM32_SDK_PATH "${CMAKE_CURRENT_LIST_DIR}/../../stm32cube/stm32cubef4")

function(_generate_startup_library BOARD DEVICE)
    _get_series(SERIES ${DEVICE})
    _get_line(LINE ${DEVICE})
    add_definitions(-D${LINE})
    set(CMSIS_SRCS
        ${STM32_SDK_PATH}/cmsis/device/src/startup/startup_${LINE}.s
        ${STM32_SDK_PATH}/cmsis/device/src/system_stm32${SERIES}xx.c)
    set(CMSIS_INCLUDE_DIRS
        ${STM32_SDK_PATH}/cmsis/include
        ${STM32_SDK_PATH}/cmsis/device/include)
    add_library(hal_startup
        ${CMSIS_SRCS})
    target_include_directories(hal_startup
        PUBLIC ${CMSIS_INCLUDE_DIRS})
endfunction(_generate_startup_library)

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