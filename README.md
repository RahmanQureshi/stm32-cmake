# STM32 CMake

## Usage


## Adding Support for another Device
This section explains how to add support for another device.

1. Add the HAL and CMSIS libraries in stm32cube/stm32cubeYY directory (see stm32cubef4 as an example)
2. Add a linker script called device.ld in stm32cube/stm32cubeYY/ldscripts directory
3. Update the _get_line and _get_series functions in cmake/AddSources.cmake file

## Adding Support for another Board
1. Create a new directory board_name under stm32cube/boards
2. Add the main.c file and hal_conf.h file