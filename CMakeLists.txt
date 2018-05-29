cmake_minimum_required(VERSION 3.7.1)

set(CMAKE_TOOLCHAIN_FILE cmake/STM32Toolchain.cmake)

project(STM32Example C CXX ASM)

add_subdirectory(example)