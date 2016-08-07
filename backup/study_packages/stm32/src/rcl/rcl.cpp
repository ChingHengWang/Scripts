#include "rcl.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"



void spinLoop(void (*callback)(void), unsigned int period)
{
/*
 portTickType xLastWakeTime=xTaskGetTickCount(); \
                                        while(1) \
                                        { \
                                        code \
                                        vTaskDelayUntil(&xLastWakeTime, period); \
                                   }
*/

	LOOP(period,//Define in rcl.h
	// start while
	callback();
	// end while
	)
}
