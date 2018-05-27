function(create_firmware_target NAME BOARD DEVICE)
    cmake_parse_arguments(firmware_args "" "" "SOURCES;INCLUDE_DIRS;DEVICE_DRIVERS;MODULES;LIBS" ${ARGN})

    _set_paths(${DEVICE})
	_generate_cmsis_library(${BOARD} ${DEVICE})
    _generate_hal_libraries(${BOARD} ${DEVICE})

endfunction(create_firmware_target)