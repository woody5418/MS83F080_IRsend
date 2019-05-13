//********************************************************************
//
//      KEY Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#ifndef __MYEEPROM_H
#define __MYEEPROM_H

void EEPROM_Init(void);
uint8_t Read_EEPROM_u8(uint8_t EEAddress);
uint16_t Read_EEPROM_u16(uint8_t EEAddress);
void Write_EEPROM_u8(uint8_t EEAddress,uint8_t EEDatas);
void Write_EEPROM_u16(uint8_t EEAddress,uint16_t EEDatas);

#endif

