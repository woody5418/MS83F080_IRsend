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
uint16_t num=0;   //����ֵ
/*******************************************************************************
 * ��������interrupt ISR
 * ����  ���жϺ���
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/
void interrupt ISR(void)
{
    Cycle_CCPR=0;
    if(CCP1IE&CCP1IF == 1) {
        CCP1IF = 0; //����жϱ�־λ
        Cycle_CCPR = GetCCP1Value(); //��ȡ��׽ֵ
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
 * ��������Timer1_Init
 * ����  ��ϵ��ʱ��2��ʼ������
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/
void Timer1_Init(void)
{
    //T1CON
    T1CKPS1 = 0;
    T1CKPS0 = 1;  //Ԥ��Ƶ��1:8    5us����һ��
    T1OSCEN = 0;//�ر�TRM1����
    CCP1CON = 0x05;//CCP1M3 = 0;CCP1M2 = 1;CCP1M1 = 0;CCP1M0 = 0; //��׽ģʽ��ÿ���½��أ�CCP1IF λ�� 1��
    TMR1CS = 0X00;  //�ڲ�ʱ��

    PEIE = 1;   //�����ж�ʹ�� 1=enble 0=disable
    CCP1IE=1;   //����CCP1�ж�
    CCP1IF=0;
    TRISC5 = 1;  //����Ϊ����ģʽ
    TMR1H=0;
    TMR1L=0;
    GIE=1; //ȫ���ж�ʹ�� 1=enble 0=disable
    TMR1ON = 0;
}
/*******************************************************************************
 * ��������Timer2_Init
 * ����  ��ϵ��ʱ��2��ʼ������
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/
void Timer2_Init(void)
{
    //T2CON
    TOUTPS0=0;
    TOUTPS1=0;
    TOUTPS2=0;
    TOUTPS3=0;//����������Ƶ��1~16
    T2CKPS0=1;
    T2CKPS1=0;//ʱ��Ԥ��Ƶ��00=1 01=4 1x=16

    TMR2=0;//��ʱ��2����������ֵ
    PR2=12;//��ʱ��2���ڱȽϼĴ��� PR2��ֵҪ����TMR2  T=(1/16MHz)*16*4*25 = 0.1ms

    //INTCON
    PEIE=1;//�����ж�ʹ�� 1=enble 0=disable
    TMR2IE=1;//TMR2��PR2�Ƚ�����ж�ʹ��λ 1=enable 0=disable
    TMR2IF=0;//TMR2��PR2�Ƚ�����жϱ�־λ Ӳ����1�������0
    GIE=1; //ȫ���ж�ʹ�� 1=enble 0=disable
    TMR2ON=1;//�򿪶�ʱ��2ʹ��λ
}
//��ȡ����ֵ
uint16_t GetCCP1Value(void)
{
    uint16_t values=0;

    values = CCPR1H;
    values = values<<8;
    values = values|CCPR1L;
    return values;
}
//�������ֵ ��һ��Ϊ��ֵ
void Clean_countReg(void)
{
    TMR1H=0;
    TMR1L=0;
}

