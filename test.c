#include <gpio.h>

pin_t led = MAKE_PIN(GPIO_PORT_G, 13);
  
int main() 
{
    gpio_config(led, pin_dir_write);
  
    gpio_set(led, 1);

    return 0;
}

