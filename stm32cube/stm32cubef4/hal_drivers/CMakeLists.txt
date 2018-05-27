cmake_minimum_required(VERSION 2.8.8)

add_library(hal_init STATIC
	src/stm32f4xx_hal.c)
target_include_directories(hal_init
	PUBLIC include)
foreach(peripheral cortex flash gpio spi i2c adc can cec crc dac dma rcc rtc sd uart usart)
	add_library(hal_${peripheral} STATIC
		src/stm32f4xx_hal_${peripheral}.c)
	target_include_directories(hal_${peripheral} 
		PUBLIC include)
endforeach(peripheral)