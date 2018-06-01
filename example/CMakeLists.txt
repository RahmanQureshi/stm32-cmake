set(PROGRAMMER stlink-v2-1 CACHE STRING "Debug interface device")

create_firmware_target(blink NUCLEO_F411RE STM32F411RE
    SOURCES
        app.cpp
        gpio.c
    INCLUDE_DIRS
    DEVICE_DRIVERS
    MODULES
    LIBS)