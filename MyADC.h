//********************************************************************
//
//      KEY Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#ifndef __MYADC_H
#define __MYADC_H


void ADC_Init(void);
uint16_t GetADCValue(void);
void ExchChannel(unsigned char ch_temp);//模拟通道选择



#endif