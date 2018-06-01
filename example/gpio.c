#include "gpio.h"
#include <stm32f4xx_hal_gpio.h>
#include <stm32f4xx_hal_rcc.h>

#ifdef STM32F405xx
static GPIO_TypeDef* ports[] = {GPIOA, GPIOB, GPIOC, GPIOD, GPIOE, GPIOF, GPIOG, GPIOH, GPIOI};
#elif STM32F411xE
static GPIO_TypeDef* ports[] = {GPIOA, GPIOB, GPIOC, GPIOD, GPIOE, GPIOH};
#elif
#error Device was not selected or device support needs to be added.
#endif

static uint16_t modes[] = {GPIO_MODE_INPUT, GPIO_MODE_OUTPUT_PP, GPIO_MODE_OUTPUT_OD};
static uint16_t pulls[] = {GPIO_NOPULL, GPIO_PULLUP, GPIO_PULLDOWN};
static uint16_t speeds[] = {GPIO_SPEED_FREQ_LOW, GPIO_SPEED_FREQ_MEDIUM, GPIO_SPEED_FREQ_HIGH, GPIO_SPEED_FREQ_VERY_HIGH};

int8_t gpio_init(GPIO_t gpio, GPIOMode_t mode, GPIOPull_t pull, GPIOSpeed_t speed)
{
    GPIO_InitTypeDef initTypeDef = {
        .Pin = gpio.pin,
        .Mode = modes[mode],
        .Pull = pulls[pull],
        .Speed = speeds[speed] 
    };
    __HAL_RCC_GPIOA_CLK_ENABLE();
    HAL_GPIO_Init(ports[gpio.port], &initTypeDef);
    return 0;
}

int8_t gpio_write(GPIO_t gpio, GPIOState_t state)
{
    HAL_GPIO_WritePin(ports[gpio.port], gpio.pin, state);
    return 0;
}