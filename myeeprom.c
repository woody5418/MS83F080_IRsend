//********************************************************************
//
//      ADC Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"

/*******************EEPROM 初始化*********************/

//eeprom 初始化
void EEPROM_Init(void)
{
    Write_EEPROM_u8(0xFF,0xAA);			//在未使用到的随意一个地址写两次0xAA
    Write_EEPROM_u8(0xFF,0xAA);			//如果程序有读写EEPROM,此操作必须执行
}

//写EEPROM 数据  u16
void Write_EEPROM_u16(uint8_t EEAddress,uint16_t EEDatas)
{
    Write_EEPROM_u8(EEAddress,(EEDatas>>8)&0xff);
    Write_EEPROM_u8(EEAddress+1,EEDatas&0xff);
}
//读EEPROM 数据  u16
uint16_t Read_EEPROM_u16(uint8_t EEAddress)
{
    uint16_t EepromData=0;

    EepromData = Read_EEPROM_u8(EEAddress);
    EepromData = EepromData<<8;
    EepromData |= Read_EEPROM_u8(EEAddress+1);
    return 	EepromData;
}
//写EEPROM 数据  u8
void Write_EEPROM_u8(uint8_t EEAddress,uint8_t EEDatas)
{
    GIE = 0;		//写EEPROM必须关闭中断
    while(GIE) CLRWDT();	//等待GIE为0
    EEADR = EEAddress;
    EEDAT = EEDatas;
    EEIF = 0;
    EECON1 = 0x34;
    WR = 1;
    while(WR) CLRWDT();	//等待写EEPROM完成,如果有开启看门狗且看门狗溢出时间设置在小于等于2ms.
    //需要清狗,因为写EEPOM大概需要2ms的时间
    GIE = 1;
}
//读取EEPROM数据 u8
uint8_t Read_EEPROM_u8(uint8_t EEAddress)
{
    uint8_t EepromData=0;
    EEADR  = EEAddress;
    RD = 1;
    EepromData = EEDAT;
    RD = 0;
    return 	EepromData;
}






