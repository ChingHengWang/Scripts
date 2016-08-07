

#define USE_STDPERIPH_DRIVER
#include "stm32f4xx.h"
 

//Quick hack, approximately 1ms delay
void ms_delay(int ms)
{
   while (ms-- > 0) {
      volatile int x=5971;
      while (x-- > 0)
         __asm("nop");
   }
}



//Flash orange LED at about 1hz
int main(void)
{
/* RCC_AHB1ENR 
   RCC AHB1 peripheral clock register
   Bit 3 GPIOD ENABLE
*/
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;  // enable the clock to GPIOD
    __asm("dsb");                         // stall instruction pipeline, until instruction completes, as
                                          //    per Errata 2.1.13, "Delay after an RCC peripheral clock enabling"
//    GPIOD->MODER = (1 << 26);             // set pin 13 to be general purpose output
    GPIOD->MODER &= 0x00FFFFFF;
    GPIOD->MODER |= 0x40000000;             // set pin 15 to be general purpose output
    GPIOD->MODER |= 0x10000000;             // set pin 14 to be general purpose output
    GPIOD->MODER |= 0x4000000;              // set pin 13 to be general purpose output
    GPIOD->MODER |= 0x1000000;              // set pin 12 to be general purpose output




/* use ODR
   ODR is output data register, it's 16bit register
   Bits 31:16 Reserved 
   Bits 15:0 ODRy: Port output data
   bit set and reset register for bitwise write access to GPIOx_ODR

*/
    for (;;) {
       ms_delay(500);
       GPIOD->ODR ^= (1 << 15);           // Toggle the pin 
       ms_delay(500);
       GPIOD->ODR ^= (1 << 14);           // Toggle the pin 
       ms_delay(500);
       GPIOD->ODR ^= (1 << 13);           // Toggle the pin 
       ms_delay(500);
       GPIOD->ODR ^= (1 << 12);           // Toggle the pin 

    }
}
