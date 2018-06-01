#include <stdint.h>

typedef enum {
    PORTA, PORTB, PORTC, PORTD, PORTE, PORTF, PORTG, PORTH, PORTI
} GPIOPort_t;

typedef enum {
    GPIO_PIN0 = 0x0001,
    GPIO_PIN1 = 0x0002,
    GPIO_PIN2 = 0x0004,
    GPIO_PIN3 = 0x0008,
    GPIO_PIN4 = 0x0010,
    GPIO_PIN5 = 0x0020,
    GPIO_PIN6 = 0x0040,
    GPIO_PIN7 = 0x0080,
    GPIO_PIN8 = 0x0100,
    GPIO_PIN9 = 0x0200,
    GPIO_PIN10 = 0x0400,
    GPIO_PIN11 = 0x0800,
    GPIO_PIN12 = 0x1000,
    GPIO_PIN13 = 0x2000,
    GPIO_PIN14 = 0x4000,
    GPIO_PIN15 = 0x8000
} GPIOPin_t;

typedef enum {
    GPIO_INPUT, GPIO_OUTPUT_PP, GPIO_OUTPUT_OD
} GPIOMode_t;

typedef enum {
    GPIO_NO_PULL, GPIO_PULL_UP, GPIO_PULL_DOWN
} GPIOPull_t;

typedef enum {
    GPIO_FREQ_LOW, GPIO_FREQ_MEDIUM, GPIO_FREQ_HIGH, GPIO_FREQ_VERY_HIGH
} GPIOSpeed_t;

typedef enum {
    GPIO_LOW, GPIO_HIGH
} GPIOState_t;

typedef struct {
    GPIOPort_t port;
    GPIOPin_t pin;
} GPIO_t;

int8_t gpio_init(GPIO_t gpio, GPIOMode_t mode, GPIOPull_t pull, GPIOSpeed_t speed);

int8_t gpio_write(GPIO_t gpio, GPIOState_t state);