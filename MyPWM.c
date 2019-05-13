//********************************************************************
//
//      PWM Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"



void PWM5_Init(void)
{
    TRISC2=1;
    //PWMxCR0  ��������
    P5INTS=0;
    P5PER0=0;
    P5PER1=0;
    P5PER2=0;//����ѡ��λ 6
    P5CKSRC0=1;
    P5CKSRC1=0;
    P5CKSRC2=0;//ʱ��ѡ��λ
    P5BZR=0;//0=pwm��1=BUZZER
    //PWMxCR1
    P5EN=1;//1=pwm/buzzerģʽ��0=��ʱ��ģʽ
    P5POL=0;//0=high,1=low
    TMR5PS0=1;
    TMR5PS1=0;
    TMR5PS2=0;//Ԥ��Ƶ 2
    TMR5ON=0;//0=off��1=on
    TMR5IE=0;//0=off,1=on
    TMR5IF=0;//0=OFF,1=ON

    T5CKDIV=12;

    TMR5H=0;//��4λΪR3H
    PR5L=8;//����ռ�ձ�

    TMR5IF=0;//0=OFF,1=ON
    TMR5ON=1;//0=off��1=on
    while(TMR5IF==0) CLRWDT();
    TRISC2=0;
    //���� ��T3CKDIV+1��/16000000*2^(����λ)*(Ԥ��Ƶ)=41/16000000*2^6*4=0.656
    //ռ�ձ� ��T3CKDIV+1��/16000000*(Ԥ��Ƶ)*PR =41/16000000*4*200 = 2.05
}

void PWM4_Init(void)
{
    TRISC3 = 1;
    //PWMxCR0  ��������
    P4INTS=0;
    P4PER0=1;
    P4PER1=0;
    P4PER2=1;//����ѡ��λ
    P4CKSRC0=1;
    P4CKSRC1=0;
    P4CKSRC2=0;//ʱ��ѡ��λ
    P4BZR=0;//0=pwm��1=BUZZER
    //PWMxCR1
    P4EN=1;//1=pwm/buzzerģʽ��0=��ʱ��ģʽ
    P4POL=0;//0=high,1=low
    TMR4PS0=1;
    TMR4PS1=1;
    TMR4PS2=0;//Ԥ��Ƶ
    TMR4ON=0;//0=off��1=on
    TMR4IE=0;//0=off,1=on
    TMR4IF=0;//0=OFF,1=ON

    T4CKDIV=20;

    TMR4H=0;//��4λΪR3H
    PR4L=200;//����ռ�ձ�


    TMR4IF=0;//0=OFF,1=ON
    TMR4ON=1;//0=off��1=on
    while(TMR4IF==0) CLRWDT();
    TRISC3 = 0;
}

void PWM3_Init(void)
{
    TRISC4=1;	//
    //PWMxCR0  ��������
    P3INTS=0; //�ж�ѡ��λ
    P3PER0=1;
    P3PER1=0;
    P3PER2=1;//����ѡ��λ
    P3CKSRC0=1;
    P3CKSRC1=0;
    P3CKSRC2=0;//ʱ��ѡ��λ
    P3BZR=0;//0=pwm��1=BUZZER
    //PWMxCR1
    P3EN=1;//1=pwm/buzzerģʽ��0=��ʱ��ģʽ
    P3POL=0;//0=high,1=low
    TMR3PS0=1;
    TMR3PS1=1;
    TMR3PS2=0;//Ԥ��Ƶ
    TMR3ON=0;//0=off��1=on
    TMR3IE=0;//0=off,1=on
    TMR3IF=0;//0=OFF,1=ON

    T3CKDIV=20;	//ʱ��Ƶ��

    TMR3H=0;//��4λΪR3H
    PR3L=200;//����ռ�ձ�


    TMR3IF=0;//0=OFF,1=ON
    TMR3ON=1;//0=off��1=on
    while(TMR3IF==0) CLRWDT();
    TRISC4=0;
}

