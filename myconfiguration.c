//********************************************************************
//
//      ADC Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"



/*******************系统 初始化*********************/
/*******************************************************************************
 * 函数名：System_init
 * 描述  ：系统初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void System_init(void)
{
    OPTION  = 0x00;//BIT7使能上拉位，0=使能，1=禁止
    OSCCON  = 0x70;  //内部振荡器选择 16Mhz
    WDTCON  = 0x1E;  //BIT4~BIT1:看门狗复位时间512ms，bit0--1=开启，0=关闭
}
/*******************************************************************************
 * 函数名：GPIO_Init
 * 描述  ：GPIO初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void GPIO_Init(void)
{
    //TRISA 0=OUTPUT,1=INPUT
    TRISA0=0;
    TRISA1=0;
    TRISA2=0;
    TRISA3=0;
    TRISA4=0;
    TRISA5=0;
    TRISA6=0;
    TRISA7=0;
    //TRISC 0=OUTPUT,1=INPUT
    TRISC0=0;
    TRISC1=1;
    TRISC2=0;
    TRISC3=0;
    TRISC4=0;
    TRISC5=0;

    CM0=1;
    CM1=1;
    CM2=1;//比较器关闭，CxIN管脚为数字IO管脚

    //当弱上拉和弱下拉同时在这些 IO 打开时，弱下拉将被禁止，弱上拉起作用
    //ANSEL portA 1=模拟 0=数字
    ANSEL0=0;
    ANSEL1=0;
    ANSEL2=0;
    ANSEL3=0;
    ANSEL4=0;
    ANSEL5=0;
    ANSEL6=0;
    ANSEL7=0;
    //WPUA 1=使能上拉，0=禁止
    WPUA0=1;
    WPUA1=1;
    WPUA2=1;
    WPUA3=1;
    WPUA4=1;
    WPUA5=1;
    WPUA6=1;
    WPUA7=1;
    //WPUA 1=使能上拉，0=禁止
    WPUC0=0;
    WPUC1=1;
    WPUC2=1;
    WPUC3=0;
    WPUC4=0;
    WPUC5=0;
    //WPD 1=使能下拉，0=断开下拉
    WPDA4=0;
    WPDC1=0;
    WPDC2=0;
    WPDC3=0;
}

void Delay_xms(unsigned int x)  //死延时x毫秒
{
    unsigned int i;
    for(i=0; i<x; i++) {
        __delay_ms(1);
        //CLRWDT();
    }
}
void Delay_xus(unsigned int x)  //死延时x微妙
{
    unsigned int i;
    for(i=0; i<x; i++) {
        __delay_us(1);
    }
}

/*******************************************************************************
 * 函数名：LED_Study_End
 * 描述  ：LED效果
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void LED_Study_End(void)
{
    LED_STUDY = 1;
    Delay_xms(50);
    LED_STUDY = 0;
    Delay_xms(50);
    LED_STUDY = 1;
    Delay_xms(50);
    LED_STUDY = 0;
    Delay_xms(50);
    LED_STUDY = 1;
    Delay_xms(50);
    LED_STUDY = 0;
    Delay_xms(50);
}


