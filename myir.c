//********************************************************************
//
//      KEY Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"

/*  Variate ////////////////////////////////////////////////////////////////*/
//uint8_t  VS1838_Data=0;           //红外按键的值
uint8_t  VS1838_receive_ok=0;     //红外接收完成标志
uint32_t VS838_Receive_Data=0;    //32位数据

uint8_t  VS1838_Status=0;           //红外接收处理状态
static uint8_t  VS1838_Receive_Count=0;    //红外接收数据位计数
/*******************************************************************************
 * 函数名：VS1838ReceiveHandle(uint16_t capdata)
 * 描述  ：系统初始化函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void VS1838ReceiveHandle(uint16_t capdata)
{
    switch(VS1838_Status) {
    case 0: //引导码 9ms + 4.5ms    13.5
        if((capdata >= 8500)&&(capdata <= 12500)) { //272E  10000
            VS1838_Status = 1;
        } else {
            VS1838_Status = 0;
            VS1838_Receive_Count = 0;
        }
        break;
    case 1: //开始32位数据的接收
        if((capdata>=2000)&&(capdata<=2500)) { //间隔1.12ms ->0   0x08AC  2200
            VS838_Receive_Data=VS838_Receive_Data<<1;
            VS1838_Receive_Count++;
        } else if((capdata >= 4000)&&(capdata <= 5000)) { //间隔2.25ms ->1   0x112F 4500
            VS838_Receive_Data=VS838_Receive_Data<<1;
            VS838_Receive_Data=VS838_Receive_Data|0x0001;
            VS1838_Receive_Count++;
        } else {
            VS1838_Status = 0;
            VS838_Receive_Data = 0;
            VS1838_Receive_Count = 0;
        }
        //超出接收数据位数，接收下一个
        while(VS1838_Receive_Count == 32) {
            VS1838_receive_ok = 1;//红外接收完成
            VS1838_Status = 0;
            VS1838_Receive_Count = 0;
            break;
        }
        break;
    default : { //缺省项
        //OUTPUT_L;
        VS1838_Status=0;
    }
    break;
    }
}
/*******************************************************************************
 * 函数名：VS1838_Process()
 * 描述  ：获取返回值
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 ******************************************************************************/
uint8_t VS1838_Process(void)
{
    uint8_t Address_H,Address_L;       //地址码,地址反码
    uint8_t Data_H,Data_L;             //数据码,数据反码

    if(VS1838_receive_ok==1) {        //接收完成
        Address_H=VS838_Receive_Data>>24;                //得到地址码
        Address_L=(VS838_Receive_Data>>16)&0xff;         //得到地址反码
        if((Address_H==(uint8_t)~Address_L)) { //检验遥控识别码(ID)及地址
            Data_H=VS838_Receive_Data>>8;              //得到数据码
            Data_L=VS838_Receive_Data;                 //得到数据反码
            if(Data_H==(uint8_t)~Data_L) {               //接收数据码正确
                //VS_DATA=VS838_Receive_Data;                      //正确键值
                Write_EEPROM_u8(0X00,Address_H);
                Write_EEPROM_u8(0X01,Address_L);
                Write_EEPROM_u8(0X02,Data_H);
                Write_EEPROM_u8(0X03,Data_L);
                IR_DATA_t = VS838_Receive_Data;
                VS1838_Status=0;
                VS838_Receive_Data=0;
                VS1838_receive_ok=0;
                return 1;
            }
        }
    }
    return  0;
}
/*******************************************************************************
 * 函数名: IRead_IRData()
 * 描述  ：读取DATA数据
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 ******************************************************************************/
uint32_t Read_IRData(void)
{
    uint32_t data_t=0;
    uint8_t Address_H,Address_L;       //地址码,地址反码
    uint8_t Data_H,Data_L;             //数据码,数据反码

    Address_H = Read_EEPROM_u8(0x00);
    Address_L = Read_EEPROM_u8(0x01);
    Data_H = Read_EEPROM_u8(0x02);
    Data_L = Read_EEPROM_u8(0x03);
    data_t = (uint32_t)( ( (uint32_t)(((uint16_t)Address_H<<8)|Address_L) << 16 )|( ((uint16_t)Data_H << 8) | Data_L ) );
    return data_t;
}

/*******************************************************************************
 * 函数名：IR_SEND(uint32_t irdata)
 * 描述  ：红外发射函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 ******************************************************************************/
void Send_High(unsigned int nus)
{
    num = nus/15;
    count=0;
    send_flag = 0;
    flag_senf=1;
    TIM2_ENABLE;
    while(flag_senf);
    IR_L;
}

void Send_Low(unsigned int nus)
{
    IR_L;
    Delay_xus(nus);
}
void IR_SEND(uint32_t irdata)
{
    uint8_t i=0;

    Send_High(8300);
    Send_Low(900);
    for(i=0; i<32; i++) {
        if(irdata & 0x80000000) { //1
            Send_High(560);
            Send_Low(338);
        } else { //0
            Send_High(560);
            Send_Low(112);
        }
        irdata <<= 1;
    }
    Send_High(560);
    Send_Low(0);
}



