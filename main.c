/****************************************************************************
*       Copyright (C), 北京四维拓智教育科技有限公司
*
*       MS83Fxx02B
*       V0.1
*       2017-12-04
*       Woody  QQ:2490006131
*Description  :      <-MS83F1602AS->
* 				        _________
* 				   VDD|1        16|VSS
*  PA7/OSC1/CLKI/T1CKI|2        15|PA0/AN0/C1IN+/ICSPCLK
*    PA6/OSC2/CLKO/T1G|3    M   14|PA1/AN1/C1IN-/ICSPDAT
* 			 PA5/MCLRB|4    S   13|PA2/AN2/C1OUT/T0CKI
*  	      PC3/P1C/PWM4|5    8   12|PA3/AN3/ATEST1
* 	  PC2/AN6/P1D/PWM5|6    3   11|PC0/AN4/C2IN+/P1F/Vref
* 	  PA4/ATEST0/Vregp|7        10|PC1/AN5/C2IN-/P1E/INT
*   PC5/CCP1/P1A/Vregn|8_________9|PC4/C2OUT/P1B/PWM3
*   4T模式
*****************************************************************************/
#include "MyInclude.h"
#include "MyEEProm.h"
#include "MyADC.h"
#include "MyKey.h"
#include "MyIR.h"
#include "MyTIMMER.h"

uint32_t IR_DATA_t=0;
uint16_t ADC_GET=0;


/*******************************************************************************
 * 函数名：main
 * 描述  ：系统主函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void main(void)
{
    System_init();
    GPIO_Init();
    Timer1_Init();
    Timer2_Init();
    ADC_Init();
    //PWM5_Init();
    EEPROM_Init();
    LED_Study_End();
    IR_L;
    IR_DATA_t = Read_IRData();
    if(IR_DATA_t == 0xFFFFFFFF)
        IR_DATA_t = 0x00FF906F;
    //0x00FF906F
    while(1) {
        Control();
    }
}


/*******************************************************************************
 * 函数名：Control
 * 描述  ：流程控制函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void Control(void)
{
    uint8_t i=0;

    if(isKeyPressed()) { //进入学习模式 0x00FF9867
        TMR1ON=1;
        VS1838_Status=0;
        VS838_Receive_Data=0;
        VS1838_receive_ok=0;
        while(!VS1838_Process()) {
            LED_STUDY=1;
        }
        TMR1ON=0;
        LED_STUDY=0;
    } else {
        for(i=0; i<5; i++)
            ADC_GET = GetADCValue();
        if(ADC_GET >= 512) {
            IR_SEND(IR_DATA_t);
            Delay_xms(100);
        } else {
            Delay_xms(20);
        }
    }
}




