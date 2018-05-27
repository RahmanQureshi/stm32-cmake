function(create_firmware_target NAME BOARD DEVICE)
    cmake_parse_arguments(firmware_args "" "" "SOURCES;INCLUDE_DIRS;DEVICE_DRIVERS;MODULES;LIBS" ${ARGN})

	_generate_startup_library(NUCLEO_F411 STM32F411RE)

endfunction(create_firmware_target)