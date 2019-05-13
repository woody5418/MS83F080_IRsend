#ifndef __MYINCLUDE_H
#define __MYINCLUDE_H
#include "syscfg.h"


/*******************∫Í∂®“Â********************/
#define _XTAL_FREQ 		16000000		//4T
#define EEpromStartAdd  0x00
//#define  u32            unsigned long int
//#define  u16            unsigned short int
//#define  u8             unsigned char
#define  uint8_t        unsigned char
#define  uint16_t       unsigned int
#define  uint32_t       unsigned long int

#define  KEY_STUDY       PC1  //PA3->PC1
#define  LED_STUDY       PC3

#define  IR_H            PC2 = 1
#define  IR_L            PC2 = 0
#include "MyEEProm.h"
#include "MyADC.h"
#include "MyKey.h"
#include "MyIR.h"
#include "MyTIMMER.h"

void System_init(void);
void GPIO_Init(void);
void Delay_xms(unsigned int x);//À¿—” ±x∫¡√Î
void Delay_xus(unsigned int x);
void LED_Study_End(void);
void Control(void);
#endif




