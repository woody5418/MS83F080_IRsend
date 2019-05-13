//********************************************************************
//
//      KEY Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"

/*  Variate ////////////////////////////////////////////////////////////////*/
//uint8_t  VS1838_Data=0;           //���ⰴ����ֵ
uint8_t  VS1838_receive_ok=0;     //���������ɱ�־
uint32_t VS838_Receive_Data=0;    //32λ����

uint8_t  VS1838_Status=0;           //������մ���״̬
static uint8_t  VS1838_Receive_Count=0;    //�����������λ����
/*******************************************************************************
 * ��������VS1838ReceiveHandle(uint16_t capdata)
 * ����  ��ϵͳ��ʼ������
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/
void VS1838ReceiveHandle(uint16_t capdata)
{
    switch(VS1838_Status) {
    case 0: //������ 9ms + 4.5ms    13.5
        if((capdata >= 8500)&&(capdata <= 12500)) { //272E  10000
            VS1838_Status = 1;
        } else {
            VS1838_Status = 0;
            VS1838_Receive_Count = 0;
        }
        break;
    case 1: //��ʼ32λ���ݵĽ���
        if((capdata>=2000)&&(capdata<=2500)) { //���1.12ms ->0   0x08AC  2200
            VS838_Receive_Data=VS838_Receive_Data<<1;
            VS1838_Receive_Count++;
        } else if((capdata >= 4000)&&(capdata <= 5000)) { //���2.25ms ->1   0x112F 4500
            VS838_Receive_Data=VS838_Receive_Data<<1;
            VS838_Receive_Data=VS838_Receive_Data|0x0001;
            VS1838_Receive_Count++;
        } else {
            VS1838_Status = 0;
            VS838_Receive_Data = 0;
            VS1838_Receive_Count = 0;
        }
        //������������λ����������һ��
        while(VS1838_Receive_Count == 32) {
            VS1838_receive_ok = 1;//����������
            VS1838_Status = 0;
            VS1838_Receive_Count = 0;
            break;
        }
        break;
    default : { //ȱʡ��
        //OUTPUT_L;
        VS1838_Status=0;
    }
    break;
    }
}
/*******************************************************************************
 * ��������VS1838_Process()
 * ����  ����ȡ����ֵ
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
 ******************************************************************************/
uint8_t VS1838_Process(void)
{
    uint8_t Address_H,Address_L;       //��ַ��,��ַ����
    uint8_t Data_H,Data_L;             //������,���ݷ���

    if(VS1838_receive_ok==1) {        //�������
        Address_H=VS838_Receive_Data>>24;                //�õ���ַ��
        Address_L=(VS838_Receive_Data>>16)&0xff;         //�õ���ַ����
        if((Address_H==(uint8_t)~Address_L)) { //����ң��ʶ����(ID)����ַ
            Data_H=VS838_Receive_Data>>8;              //�õ�������
            Data_L=VS838_Receive_Data;                 //�õ����ݷ���
            if(Data_H==(uint8_t)~Data_L) {               //������������ȷ
                //VS_DATA=VS838_Receive_Data;                      //��ȷ��ֵ
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
 * ������: IRead_IRData()
 * ����  ����ȡDATA����
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
 ******************************************************************************/
uint32_t Read_IRData(void)
{
    uint32_t data_t=0;
    uint8_t Address_H,Address_L;       //��ַ��,��ַ����
    uint8_t Data_H,Data_L;             //������,���ݷ���

    Address_H = Read_EEPROM_u8(0x00);
    Address_L = Read_EEPROM_u8(0x01);
    Data_H = Read_EEPROM_u8(0x02);
    Data_L = Read_EEPROM_u8(0x03);
    data_t = (uint32_t)( ( (uint32_t)(((uint16_t)Address_H<<8)|Address_L) << 16 )|( ((uint16_t)Data_H << 8) | Data_L ) );
    return data_t;
}

/*******************************************************************************
 * ��������IR_SEND(uint32_t irdata)
 * ����  �����ⷢ�亯��
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
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



