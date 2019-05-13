//********************************************************************
//
//      IR Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#ifndef __MYIR_H
#define __MYIR_H


//extern uint8_t  VS1838_Data;      //红外按键的值
extern uint8_t  VS1838_receive_ok;       //红外接收完成标志
extern uint32_t VS838_Receive_Data;      //32位数据
extern uint8_t  VS1838_Status;
extern uint32_t IR_DATA_t;


uint32_t Read_IRData(void);
void VS1838ReceiveHandle(uint16_t capdata);
uint8_t VS1838_Process(void);
void IR_SEND(uint32_t irdata);

#endif



