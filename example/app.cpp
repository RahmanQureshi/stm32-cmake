#include <stdio.h>
extern "C" {
  #include "gpio.h"
  void HAL_Delay(uint32_t Delay);
}

#ifdef NUCLEO_F411RE
#define LED_PORT PORTA
#define LED_PIN GPIO_PIN5
#else
#error Board was not selected or support for board needs to be added to blink app
#endif

static GPIO_t ld2 = {
  .port = LED_PORT,
  .pin = LED_PIN
};

extern "C" {
    int app_start();
}

int app_start()
{
    gpio_init(ld2, GPIO_OUTPUT_PP, GPIO_NO_PULL, GPIO_FREQ_LOW);
    for (;;)
    {
        // Note: \n is very important because outputs to streams are
        // buffered by default. Without \n, the stream will never be written
        printf("LED On\n");
        gpio_write(ld2, GPIO_HIGH);
        HAL_Delay(1000);
        printf("LED Off\n");
        gpio_write(ld2, GPIO_LOW);
        HAL_Delay(1000);
    }
}