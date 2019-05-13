//********************************************************************
//
//      ADC Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"


/*******************************************************************************
 * 函数名：ADC_Init
 * 描述  ：ADC初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void ADC_Init(void)
{
    //配置端口为输入模拟
    TRISC0=1;
    ANSEL4=1;	//配置模拟输入
    //配置ADC模块
    //ADCON1
    DIVS=0;//选择时钟
    ADCS0=0;
    ADCS1=0;
    ADCS2=0;//时钟选择
    //ADCON0
    ADCON0=0B10000001;//右对齐 VDD AN0  使能ADC
    VCFG0=0;//VCFG1=0;//配置参考电压 VCFG1没有定义
    CHS0=0;
    CHS1=0;
    CHS2=1;//模拟通道选择5
    ADFM=1;	//1=右对齐，0=左对齐
    ADON=1;//ADC使能位 1=enable 0=disable

    Delay_xms(1);
    GO_DONE=1;//硬件清0，硬件置1 1=正在转换 0=转换完成
}
//获取10位的ADC值
uint16_t GetADCValue(void)
{
    uint16_t ADC_num=0;

    if(GO_DONE==0) { //ADC是否转换完成
        ADC_num=ADRESH;
        ADC_num=ADC_num<<8;
        ADC_num=ADC_num|ADRESL;
        GO_DONE=1;//软件置1，从新读ADC
    }
    return ADC_num;
}


/*******************************************************************************
 * 函数名：ExchChannel
 * 描述  ：ADC初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 * 说明  : 换通道时，延时10us-1ms
 ******************************************************************************/
void ExchChannel(unsigned char ch_temp)//模拟通道选择
{
    unsigned char adc_ch_temp;

    adc_ch_temp = ch_temp;
    adc_ch_temp = adc_ch_temp<<2;
    ADCON0 = (ADCON0&0xe3)|adc_ch_temp;
    __delay_ms(1);
    GO_DONE=1;//硬件清0，硬件置1 1=正在转换 0=转换完成
}
