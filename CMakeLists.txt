set(CMAKE_TOOLCHAIN_FILE cmake/STM32Toolchain.cmake)

cmake_minimum_required(VERSION 2.8)

project(STM32Example C CXX ASM)

create_firmware_target(blink NUCLEO_F411RE STM32F411RE
    SOURCES
    INCLUDE_DIRS
    DEVICE_DRIVERS
    MODULES
    LIBS)