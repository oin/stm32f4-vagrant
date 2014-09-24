#include <gpio.h>

pin_t led = MAKE_PIN(GPIO_PORT_G, 13);
pin_t led2 = MAKE_PIN(GPIO_PORT_G, 14);
  
int main() 
{
    gpio_config(led, pin_dir_write);
    gpio_config(led2, pin_dir_write);
  
    gpio_set(led, 1);
    gpio_set(led2, 1);

    return 0;
}

