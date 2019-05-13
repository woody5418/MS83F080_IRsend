//********************************************************************
//
//      KEY Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#ifndef __MYTIMMER_H
#define __MYTIMMER_H

extern uint16_t count;
extern uint8_t send_flag;
extern uint8_t flag_senf;
extern uint16_t num;


#define  TIM1_ENABLE   TMR1ON = 1
#define  TIM1_DISABLE  TMR1ON = 0
#define  TIM2_ENABLE   TMR2ON = 1
#define  TIM2_DISABLE  TMR2ON = 0


void Timer1_Init(void);
void Timer2_Init(void);
void Clean_countReg(void);
uint16_t GetCCP1Value(void);

#endif