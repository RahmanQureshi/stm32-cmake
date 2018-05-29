function(create_firmware_target NAME BOARD DEVICE)
    cmake_parse_arguments(firmware_args "" "USE_FREE_RTOS" "SOURCES;INCLUDE_DIRS;DEVICE_DRIVERS;MODULES;LIBS" ${ARGN})

    _set_paths(${DEVICE})

	_generate_cmsis_library(${BOARD} ${DEVICE})
    _generate_hal_libraries(${BOARD} ${DEVICE})

    add_executable(${NAME}
        ${firmware_args_SOURCES}
        ${STM32_BOARDS_PATH}/${BOARD}/main.c
        ${STM32_SDK_PATH}/interrupt_handlers/${DEVICE}_it.c)
    target_include_directories(${NAME}
        PUBLIC ${STM32_SDK_PATH}/hal_drivers/include
        PUBLIC ${STM32_BOARDS_PATH}/${BOARD}
        PUBLIC ${STM32_SDK_PATH}/cmsis/device/include
        PUBLIC ${STM32_SDK_PATH}/cmsis/include
        PUBLIC ${STM32_SDK_PATH}/../common/include)
    target_link_libraries(${NAME}
        cmsis
        hal_init
        hal_rcc
        hal_cortex
        hal_gpio)
    set_target_properties(${NAME} PROPERTIES SUFFIX ".elf")
    set(LINKER_FILE "${STM32_SDK_PATH}/ldscripts/${DEVICE}.ld")
    set_target_properties(${NAME} PROPERTIES LINK_FLAGS "-T ${LINKER_FILE}")

endfunction(create_firmware_target)