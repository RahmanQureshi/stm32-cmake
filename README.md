# STM32 CMake

## Usage
See the example directory.

## Adding Support for another Device
This section explains how to add support for another device.

1. Add the HAL and CMSIS libraries in stm32cube/stm32cubeYY directory (see stm32cubef4 as an example)
2. Add a linker script called *device*.ld in stm32cube/stm32cubeYY/ldscripts directory
3. Update the \_get\_line and \_get\_series functions in cmake/AddSources.cmake file
4. Add device\_it.c to stm32cube/stm32cubeYY/interrupt_handlers

## Adding Support for another Board
1. Create a new directory board_name under stm32cube/boards
2. Add the main.c file and hal_conf.h file

## TODO
- Add FreeRTOS
    - Currently the USE\_FREE\_RTOS option will not compile the target