//********************************************************************
//
//      KEY Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"


uint8_t send_flag=0;
uint8_t flag_senf=0;
uint16_t Cycle_CCPR=0;;
uint16_t count=0;
uint16_t num=0;   //数组值
/*******************************************************************************
 * 函数名：interrupt ISR
 * 描述  ：中断函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void interrupt ISR(void)
{
    Cycle_CCPR=0;
    if(CCP1IE&CCP1IF == 1) {
        CCP1IF = 0; //清除中断标志位
        Cycle_CCPR = GetCCP1Value(); //获取捕捉值
        VS1838ReceiveHandle(Cycle_CCPR);
        Clean_countReg();
    } else if(TMR2IE&&TMR2IF) {
        TMR2IF=0;
        count++;
        if(count >= num) {
            TIM2_DISABLE;
            flag_senf = count=0;
        }
        if(send_flag ==0) {
            send_flag=1;
            IR_H;
        } else {
            send_flag=0;
            IR_L;
        }
    }
}
/*******************************************************************************
 * 函数名：Timer1_Init
 * 描述  ：系定时器2初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void Timer1_Init(void)
{
    //T1CON
    T1CKPS1 = 0;
    T1CKPS0 = 1;  //预分频比1:8    5us计数一次
    T1OSCEN = 0;//关闭TRM1振荡器
    CCP1CON = 0x05;//CCP1M3 = 0;CCP1M2 = 1;CCP1M1 = 0;CCP1M0 = 0; //捕捉模式，每个下降沿（CCP1IF 位置 1）
    TMR1CS = 0X00;  //内部时钟

    PEIE = 1;   //外设中断使能 1=enble 0=disable
    CCP1IE=1;   //允许CCP1中断
    CCP1IF=0;
    TRISC5 = 1;  //配置为输入模式
    TMR1H=0;
    TMR1L=0;
    GIE=1; //全局中断使能 1=enble 0=disable
    TMR1ON = 0;
}
/*******************************************************************************
 * 函数名：Timer2_Init
 * 描述  ：系定时器2初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void Timer2_Init(void)
{
    //T2CON
    TOUTPS0=0;
    TOUTPS1=0;
    TOUTPS2=0;
    TOUTPS3=0;//设置输出后分频比1~16
    T2CKPS0=1;
    T2CKPS1=0;//时钟预分频比00=1 01=4 1x=16

    TMR2=0;//定时器2计数器付初值
    PR2=12;//定时器2周期比较寄存器 PR2的值要大于TMR2  T=(1/16MHz)*16*4*25 = 0.1ms

    //INTCON
    PEIE=1;//外设中断使能 1=enble 0=disable
    TMR2IE=1;//TMR2与PR2比较相等中断使能位 1=enable 0=disable
    TMR2IF=0;//TMR2与PR2比较相等中断标志位 硬件置1，软件清0
    GIE=1; //全局中断使能 1=enble 0=disable
    TMR2ON=1;//打开定时器2使能位
}
//获取脉宽值
uint16_t GetCCP1Value(void)
{
    uint16_t values=0;

    values = CCPR1H;
    values = values<<8;
    values = values|CCPR1L;
    return values;
}
//清除计数值 第一个为误值
void Clean_countReg(void)
{
    TMR1H=0;
    TMR1L=0;
}

