opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_System_init
	FNCALL	_main,_GPIO_Init
	FNCALL	_main,_Timer1_Init
	FNCALL	_main,_Timer2_Init
	FNCALL	_main,_ADC_Init
	FNCALL	_main,_EEPROM_Init
	FNCALL	_main,_LED_Study_End
	FNCALL	_main,_Read_IRData
	FNCALL	_main,_Control
	FNCALL	_Control,_isKeyPressed
	FNCALL	_Control,_VS1838_Process
	FNCALL	_Control,_GetADCValue
	FNCALL	_Control,_IR_SEND
	FNCALL	_Control,_Delay_xms
	FNCALL	_IR_SEND,_Send_High
	FNCALL	_IR_SEND,_Send_Low
	FNCALL	_Send_Low,_Delay_xus
	FNCALL	_LED_Study_End,_Delay_xms
	FNCALL	_ADC_Init,_Delay_xms
	FNCALL	_Send_High,___lwdiv
	FNCALL	_VS1838_Process,_Write_EEPROM_u8
	FNCALL	_Read_IRData,_Read_EEPROM_u8
	FNCALL	_EEPROM_Init,_Write_EEPROM_u8
	FNROOT	_main
	FNCALL	_ISR,_GetCCP1Value
	FNCALL	_ISR,_VS1838ReceiveHandle
	FNCALL	_ISR,_Clean_countReg
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_IR_DATA_t
	global	_VS838_Receive_Data
	global	_ADC_GET
	global	_Cycle_CCPR
	global	_count
	global	_VS1838_receive_ok
	global	_flag_senf
	global	_num
	global	_VS1838_Receive_Count
	global	_VS1838_Status
	global	_send_flag
	global	_PSTRCON
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	21
	global	_CCPR1H
_CCPR1H	set	20
	global	_CCPR1L
_CCPR1L	set	19
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_WDTCON
_WDTCON	set	24
	global	_ADFM
_ADFM	set	255
	global	_ADON
_ADON	set	248
	global	_CCP1IF
_CCP1IF	set	104
	global	_CHS0
_CHS0	set	250
	global	_CHS1
_CHS1	set	251
	global	_CHS2
_CHS2	set	252
	global	_CM0
_CM0	set	200
	global	_CM1
_CM1	set	201
	global	_CM2
_CM2	set	202
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	249
	global	_PC1
_PC1	set	57
	global	_PC2
_PC2	set	58
	global	_PC3
_PC3	set	59
	global	_PEIE
_PEIE	set	94
	global	_T1CKPS0
_T1CKPS0	set	132
	global	_T1CKPS1
_T1CKPS1	set	133
	global	_T1OSCEN
_T1OSCEN	set	131
	global	_T2CKPS0
_T2CKPS0	set	144
	global	_T2CKPS1
_T2CKPS1	set	145
	global	_TMR1CS
_TMR1CS	set	129
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_TOUTPS0
_TOUTPS0	set	147
	global	_TOUTPS1
_TOUTPS1	set	148
	global	_TOUTPS2
_TOUTPS2	set	149
	global	_TOUTPS3
_TOUTPS3	set	150
	global	_VCFG0
_VCFG0	set	253
	global	_ADRESL
_ADRESL	set	158
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PR2
_PR2	set	146
	global	_ADCS0
_ADCS0	set	1276
	global	_ADCS1
_ADCS1	set	1277
	global	_ADCS2
_ADCS2	set	1278
	global	_ANSEL0
_ANSEL0	set	1160
	global	_ANSEL1
_ANSEL1	set	1161
	global	_ANSEL2
_ANSEL2	set	1162
	global	_ANSEL3
_ANSEL3	set	1163
	global	_ANSEL4
_ANSEL4	set	1164
	global	_ANSEL5
_ANSEL5	set	1165
	global	_ANSEL6
_ANSEL6	set	1166
	global	_ANSEL7
_ANSEL7	set	1167
	global	_CCP1IE
_CCP1IE	set	1128
	global	_DIVS
_DIVS	set	1279
	global	_RD
_RD	set	1248
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_TRISA6
_TRISA6	set	1070
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_WPDA4
_WPDA4	set	1100
	global	_WPDC1
_WPDC1	set	1099
	global	_WPDC2
_WPDC2	set	1098
	global	_WPDC3
_WPDC3	set	1097
	global	_WPUA0
_WPUA0	set	1192
	global	_WPUA1
_WPUA1	set	1193
	global	_WPUA2
_WPUA2	set	1194
	global	_WPUA3
_WPUA3	set	1195
	global	_WPUA4
_WPUA4	set	1196
	global	_WPUA5
_WPUA5	set	1197
	global	_WPUA6
_WPUA6	set	1198
	global	_WPUA7
_WPUA7	set	1199
	global	_WPUC0
_WPUC0	set	1088
	global	_WPUC1
_WPUC1	set	1089
	global	_WPUC2
_WPUC2	set	1090
	global	_WPUC3
_WPUC3	set	1091
	global	_WPUC4
_WPUC4	set	1092
	global	_WPUC5
_WPUC5	set	1093
	global	_WR
_WR	set	1256
	file	"ms83f080_irsend.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_num:
       ds      2

_VS1838_Receive_Count:
       ds      1

_VS1838_Status:
       ds      1

_send_flag:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_IR_DATA_t:
       ds      4

_VS838_Receive_Data:
       ds      4

_ADC_GET:
       ds      2

_Cycle_CCPR:
       ds      2

_count:
       ds      2

_VS1838_receive_ok:
       ds      1

_flag_senf:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+05h)
	fcall	clear_ram
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+010h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_System_init
?_System_init:	; 0 bytes @ 0x0
	global	?_GPIO_Init
?_GPIO_Init:	; 0 bytes @ 0x0
	global	?_Timer1_Init
?_Timer1_Init:	; 0 bytes @ 0x0
	global	?_Timer2_Init
?_Timer2_Init:	; 0 bytes @ 0x0
	global	?_ADC_Init
?_ADC_Init:	; 0 bytes @ 0x0
	global	?_EEPROM_Init
?_EEPROM_Init:	; 0 bytes @ 0x0
	global	?_LED_Study_End
?_LED_Study_End:	; 0 bytes @ 0x0
	global	?_Control
?_Control:	; 0 bytes @ 0x0
	global	?_Clean_countReg
?_Clean_countReg:	; 0 bytes @ 0x0
	global	??_Clean_countReg
??_Clean_countReg:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_VS1838ReceiveHandle
?_VS1838ReceiveHandle:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	?_isKeyPressed
?_isKeyPressed:	; 1 bytes @ 0x0
	global	?_VS1838_Process
?_VS1838_Process:	; 1 bytes @ 0x0
	global	?_Read_EEPROM_u8
?_Read_EEPROM_u8:	; 1 bytes @ 0x0
	global	?_GetCCP1Value
?_GetCCP1Value:	; 2 bytes @ 0x0
	global	VS1838ReceiveHandle@capdata
VS1838ReceiveHandle@capdata:	; 2 bytes @ 0x0
	ds	2
	global	??_GetCCP1Value
??_GetCCP1Value:	; 0 bytes @ 0x2
	global	??_VS1838ReceiveHandle
??_VS1838ReceiveHandle:	; 0 bytes @ 0x2
	global	GetCCP1Value@values
GetCCP1Value@values:	; 2 bytes @ 0x2
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x4
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_System_init
??_System_init:	; 0 bytes @ 0x0
	global	??_GPIO_Init
??_GPIO_Init:	; 0 bytes @ 0x0
	global	??_Timer1_Init
??_Timer1_Init:	; 0 bytes @ 0x0
	global	??_Timer2_Init
??_Timer2_Init:	; 0 bytes @ 0x0
	global	??_isKeyPressed
??_isKeyPressed:	; 0 bytes @ 0x0
	global	?_Delay_xms
?_Delay_xms:	; 0 bytes @ 0x0
	global	?_Write_EEPROM_u8
?_Write_EEPROM_u8:	; 0 bytes @ 0x0
	global	??_Read_EEPROM_u8
??_Read_EEPROM_u8:	; 0 bytes @ 0x0
	global	?_Delay_xus
?_Delay_xus:	; 0 bytes @ 0x0
	global	?_GetADCValue
?_GetADCValue:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	Write_EEPROM_u8@EEDatas
Write_EEPROM_u8@EEDatas:	; 1 bytes @ 0x0
	global	Read_EEPROM_u8@EEAddress
Read_EEPROM_u8@EEAddress:	; 1 bytes @ 0x0
	global	Delay_xms@x
Delay_xms@x:	; 2 bytes @ 0x0
	global	Delay_xus@x
Delay_xus@x:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_Write_EEPROM_u8
??_Write_EEPROM_u8:	; 0 bytes @ 0x1
	global	Write_EEPROM_u8@EEAddress
Write_EEPROM_u8@EEAddress:	; 1 bytes @ 0x1
	global	Read_EEPROM_u8@EepromData
Read_EEPROM_u8@EepromData:	; 1 bytes @ 0x1
	ds	1
	global	??_EEPROM_Init
??_EEPROM_Init:	; 0 bytes @ 0x2
	global	??_VS1838_Process
??_VS1838_Process:	; 0 bytes @ 0x2
	global	??_GetADCValue
??_GetADCValue:	; 0 bytes @ 0x2
	global	??_Delay_xms
??_Delay_xms:	; 0 bytes @ 0x2
	global	??_Delay_xus
??_Delay_xus:	; 0 bytes @ 0x2
	global	?_Read_IRData
?_Read_IRData:	; 4 bytes @ 0x2
	global	VS1838_Process@Address_H
VS1838_Process@Address_H:	; 1 bytes @ 0x2
	global	GetADCValue@ADC_num
GetADCValue@ADC_num:	; 2 bytes @ 0x2
	global	Delay_xus@i
Delay_xus@i:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	VS1838_Process@Address_L
VS1838_Process@Address_L:	; 1 bytes @ 0x3
	ds	1
	global	?_Send_Low
?_Send_Low:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	VS1838_Process@Data_H
VS1838_Process@Data_H:	; 1 bytes @ 0x4
	global	Delay_xms@i
Delay_xms@i:	; 2 bytes @ 0x4
	global	Send_Low@nus
Send_Low@nus:	; 2 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	ds	1
	global	VS1838_Process@Data_L
VS1838_Process@Data_L:	; 1 bytes @ 0x5
	ds	1
	global	??_ADC_Init
??_ADC_Init:	; 0 bytes @ 0x6
	global	??_LED_Study_End
??_LED_Study_End:	; 0 bytes @ 0x6
	global	??_Read_IRData
??_Read_IRData:	; 0 bytes @ 0x6
	global	??_Send_Low
??_Send_Low:	; 0 bytes @ 0x6
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	ds	1
	global	?_Send_High
?_Send_High:	; 0 bytes @ 0x7
	global	Send_High@nus
Send_High@nus:	; 2 bytes @ 0x7
	ds	2
	global	?_IR_SEND
?_IR_SEND:	; 0 bytes @ 0x9
	global	??_Send_High
??_Send_High:	; 0 bytes @ 0x9
	global	IR_SEND@irdata
IR_SEND@irdata:	; 4 bytes @ 0x9
	ds	1
	global	Read_IRData@Address_H
Read_IRData@Address_H:	; 1 bytes @ 0xA
	ds	1
	global	Read_IRData@Address_L
Read_IRData@Address_L:	; 1 bytes @ 0xB
	ds	1
	global	Read_IRData@Data_H
Read_IRData@Data_H:	; 1 bytes @ 0xC
	ds	1
	global	??_IR_SEND
??_IR_SEND:	; 0 bytes @ 0xD
	global	Read_IRData@Data_L
Read_IRData@Data_L:	; 1 bytes @ 0xD
	global	IR_SEND@i
IR_SEND@i:	; 1 bytes @ 0xD
	ds	1
	global	??_Control
??_Control:	; 0 bytes @ 0xE
	global	Control@i
Control@i:	; 1 bytes @ 0xE
	global	Read_IRData@data_t
Read_IRData@data_t:	; 4 bytes @ 0xE
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0x12
;;Data sizes: Strings 0, constant 0, data 0, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      12
;; BANK0           80     18      34
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_GetCCP1Value	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_Read_IRData	unsigned long  size(1) Largest target is 0
;;
;; ?_GetADCValue	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_GetCCP1Value
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Read_IRData
;;   _Control->_IR_SEND
;;   _IR_SEND->_Send_High
;;   _Send_Low->_Delay_xus
;;   _LED_Study_End->_Delay_xms
;;   _ADC_Init->_Delay_xms
;;   _Send_High->___lwdiv
;;   _VS1838_Process->_Write_EEPROM_u8
;;   _Read_IRData->_Read_EEPROM_u8
;;   _EEPROM_Init->_Write_EEPROM_u8
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     964
;;                        _System_init
;;                          _GPIO_Init
;;                        _Timer1_Init
;;                        _Timer2_Init
;;                           _ADC_Init
;;                        _EEPROM_Init
;;                      _LED_Study_End
;;                        _Read_IRData
;;                            _Control
;; ---------------------------------------------------------------------------------
;; (1) _Control                                              1     1      0     665
;;                                             14 BANK0      1     1      0
;;                       _isKeyPressed
;;                     _VS1838_Process
;;                        _GetADCValue
;;                            _IR_SEND
;;                          _Delay_xms
;; ---------------------------------------------------------------------------------
;; (2) _IR_SEND                                              5     1      4     322
;;                                              9 BANK0      5     1      4
;;                          _Send_High
;;                           _Send_Low
;; ---------------------------------------------------------------------------------
;; (3) _Send_Low                                             2     0      2      68
;;                                              4 BANK0      2     0      2
;;                          _Delay_xus
;; ---------------------------------------------------------------------------------
;; (1) _LED_Study_End                                        0     0      0      46
;;                          _Delay_xms
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Init                                             0     0      0      46
;;                          _Delay_xms
;; ---------------------------------------------------------------------------------
;; (3) _Send_High                                            2     0      2     184
;;                                              7 BANK0      2     0      2
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (4) _Delay_xus                                            4     2      2      46
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _Delay_xms                                            6     4      2      46
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; (2) _VS1838_Process                                       4     4      0     224
;;                                              2 BANK0      4     4      0
;;                    _Write_EEPROM_u8
;; ---------------------------------------------------------------------------------
;; (1) _Read_IRData                                         16    12      4     163
;;                                              2 BANK0     16    12      4
;;                     _Read_EEPROM_u8
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Init                                          0     0      0      44
;;                    _Write_EEPROM_u8
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              7     3      4     162
;;                                              0 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) _Read_EEPROM_u8                                       2     2      0      46
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _Write_EEPROM_u8                                      2     1      1      44
;;                                              0 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _GetADCValue                                          4     2      2      26
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _isKeyPressed                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer2_Init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_Init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _GPIO_Init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _System_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  3     3      0     158
;;                                              4 COMMON     3     3      0
;;                       _GetCCP1Value
;;                _VS1838ReceiveHandle
;;                     _Clean_countReg
;; ---------------------------------------------------------------------------------
;; (6) _Clean_countReg                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (6) _GetCCP1Value                                         4     2      2      26
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (6) _VS1838ReceiveHandle                                  2     0      2     132
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _System_init
;;   _GPIO_Init
;;   _Timer1_Init
;;   _Timer2_Init
;;   _ADC_Init
;;     _Delay_xms
;;   _EEPROM_Init
;;     _Write_EEPROM_u8
;;   _LED_Study_End
;;     _Delay_xms
;;   _Read_IRData
;;     _Read_EEPROM_u8
;;   _Control
;;     _isKeyPressed
;;     _VS1838_Process
;;       _Write_EEPROM_u8
;;     _GetADCValue
;;     _IR_SEND
;;       _Send_High
;;         ___lwdiv
;;       _Send_Low
;;         _Delay_xus
;;     _Delay_xms
;;
;; _ISR (ROOT)
;;   _GetCCP1Value
;;   _VS1838ReceiveHandle
;;   _Clean_countReg
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       8       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     12      22       4       42.5%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      2E       7        0.0%
;;DATA                 0      0      36       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 44 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_System_init
;;		_GPIO_Init
;;		_Timer1_Init
;;		_Timer2_Init
;;		_ADC_Init
;;		_EEPROM_Init
;;		_LED_Study_End
;;		_Read_IRData
;;		_Control
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	44
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	45
	
l10512:	
;main.c: 45: System_init();
	fcall	_System_init
	line	46
	
l10514:	
;main.c: 46: GPIO_Init();
	fcall	_GPIO_Init
	line	47
	
l10516:	
;main.c: 47: Timer1_Init();
	fcall	_Timer1_Init
	line	48
	
l10518:	
;main.c: 48: Timer2_Init();
	fcall	_Timer2_Init
	line	49
	
l10520:	
;main.c: 49: ADC_Init();
	fcall	_ADC_Init
	line	51
	
l10522:	
;main.c: 51: EEPROM_Init();
	fcall	_EEPROM_Init
	line	52
	
l10524:	
;main.c: 52: LED_Study_End();
	fcall	_LED_Study_End
	line	53
	
l10526:	
;main.c: 53: PC2 = 0;
	bcf	(58/8),(58)&7
	line	54
	
l10528:	
;main.c: 54: IR_DATA_t = Read_IRData();
	fcall	_Read_IRData
	movf	(3+(?_Read_IRData)),w
	movwf	(_IR_DATA_t+3)
	movf	(2+(?_Read_IRData)),w
	movwf	(_IR_DATA_t+2)
	movf	(1+(?_Read_IRData)),w
	movwf	(_IR_DATA_t+1)
	movf	(0+(?_Read_IRData)),w
	movwf	(_IR_DATA_t)

	line	55
	
l10530:	
;main.c: 55: if(IR_DATA_t == 0xFFFFFFFF)
	incf	(_IR_DATA_t),w
	skipnz
	incf	(_IR_DATA_t+1),w
	skipnz
	incf	(_IR_DATA_t+2),w
	skipnz
	incf	(_IR_DATA_t+3),w

	skipz
	goto	u641
	goto	u640
u641:
	goto	l10534
u640:
	line	56
	
l10532:	
;main.c: 56: IR_DATA_t = 0x00FF906F;
	movlw	0
	movwf	(_IR_DATA_t+3)
	movlw	0FFh
	movwf	(_IR_DATA_t+2)
	movlw	090h
	movwf	(_IR_DATA_t+1)
	movlw	06Fh
	movwf	(_IR_DATA_t)

	line	60
	
l10534:	
;main.c: 59: {
;main.c: 60: Control();
	fcall	_Control
	goto	l10534
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	62
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Control
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _Control *****************
;; Defined at:
;;		line 73 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_isKeyPressed
;;		_VS1838_Process
;;		_GetADCValue
;;		_IR_SEND
;;		_Delay_xms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"main.c"
	line	73
	global	__size_of_Control
	__size_of_Control	equ	__end_of_Control-_Control
	
_Control:	
	opt	stack 2
; Regs used in _Control: [wreg+status,2+status,0+pclath+cstack]
	line	74
	
l10482:	
	line	76
	
l10484:	
;main.c: 76: if(isKeyPressed()){
	fcall	_isKeyPressed
	xorlw	0
	skipnz
	goto	u601
	goto	u600
u601:
	goto	l10494
u600:
	line	77
	
l10486:	
;main.c: 77: TMR1ON=1;
	bsf	(128/8),(128)&7
	line	78
	
l10488:	
;main.c: 78: VS1838_Status=0;
	clrf	(_VS1838_Status)
	line	79
	
l10490:	
;main.c: 79: VS838_Receive_Data=0;
	clrf	(_VS838_Receive_Data)
	clrf	(_VS838_Receive_Data+1)
	clrf	(_VS838_Receive_Data+2)
	clrf	(_VS838_Receive_Data+3)
	line	80
;main.c: 80: VS1838_receive_ok=0;
	clrf	(_VS1838_receive_ok)
	line	81
;main.c: 81: while(!VS1838_Process()){
	goto	l10492
	
l1112:	
	line	82
;main.c: 82: PC3=1;
	bsf	(59/8),(59)&7
	line	81
	
l10492:	
	fcall	_VS1838_Process
	xorlw	0
	skipnz
	goto	u611
	goto	u610
u611:
	goto	l1112
u610:
	
l1113:	
	line	84
;main.c: 83: }
;main.c: 84: TMR1ON=0;
	bcf	(128/8),(128)&7
	line	85
;main.c: 85: PC3=0;
	bcf	(59/8),(59)&7
	line	86
;main.c: 86: }else{
	goto	l1119
	line	87
	
l10494:	
;main.c: 87: for(i=0;i<5;i++)
	clrf	(Control@i)
	line	88
	
l10500:	
;main.c: 88: ADC_GET = GetADCValue();
	fcall	_GetADCValue
	movf	(1+(?_GetADCValue)),w
	movwf	(_ADC_GET+1)
	movf	(0+(?_GetADCValue)),w
	movwf	(_ADC_GET)
	line	87
	
l10502:	
	incf	(Control@i),f
	
l10504:	
	movlw	(05h)
	subwf	(Control@i),w
	skipc
	goto	u621
	goto	u620
u621:
	goto	l10500
u620:
	line	89
	
l10506:	
;main.c: 89: if(ADC_GET >= 512){
	movlw	high(0200h)
	subwf	(_ADC_GET+1),w
	movlw	low(0200h)
	skipnz
	subwf	(_ADC_GET),w
	skipc
	goto	u631
	goto	u630
u631:
	goto	l10510
u630:
	line	90
	
l10508:	
;main.c: 90: IR_SEND(IR_DATA_t);
	movf	(_IR_DATA_t+3),w
	movwf	(?_IR_SEND+3)
	movf	(_IR_DATA_t+2),w
	movwf	(?_IR_SEND+2)
	movf	(_IR_DATA_t+1),w
	movwf	(?_IR_SEND+1)
	movf	(_IR_DATA_t),w
	movwf	(?_IR_SEND)

	fcall	_IR_SEND
	line	91
;main.c: 91: Delay_xms(100);
	movlw	064h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	92
;main.c: 92: }else{
	goto	l1119
	line	93
	
l10510:	
;main.c: 93: Delay_xms(20);
	movlw	014h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	96
	
l1119:	
	return
	opt stack 0
GLOBAL	__end_of_Control
	__end_of_Control:
;; =============== function _Control ends ============

	signat	_Control,88
	global	_IR_SEND
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _IR_SEND *****************
;; Defined at:
;;		line 156 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;  irdata          4    9[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  i               1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Send_High
;;		_Send_Low
;; This function is called by:
;;		_Control
;; This function uses a non-reentrant model
;;
psect	text525
	file	"MyIR.c"
	line	156
	global	__size_of_IR_SEND
	__size_of_IR_SEND	equ	__end_of_IR_SEND-_IR_SEND
	
_IR_SEND:	
	opt	stack 2
; Regs used in _IR_SEND: [wreg+status,2+status,0+pclath+cstack]
	line	157
	
l10460:	
	line	159
	
l10462:	
;MyIR.c: 159: Send_High(8300);
	movlw	low(0206Ch)
	movwf	(?_Send_High)
	movlw	high(0206Ch)
	movwf	((?_Send_High))+1
	fcall	_Send_High
	line	160
	
l10464:	
;MyIR.c: 160: Send_Low(900);
	movlw	low(0384h)
	movwf	(?_Send_Low)
	movlw	high(0384h)
	movwf	((?_Send_Low))+1
	fcall	_Send_Low
	line	161
;MyIR.c: 161: for(i=0;i<32;i++){
	clrf	(IR_SEND@i)
	
l5491:	
	line	162
;MyIR.c: 162: if(irdata & 0x80000000){
	btfss	(IR_SEND@irdata+3),(31)&7
	goto	u581
	goto	u580
u581:
	goto	l10472
u580:
	line	163
	
l10470:	
;MyIR.c: 163: Send_High(560);
	movlw	low(0230h)
	movwf	(?_Send_High)
	movlw	high(0230h)
	movwf	((?_Send_High))+1
	fcall	_Send_High
	line	164
;MyIR.c: 164: Send_Low(338);
	movlw	low(0152h)
	movwf	(?_Send_Low)
	movlw	high(0152h)
	movwf	((?_Send_Low))+1
	fcall	_Send_Low
	line	165
;MyIR.c: 165: }else{
	goto	l10474
	line	166
	
l10472:	
;MyIR.c: 166: Send_High(560);
	movlw	low(0230h)
	movwf	(?_Send_High)
	movlw	high(0230h)
	movwf	((?_Send_High))+1
	fcall	_Send_High
	line	167
;MyIR.c: 167: Send_Low(112);
	movlw	070h
	movwf	(?_Send_Low)
	clrf	(?_Send_Low+1)
	fcall	_Send_Low
	line	169
	
l10474:	
;MyIR.c: 168: }
;MyIR.c: 169: irdata <<= 1;
	clrc
	rlf	(IR_SEND@irdata),f
	rlf	(IR_SEND@irdata+1),f
	rlf	(IR_SEND@irdata+2),f
	rlf	(IR_SEND@irdata+3),f
	line	161
	
l10476:	
	incf	(IR_SEND@i),f
	
l10478:	
	movlw	(020h)
	subwf	(IR_SEND@i),w
	skipc
	goto	u591
	goto	u590
u591:
	goto	l5491
u590:
	line	171
	
l10480:	
;MyIR.c: 170: }
;MyIR.c: 171: Send_High(560);
	movlw	low(0230h)
	movwf	(?_Send_High)
	movlw	high(0230h)
	movwf	((?_Send_High))+1
	fcall	_Send_High
	line	172
;MyIR.c: 172: Send_Low(0);
	clrf	(?_Send_Low)
	clrf	(?_Send_Low+1)
	fcall	_Send_Low
	line	173
	
l5495:	
	return
	opt stack 0
GLOBAL	__end_of_IR_SEND
	__end_of_IR_SEND:
;; =============== function _IR_SEND ends ============

	signat	_IR_SEND,4216
	global	_Send_Low
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _Send_Low *****************
;; Defined at:
;;		line 151 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;  nus             2    4[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_xus
;; This function is called by:
;;		_IR_SEND
;; This function uses a non-reentrant model
;;
psect	text526
	file	"MyIR.c"
	line	151
	global	__size_of_Send_Low
	__size_of_Send_Low	equ	__end_of_Send_Low-_Send_Low
	
_Send_Low:	
	opt	stack 2
; Regs used in _Send_Low: [wreg+status,2+status,0+pclath+cstack]
	line	152
	
l10456:	
;MyIR.c: 152: PC2 = 0;
	bcf	(58/8),(58)&7
	line	153
	
l10458:	
;MyIR.c: 153: Delay_xus(nus);
	movf	(Send_Low@nus+1),w
	movwf	(?_Delay_xus+1)
	movf	(Send_Low@nus),w
	movwf	(?_Delay_xus)
	fcall	_Delay_xus
	line	154
	
l5488:	
	return
	opt stack 0
GLOBAL	__end_of_Send_Low
	__end_of_Send_Low:
;; =============== function _Send_Low ends ============

	signat	_Send_Low,4216
	global	_LED_Study_End
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:

;; *************** function _LED_Study_End *****************
;; Defined at:
;;		line 87 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_xms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text527
	file	"MyConfiguration.c"
	line	87
	global	__size_of_LED_Study_End
	__size_of_LED_Study_End	equ	__end_of_LED_Study_End-_LED_Study_End
	
_LED_Study_End:	
	opt	stack 4
; Regs used in _LED_Study_End: [wreg+status,2+status,0+pclath+cstack]
	line	88
	
l10442:	
;MyConfiguration.c: 88: PC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	89
	
l10444:	
;MyConfiguration.c: 89: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	90
	
l10446:	
;MyConfiguration.c: 90: PC3 = 0;
	bcf	(59/8),(59)&7
	line	91
;MyConfiguration.c: 91: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	92
	
l10448:	
;MyConfiguration.c: 92: PC3 = 1;
	bsf	(59/8),(59)&7
	line	93
;MyConfiguration.c: 93: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	94
	
l10450:	
;MyConfiguration.c: 94: PC3 = 0;
	bcf	(59/8),(59)&7
	line	95
;MyConfiguration.c: 95: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	96
	
l10452:	
;MyConfiguration.c: 96: PC3 = 1;
	bsf	(59/8),(59)&7
	line	97
;MyConfiguration.c: 97: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	98
	
l10454:	
;MyConfiguration.c: 98: PC3 = 0;
	bcf	(59/8),(59)&7
	line	99
;MyConfiguration.c: 99: Delay_xms(50);
	movlw	032h
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	100
	
l3280:	
	return
	opt stack 0
GLOBAL	__end_of_LED_Study_End
	__end_of_LED_Study_End:
;; =============== function _LED_Study_End ends ============

	signat	_LED_Study_End,88
	global	_ADC_Init
psect	text528,local,class=CODE,delta=2
global __ptext528
__ptext528:

;; *************** function _ADC_Init *****************
;; Defined at:
;;		line 19 in file "MyADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_xms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text528
	file	"MyADC.c"
	line	19
	global	__size_of_ADC_Init
	__size_of_ADC_Init	equ	__end_of_ADC_Init-_ADC_Init
	
_ADC_Init:	
	opt	stack 4
; Regs used in _ADC_Init: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l10422:	
;MyADC.c: 21: TRISC0=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1080/8)^080h,(1080)&7
	line	22
;MyADC.c: 22: ANSEL4=1;
	bsf	(1164/8)^080h,(1164)&7
	line	25
;MyADC.c: 25: DIVS=0;
	bcf	(1279/8)^080h,(1279)&7
	line	26
;MyADC.c: 26: ADCS0=0;ADCS1=0;ADCS2=0;
	bcf	(1276/8)^080h,(1276)&7
	bcf	(1277/8)^080h,(1277)&7
	bcf	(1278/8)^080h,(1278)&7
	line	28
	
l10424:	
;MyADC.c: 28: ADCON0=0B10000001;
	movlw	(081h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	29
	
l10426:	
;MyADC.c: 29: VCFG0=0;
	bcf	(253/8),(253)&7
	line	30
	
l10428:	
;MyADC.c: 30: CHS0=0;CHS1=0;CHS2=1;
	bcf	(250/8),(250)&7
	
l10430:	
	bcf	(251/8),(251)&7
	
l10432:	
	bsf	(252/8),(252)&7
	line	31
	
l10434:	
;MyADC.c: 31: ADFM=1;
	bsf	(255/8),(255)&7
	line	32
	
l10436:	
;MyADC.c: 32: ADON=1;
	bsf	(248/8),(248)&7
	line	34
	
l10438:	
;MyADC.c: 34: Delay_xms(1);
	clrf	(?_Delay_xms)
	incf	(?_Delay_xms),f
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	35
	
l10440:	
;MyADC.c: 35: GO_DONE=1;
	bsf	(249/8),(249)&7
	line	36
	
l2188:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Init
	__end_of_ADC_Init:
;; =============== function _ADC_Init ends ============

	signat	_ADC_Init,88
	global	_Send_High
psect	text529,local,class=CODE,delta=2
global __ptext529
__ptext529:

;; *************** function _Send_High *****************
;; Defined at:
;;		line 140 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;  nus             2    7[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwdiv
;; This function is called by:
;;		_IR_SEND
;; This function uses a non-reentrant model
;;
psect	text529
	file	"MyIR.c"
	line	140
	global	__size_of_Send_High
	__size_of_Send_High	equ	__end_of_Send_High-_Send_High
	
_Send_High:	
	opt	stack 2
; Regs used in _Send_High: [wreg+status,2+status,0+pclath+cstack]
	line	141
	
l10410:	
;MyIR.c: 141: num = nus/15;
	movlw	0Fh
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(Send_High@nus+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(Send_High@nus),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(_num+1)
	movf	(0+(?___lwdiv)),w
	movwf	(_num)
	line	142
	
l10412:	
;MyIR.c: 142: count=0;
	clrf	(_count)
	clrf	(_count+1)
	line	143
	
l10414:	
;MyIR.c: 143: send_flag = 0;
	clrf	(_send_flag)
	line	144
	
l10416:	
;MyIR.c: 144: flag_senf=1;
	clrf	(_flag_senf)
	incf	(_flag_senf),f
	line	145
	
l10418:	
;MyIR.c: 145: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	146
;MyIR.c: 146: while(flag_senf);
	
l10420:	
	movf	(_flag_senf),f
	skipz
	goto	u571
	goto	u570
u571:
	goto	l10420
u570:
	
l5484:	
	line	147
;MyIR.c: 147: PC2 = 0;
	bcf	(58/8),(58)&7
	line	148
	
l5485:	
	return
	opt stack 0
GLOBAL	__end_of_Send_High
	__end_of_Send_High:
;; =============== function _Send_High ends ============

	signat	_Send_High,4216
	global	_Delay_xus
psect	text530,local,class=CODE,delta=2
global __ptext530
__ptext530:

;; *************** function _Delay_xus *****************
;; Defined at:
;;		line 72 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Send_Low
;; This function uses a non-reentrant model
;;
psect	text530
	file	"MyConfiguration.c"
	line	72
	global	__size_of_Delay_xus
	__size_of_Delay_xus	equ	__end_of_Delay_xus-_Delay_xus
	
_Delay_xus:	
	opt	stack 2
; Regs used in _Delay_xus: [wreg+status,2+status,0]
	line	74
	
l10404:	
;MyConfiguration.c: 73: unsigned int i;
;MyConfiguration.c: 74: for(i=0;i<x;i++){
	clrf	(Delay_xus@i)
	clrf	(Delay_xus@i+1)
	goto	l10408
	
l3275:	
	line	75
;MyConfiguration.c: 75: _delay((unsigned long)((1)*(16000000/4000000.0)));
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	74
	
l10406:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Delay_xus@i),f
	skipnz
	incf	(Delay_xus@i+1),f
	
l10408:	
	movf	(Delay_xus@x+1),w
	subwf	(Delay_xus@i+1),w
	skipz
	goto	u565
	movf	(Delay_xus@x),w
	subwf	(Delay_xus@i),w
u565:
	skipc
	goto	u561
	goto	u560
u561:
	goto	l3275
u560:
	line	77
	
l3277:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_xus
	__end_of_Delay_xus:
;; =============== function _Delay_xus ends ============

	signat	_Delay_xus,4216
	global	_Delay_xms
psect	text531,local,class=CODE,delta=2
global __ptext531
__ptext531:

;; *************** function _Delay_xms *****************
;; Defined at:
;;		line 65 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Control
;;		_ADC_Init
;;		_LED_Study_End
;; This function uses a non-reentrant model
;;
psect	text531
	file	"MyConfiguration.c"
	line	65
	global	__size_of_Delay_xms
	__size_of_Delay_xms	equ	__end_of_Delay_xms-_Delay_xms
	
_Delay_xms:	
	opt	stack 4
; Regs used in _Delay_xms: [wreg+status,2+status,0]
	line	67
	
l10396:	
;MyConfiguration.c: 66: unsigned int i;
;MyConfiguration.c: 67: for(i=0;i<x;i++){
	clrf	(Delay_xms@i)
	clrf	(Delay_xms@i+1)
	goto	l10402
	line	68
	
l10398:	
;MyConfiguration.c: 68: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_Delay_xms+0)+0+1),f
	movlw	48
movwf	((??_Delay_xms+0)+0),f
u657:
	decfsz	((??_Delay_xms+0)+0),f
	goto	u657
	decfsz	((??_Delay_xms+0)+0+1),f
	goto	u657
	clrwdt
opt asmopt_on

	line	67
	
l10400:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Delay_xms@i),f
	skipnz
	incf	(Delay_xms@i+1),f
	
l10402:	
	movf	(Delay_xms@x+1),w
	subwf	(Delay_xms@i+1),w
	skipz
	goto	u555
	movf	(Delay_xms@x),w
	subwf	(Delay_xms@i),w
u555:
	skipc
	goto	u551
	goto	u550
u551:
	goto	l10398
u550:
	line	71
	
l3271:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_xms
	__end_of_Delay_xms:
;; =============== function _Delay_xms ends ============

	signat	_Delay_xms,4216
	global	_VS1838_Process
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function _VS1838_Process *****************
;; Defined at:
;;		line 82 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Data_L          1    5[BANK0 ] unsigned char 
;;  Data_H          1    4[BANK0 ] unsigned char 
;;  Address_L       1    3[BANK0 ] unsigned char 
;;  Address_H       1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Write_EEPROM_u8
;; This function is called by:
;;		_Control
;; This function uses a non-reentrant model
;;
psect	text532
	file	"MyIR.c"
	line	82
	global	__size_of_VS1838_Process
	__size_of_VS1838_Process	equ	__end_of_VS1838_Process-_VS1838_Process
	
_VS1838_Process:	
	opt	stack 3
; Regs used in _VS1838_Process: [wreg+status,2+status,0+pclath+cstack]
	line	86
	
l10368:	
;MyIR.c: 83: unsigned char Address_H,Address_L;
;MyIR.c: 84: unsigned char Data_H,Data_L;
;MyIR.c: 86: if(VS1838_receive_ok==1)
	decf	(_VS1838_receive_ok),w
	skipz
	goto	u521
	goto	u520
u521:
	goto	l10392
u520:
	line	88
	
l10370:	
;MyIR.c: 87: {
;MyIR.c: 88: Address_H=VS838_Receive_Data>>24;
	movf	0+(((_VS838_Receive_Data))+3),w
	movwf	(VS1838_Process@Address_H)
	line	89
;MyIR.c: 89: Address_L=(VS838_Receive_Data>>16)&0xff;
	movf	0+(((_VS838_Receive_Data))+2),w
	movwf	(VS1838_Process@Address_L)
	line	90
	
l10372:	
;MyIR.c: 90: if((Address_H==(unsigned char)~Address_L))
	comf	(VS1838_Process@Address_L),w
	xorwf	(VS1838_Process@Address_H),w
	skipz
	goto	u531
	goto	u530
u531:
	goto	l10392
u530:
	line	92
	
l10374:	
;MyIR.c: 91: {
;MyIR.c: 92: Data_H=VS838_Receive_Data>>8;
	movf	0+(((_VS838_Receive_Data))+1),w
	movwf	(VS1838_Process@Data_H)
	line	93
;MyIR.c: 93: Data_L=VS838_Receive_Data;
	movf	(_VS838_Receive_Data),w
	movwf	(VS1838_Process@Data_L)
	line	94
	
l10376:	
;MyIR.c: 94: if(Data_H==(unsigned char)~Data_L)
	comf	(VS1838_Process@Data_L),w
	xorwf	(VS1838_Process@Data_H),w
	skipz
	goto	u541
	goto	u540
u541:
	goto	l10392
u540:
	line	97
	
l10378:	
;MyIR.c: 95: {
;MyIR.c: 97: Write_EEPROM_u8(0X00,Address_H);
	movf	(VS1838_Process@Address_H),w
	movwf	(?_Write_EEPROM_u8)
	movlw	(0)
	fcall	_Write_EEPROM_u8
	line	98
;MyIR.c: 98: Write_EEPROM_u8(0X01,Address_L);
	bcf	status, 5	;RP0=0, select bank0
	movf	(VS1838_Process@Address_L),w
	movwf	(?_Write_EEPROM_u8)
	movlw	(01h)
	fcall	_Write_EEPROM_u8
	line	99
;MyIR.c: 99: Write_EEPROM_u8(0X02,Data_H);
	bcf	status, 5	;RP0=0, select bank0
	movf	(VS1838_Process@Data_H),w
	movwf	(?_Write_EEPROM_u8)
	movlw	(02h)
	fcall	_Write_EEPROM_u8
	line	100
;MyIR.c: 100: Write_EEPROM_u8(0X03,Data_L);
	bcf	status, 5	;RP0=0, select bank0
	movf	(VS1838_Process@Data_L),w
	movwf	(?_Write_EEPROM_u8)
	movlw	(03h)
	fcall	_Write_EEPROM_u8
	line	101
	
l10380:	
;MyIR.c: 101: IR_DATA_t = VS838_Receive_Data;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_VS838_Receive_Data+3),w
	movwf	(_IR_DATA_t+3)
	movf	(_VS838_Receive_Data+2),w
	movwf	(_IR_DATA_t+2)
	movf	(_VS838_Receive_Data+1),w
	movwf	(_IR_DATA_t+1)
	movf	(_VS838_Receive_Data),w
	movwf	(_IR_DATA_t)

	line	102
	
l10382:	
;MyIR.c: 102: VS1838_Status=0;
	clrf	(_VS1838_Status)
	line	103
	
l10384:	
;MyIR.c: 103: VS838_Receive_Data=0;
	clrf	(_VS838_Receive_Data)
	clrf	(_VS838_Receive_Data+1)
	clrf	(_VS838_Receive_Data+2)
	clrf	(_VS838_Receive_Data+3)
	line	104
	
l10386:	
;MyIR.c: 104: VS1838_receive_ok=0;
	clrf	(_VS1838_receive_ok)
	line	105
	
l10388:	
;MyIR.c: 105: return 1;
	movlw	(01h)
	goto	l5476
	line	109
	
l10392:	
;MyIR.c: 106: }
;MyIR.c: 107: }
;MyIR.c: 108: }
;MyIR.c: 109: return 0;
	movlw	(0)
	line	110
	
l5476:	
	return
	opt stack 0
GLOBAL	__end_of_VS1838_Process
	__end_of_VS1838_Process:
;; =============== function _VS1838_Process ends ============

	signat	_VS1838_Process,89
	global	_Read_IRData
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

;; *************** function _Read_IRData *****************
;; Defined at:
;;		line 119 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  data_t          4   14[BANK0 ] unsigned long 
;;  Data_L          1   13[BANK0 ] unsigned char 
;;  Data_H          1   12[BANK0 ] unsigned char 
;;  Address_L       1   11[BANK0 ] unsigned char 
;;  Address_H       1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    2[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       8       0
;;      Temps:          0       4       0
;;      Totals:         0      16       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Read_EEPROM_u8
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text533
	file	"MyIR.c"
	line	119
	global	__size_of_Read_IRData
	__size_of_Read_IRData	equ	__end_of_Read_IRData-_Read_IRData
	
_Read_IRData:	
	opt	stack 4
; Regs used in _Read_IRData: [wreg+status,2+pclath+cstack]
	line	120
	
l10356:	
	line	124
	
l10358:	
;MyIR.c: 121: unsigned char Address_H,Address_L;
;MyIR.c: 122: unsigned char Data_H,Data_L;
;MyIR.c: 124: Address_H = Read_EEPROM_u8(0x00);
	movlw	(0)
	fcall	_Read_EEPROM_u8
	movwf	(Read_IRData@Address_H)
	line	125
;MyIR.c: 125: Address_L = Read_EEPROM_u8(0x01);
	movlw	(01h)
	fcall	_Read_EEPROM_u8
	movwf	(Read_IRData@Address_L)
	line	126
;MyIR.c: 126: Data_H = Read_EEPROM_u8(0x02);
	movlw	(02h)
	fcall	_Read_EEPROM_u8
	movwf	(Read_IRData@Data_H)
	line	127
;MyIR.c: 127: Data_L = Read_EEPROM_u8(0x03);
	movlw	(03h)
	fcall	_Read_EEPROM_u8
	movwf	(Read_IRData@Data_L)
	line	128
	
l10360:	
;MyIR.c: 128: data_t = (unsigned long int)( ( (unsigned long int)(((unsigned int)Address_H<<8)|Address_L) << 16 )|( ((unsigned int)Data_H << 8) | Data_L ) );
	movf	(Read_IRData@Address_L),w
	movwf	((??_Read_IRData+0)+0)
	movf	(Read_IRData@Address_H),w
	movwf	((??_Read_IRData+0)+0+1)
	clrf	((??_Read_IRData+0)+0+2)
	clrf	((??_Read_IRData+0)+0+3)
	movf	(??_Read_IRData+0)+1,w
	movwf	(??_Read_IRData+0)+3
	movf	(??_Read_IRData+0)+0,w
	movwf	(??_Read_IRData+0)+2
	clrf	(??_Read_IRData+0)+1
	clrf	(??_Read_IRData+0)+0
	movf	3+(??_Read_IRData+0)+0,w
	movwf	(Read_IRData@data_t+3)
	movf	2+(??_Read_IRData+0)+0,w
	movwf	(Read_IRData@data_t+2)
	movf	1+(??_Read_IRData+0)+0,w
	movwf	(Read_IRData@data_t+1)
	movf	0+(??_Read_IRData+0)+0,w
	movwf	(Read_IRData@data_t)

	
l10362:	
	movf	(Read_IRData@Data_L),w
	movwf	((??_Read_IRData+0)+0)
	movf	(Read_IRData@Data_H),w
	movwf	((??_Read_IRData+0)+0+1)
	clrf	((??_Read_IRData+0)+0+2)
	clrf	((??_Read_IRData+0)+0+3)
	movf	0+(??_Read_IRData+0)+0,w
	iorwf	(Read_IRData@data_t),f
	movf	1+(??_Read_IRData+0)+0,w
	iorwf	(Read_IRData@data_t+1),f
	movf	2+(??_Read_IRData+0)+0,w
	iorwf	(Read_IRData@data_t+2),f
	movf	3+(??_Read_IRData+0)+0,w
	iorwf	(Read_IRData@data_t+3),f
	line	129
	
l10364:	
;MyIR.c: 129: return data_t;
	movf	(Read_IRData@data_t+3),w
	movwf	(?_Read_IRData+3)
	movf	(Read_IRData@data_t+2),w
	movwf	(?_Read_IRData+2)
	movf	(Read_IRData@data_t+1),w
	movwf	(?_Read_IRData+1)
	movf	(Read_IRData@data_t),w
	movwf	(?_Read_IRData)

	line	130
	
l5479:	
	return
	opt stack 0
GLOBAL	__end_of_Read_IRData
	__end_of_Read_IRData:
;; =============== function _Read_IRData ends ============

	signat	_Read_IRData,92
	global	_EEPROM_Init
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

;; *************** function _EEPROM_Init *****************
;; Defined at:
;;		line 14 in file "MyEEProm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Write_EEPROM_u8
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text534
	file	"MyEEProm.c"
	line	14
	global	__size_of_EEPROM_Init
	__size_of_EEPROM_Init	equ	__end_of_EEPROM_Init-_EEPROM_Init
	
_EEPROM_Init:	
	opt	stack 4
; Regs used in _EEPROM_Init: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l10354:	
;MyEEProm.c: 15: Write_EEPROM_u8(0xFF,0xAA);
	movlw	(0AAh)
	movwf	(?_Write_EEPROM_u8)
	movlw	(0FFh)
	fcall	_Write_EEPROM_u8
	line	16
;MyEEProm.c: 16: Write_EEPROM_u8(0xFF,0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Write_EEPROM_u8)
	movlw	(0FFh)
	fcall	_Write_EEPROM_u8
	line	17
	
l4349:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Init
	__end_of_EEPROM_Init:
;; =============== function _EEPROM_Init ends ============

	signat	_EEPROM_Init,88
	global	___lwdiv
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "D:\EmbeddedTools\MS_MCU\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    4[BANK0 ] unsigned int 
;;  counter         1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Send_High
;; This function uses a non-reentrant model
;;
psect	text535
	file	"D:\EmbeddedTools\MS_MCU\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l10328:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l10330:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u481
	goto	u480
u481:
	goto	l10350
u480:
	line	11
	
l10332:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l10336
	line	13
	
l10334:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l10336:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u491
	goto	u490
u491:
	goto	l10334
u490:
	line	17
	
l10338:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l10340:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u505
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u505:
	skipc
	goto	u501
	goto	u500
u501:
	goto	l10346
u500:
	line	19
	
l10342:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l10344:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l10346:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l10348:	
	decfsz	(___lwdiv@counter),f
	goto	u511
	goto	u510
u511:
	goto	l10338
u510:
	line	25
	
l10350:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l9421:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_Read_EEPROM_u8
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

;; *************** function _Read_EEPROM_u8 *****************
;; Defined at:
;;		line 51 in file "MyEEProm.c"
;; Parameters:    Size  Location     Type
;;  EEAddress       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddress       1    0[BANK0 ] unsigned char 
;;  EepromData      1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Read_IRData
;; This function uses a non-reentrant model
;;
psect	text536
	file	"MyEEProm.c"
	line	51
	global	__size_of_Read_EEPROM_u8
	__size_of_Read_EEPROM_u8	equ	__end_of_Read_EEPROM_u8-_Read_EEPROM_u8
	
_Read_EEPROM_u8:	
	opt	stack 4
; Regs used in _Read_EEPROM_u8: [wreg+status,2]
;Read_EEPROM_u8@EEAddress stored from wreg
	movwf	(Read_EEPROM_u8@EEAddress)
	line	52
	
l10230:	
	line	53
	
l10232:	
;MyEEProm.c: 53: EEADR = EEAddress;
	movf	(Read_EEPROM_u8@EEAddress),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	54
	
l10234:	
;MyEEProm.c: 54: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	55
	
l10236:	
;MyEEProm.c: 55: EepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Read_EEPROM_u8@EepromData)
	line	56
	
l10238:	
;MyEEProm.c: 56: RD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1248/8)^080h,(1248)&7
	line	57
	
l10240:	
;MyEEProm.c: 57: return EepromData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(Read_EEPROM_u8@EepromData),w
	line	58
	
l4367:	
	return
	opt stack 0
GLOBAL	__end_of_Read_EEPROM_u8
	__end_of_Read_EEPROM_u8:
;; =============== function _Read_EEPROM_u8 ends ============

	signat	_Read_EEPROM_u8,4217
	global	_Write_EEPROM_u8
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:

;; *************** function _Write_EEPROM_u8 *****************
;; Defined at:
;;		line 37 in file "MyEEProm.c"
;; Parameters:    Size  Location     Type
;;  EEAddress       1    wreg     unsigned char 
;;  EEDatas         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddress       1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_Init
;;		_VS1838_Process
;; This function uses a non-reentrant model
;;
psect	text537
	file	"MyEEProm.c"
	line	37
	global	__size_of_Write_EEPROM_u8
	__size_of_Write_EEPROM_u8	equ	__end_of_Write_EEPROM_u8-_Write_EEPROM_u8
	
_Write_EEPROM_u8:	
	opt	stack 3
; Regs used in _Write_EEPROM_u8: [wreg]
;Write_EEPROM_u8@EEAddress stored from wreg
	movwf	(Write_EEPROM_u8@EEAddress)
	line	38
	
l10222:	
;MyEEProm.c: 38: GIE = 0;
	bcf	(95/8),(95)&7
	line	39
;MyEEProm.c: 39: while(GIE) asm("clrwdt");
	goto	l4358
	
l4359:	
# 39 "MyEEProm.c"
clrwdt ;#
psect	text537
	
l4358:	
	btfsc	(95/8),(95)&7
	goto	u341
	goto	u340
u341:
	goto	l4359
u340:
	line	40
	
l10224:	
;MyEEProm.c: 40: EEADR = EEAddress;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Write_EEPROM_u8@EEAddress),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	41
;MyEEProm.c: 41: EEDAT = EEDatas;
	bcf	status, 5	;RP0=0, select bank0
	movf	(Write_EEPROM_u8@EEDatas),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	42
	
l10226:	
;MyEEProm.c: 42: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	43
;MyEEProm.c: 43: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	44
	
l10228:	
;MyEEProm.c: 44: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	45
;MyEEProm.c: 45: while(WR) asm("clrwdt");
	goto	l4361
	
l4362:	
# 45 "MyEEProm.c"
clrwdt ;#
psect	text537
	
l4361:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u351
	goto	u350
u351:
	goto	l4362
u350:
	
l4363:	
	line	47
;MyEEProm.c: 47: GIE = 1;
	bsf	(95/8),(95)&7
	line	48
	
l4364:	
	return
	opt stack 0
GLOBAL	__end_of_Write_EEPROM_u8
	__end_of_Write_EEPROM_u8:
;; =============== function _Write_EEPROM_u8 ends ============

	signat	_Write_EEPROM_u8,8312
	global	_GetADCValue
psect	text538,local,class=CODE,delta=2
global __ptext538
__ptext538:

;; *************** function _GetADCValue *****************
;; Defined at:
;;		line 39 in file "MyADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ADC_num         2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Control
;; This function uses a non-reentrant model
;;
psect	text538
	file	"MyADC.c"
	line	39
	global	__size_of_GetADCValue
	__size_of_GetADCValue	equ	__end_of_GetADCValue-_GetADCValue
	
_GetADCValue:	
	opt	stack 4
; Regs used in _GetADCValue: [wreg+status,2]
	line	40
	
l10212:	
;MyADC.c: 40: unsigned int ADC_num=0;
	clrf	(GetADCValue@ADC_num)
	clrf	(GetADCValue@ADC_num+1)
	line	42
	
l10214:	
;MyADC.c: 42: if(GO_DONE==0){
	btfsc	(249/8),(249)&7
	goto	u331
	goto	u330
u331:
	goto	l2191
u330:
	line	43
	
l10216:	
;MyADC.c: 43: ADC_num=ADRESH;
	movf	(30),w	;volatile
	movwf	(GetADCValue@ADC_num)
	clrf	(GetADCValue@ADC_num+1)
	line	44
;MyADC.c: 44: ADC_num=ADC_num<<8;
	movf	(GetADCValue@ADC_num),w
	movwf	(GetADCValue@ADC_num+1)
	clrf	(GetADCValue@ADC_num)
	line	45
;MyADC.c: 45: ADC_num=ADC_num|ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(GetADCValue@ADC_num),f
	line	46
	
l10218:	
;MyADC.c: 46: GO_DONE=1;
	bsf	(249/8),(249)&7
	line	47
	
l2191:	
	line	48
;MyADC.c: 47: }
;MyADC.c: 48: return ADC_num;
	movf	(GetADCValue@ADC_num+1),w
	movwf	(?_GetADCValue+1)
	movf	(GetADCValue@ADC_num),w
	movwf	(?_GetADCValue)
	line	49
	
l2192:	
	return
	opt stack 0
GLOBAL	__end_of_GetADCValue
	__end_of_GetADCValue:
;; =============== function _GetADCValue ends ============

	signat	_GetADCValue,90
	global	_isKeyPressed
psect	text539,local,class=CODE,delta=2
global __ptext539
__ptext539:

;; *************** function _isKeyPressed *****************
;; Defined at:
;;		line 18 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Control
;; This function uses a non-reentrant model
;;
psect	text539
	file	"MyKey.c"
	line	18
	global	__size_of_isKeyPressed
	__size_of_isKeyPressed	equ	__end_of_isKeyPressed-_isKeyPressed
	
_isKeyPressed:	
	opt	stack 4
; Regs used in _isKeyPressed: [wreg+status,2+status,0]
	line	19
	
l10208:	
;MyKey.c: 19: return PC1 ? 0:1;
	clrc
	btfss	(57/8),(57)&7
	setc
	movlw	0
	skipnc
	movlw	1

	line	20
	
l6560:	
	return
	opt stack 0
GLOBAL	__end_of_isKeyPressed
	__end_of_isKeyPressed:
;; =============== function _isKeyPressed ends ============

	signat	_isKeyPressed,89
	global	_Timer2_Init
psect	text540,local,class=CODE,delta=2
global __ptext540
__ptext540:

;; *************** function _Timer2_Init *****************
;; Defined at:
;;		line 80 in file "MyTIMMER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text540
	file	"MyTIMMER.c"
	line	80
	global	__size_of_Timer2_Init
	__size_of_Timer2_Init	equ	__end_of_Timer2_Init-_Timer2_Init
	
_Timer2_Init:	
	opt	stack 5
; Regs used in _Timer2_Init: [wreg+status,2]
	line	82
	
l10192:	
;MyTIMMER.c: 82: TOUTPS0=0;TOUTPS1=0;TOUTPS2=0;TOUTPS3=0;
	bcf	(147/8),(147)&7
	bcf	(148/8),(148)&7
	bcf	(149/8),(149)&7
	bcf	(150/8),(150)&7
	line	83
;MyTIMMER.c: 83: T2CKPS0=1;T2CKPS1=0;
	bsf	(144/8),(144)&7
	bcf	(145/8),(145)&7
	line	85
	
l10194:	
;MyTIMMER.c: 85: TMR2=0;
	clrf	(17)	;volatile
	line	86
	
l10196:	
;MyTIMMER.c: 86: PR2=12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	89
	
l10198:	
;MyTIMMER.c: 89: PEIE=1;
	bsf	(94/8),(94)&7
	line	90
	
l10200:	
;MyTIMMER.c: 90: TMR2IE=1;
	bsf	(1121/8)^080h,(1121)&7
	line	91
	
l10202:	
;MyTIMMER.c: 91: TMR2IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	92
	
l10204:	
;MyTIMMER.c: 92: GIE=1;
	bsf	(95/8),(95)&7
	line	93
	
l10206:	
;MyTIMMER.c: 93: TMR2ON=1;
	bsf	(146/8),(146)&7
	line	94
	
l7653:	
	return
	opt stack 0
GLOBAL	__end_of_Timer2_Init
	__end_of_Timer2_Init:
;; =============== function _Timer2_Init ends ============

	signat	_Timer2_Init,88
	global	_Timer1_Init
psect	text541,local,class=CODE,delta=2
global __ptext541
__ptext541:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 56 in file "MyTIMMER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text541
	file	"MyTIMMER.c"
	line	56
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2]
	line	58
	
l10170:	
;MyTIMMER.c: 58: T1CKPS1 = 0;T1CKPS0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(133/8),(133)&7
	bsf	(132/8),(132)&7
	line	59
;MyTIMMER.c: 59: T1OSCEN = 0;
	bcf	(131/8),(131)&7
	line	60
	
l10172:	
;MyTIMMER.c: 60: CCP1CON = 0x05;
	movlw	(05h)
	movwf	(21)	;volatile
	line	61
	
l10174:	
;MyTIMMER.c: 61: TMR1CS = 0X00;
	bcf	(129/8),(129)&7
	line	63
	
l10176:	
;MyTIMMER.c: 63: PEIE = 1;
	bsf	(94/8),(94)&7
	line	64
	
l10178:	
;MyTIMMER.c: 64: CCP1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1128/8)^080h,(1128)&7
	line	65
	
l10180:	
;MyTIMMER.c: 65: CCP1IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(104/8),(104)&7
	line	66
	
l10182:	
;MyTIMMER.c: 66: TRISC5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1085/8)^080h,(1085)&7
	line	67
	
l10184:	
;MyTIMMER.c: 67: TMR1H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(15)	;volatile
	line	68
	
l10186:	
;MyTIMMER.c: 68: TMR1L=0;
	clrf	(14)	;volatile
	line	69
	
l10188:	
;MyTIMMER.c: 69: GIE=1;
	bsf	(95/8),(95)&7
	line	70
	
l10190:	
;MyTIMMER.c: 70: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	71
	
l7650:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,88
	global	_GPIO_Init
psect	text542,local,class=CODE,delta=2
global __ptext542
__ptext542:

;; *************** function _GPIO_Init *****************
;; Defined at:
;;		line 34 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text542
	file	"MyConfiguration.c"
	line	34
	global	__size_of_GPIO_Init
	__size_of_GPIO_Init	equ	__end_of_GPIO_Init-_GPIO_Init
	
_GPIO_Init:	
	opt	stack 5
; Regs used in _GPIO_Init: []
	line	36
	
l10168:	
;MyConfiguration.c: 36: TRISA0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	37
;MyConfiguration.c: 37: TRISA1=0;
	bcf	(1065/8)^080h,(1065)&7
	line	38
;MyConfiguration.c: 38: TRISA2=0;
	bcf	(1066/8)^080h,(1066)&7
	line	39
;MyConfiguration.c: 39: TRISA3=0;
	bcf	(1067/8)^080h,(1067)&7
	line	40
;MyConfiguration.c: 40: TRISA4=0;
	bcf	(1068/8)^080h,(1068)&7
	line	41
;MyConfiguration.c: 41: TRISA5=0;
	bcf	(1069/8)^080h,(1069)&7
	line	42
;MyConfiguration.c: 42: TRISA6=0;
	bcf	(1070/8)^080h,(1070)&7
	line	43
;MyConfiguration.c: 43: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	45
;MyConfiguration.c: 45: TRISC0=0;
	bcf	(1080/8)^080h,(1080)&7
	line	46
;MyConfiguration.c: 46: TRISC1=1;
	bsf	(1081/8)^080h,(1081)&7
	line	47
;MyConfiguration.c: 47: TRISC2=0;
	bcf	(1082/8)^080h,(1082)&7
	line	48
;MyConfiguration.c: 48: TRISC3=0;
	bcf	(1083/8)^080h,(1083)&7
	line	49
;MyConfiguration.c: 49: TRISC4=0;
	bcf	(1084/8)^080h,(1084)&7
	line	50
;MyConfiguration.c: 50: TRISC5=0;
	bcf	(1085/8)^080h,(1085)&7
	line	52
;MyConfiguration.c: 52: CM0=1;CM1=1;CM2=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(200/8),(200)&7
	bsf	(201/8),(201)&7
	bsf	(202/8),(202)&7
	line	56
;MyConfiguration.c: 56: ANSEL0=0;ANSEL1=0;ANSEL2=0;ANSEL3=0;ANSEL4=0;ANSEL5=0;ANSEL6=0;ANSEL7=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1160/8)^080h,(1160)&7
	bcf	(1161/8)^080h,(1161)&7
	bcf	(1162/8)^080h,(1162)&7
	bcf	(1163/8)^080h,(1163)&7
	bcf	(1164/8)^080h,(1164)&7
	bcf	(1165/8)^080h,(1165)&7
	bcf	(1166/8)^080h,(1166)&7
	bcf	(1167/8)^080h,(1167)&7
	line	58
;MyConfiguration.c: 58: WPUA0=1;WPUA1=1;WPUA2=1;WPUA3=1;WPUA4=1;WPUA5=1;WPUA6=1;WPUA7=1;
	bsf	(1192/8)^080h,(1192)&7
	bsf	(1193/8)^080h,(1193)&7
	bsf	(1194/8)^080h,(1194)&7
	bsf	(1195/8)^080h,(1195)&7
	bsf	(1196/8)^080h,(1196)&7
	bsf	(1197/8)^080h,(1197)&7
	bsf	(1198/8)^080h,(1198)&7
	bsf	(1199/8)^080h,(1199)&7
	line	60
;MyConfiguration.c: 60: WPUC0=0;WPUC1=1;WPUC2=1;WPUC3=0;WPUC4=0;WPUC5=0;
	bcf	(1088/8)^080h,(1088)&7
	bsf	(1089/8)^080h,(1089)&7
	bsf	(1090/8)^080h,(1090)&7
	bcf	(1091/8)^080h,(1091)&7
	bcf	(1092/8)^080h,(1092)&7
	bcf	(1093/8)^080h,(1093)&7
	line	62
;MyConfiguration.c: 62: WPDA4=0;WPDC1=0;WPDC2=0;WPDC3=0;
	bcf	(1100/8)^080h,(1100)&7
	bcf	(1099/8)^080h,(1099)&7
	bcf	(1098/8)^080h,(1098)&7
	bcf	(1097/8)^080h,(1097)&7
	line	63
	
l3265:	
	return
	opt stack 0
GLOBAL	__end_of_GPIO_Init
	__end_of_GPIO_Init:
;; =============== function _GPIO_Init ends ============

	signat	_GPIO_Init,88
	global	_System_init
psect	text543,local,class=CODE,delta=2
global __ptext543
__ptext543:

;; *************** function _System_init *****************
;; Defined at:
;;		line 21 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text543
	file	"MyConfiguration.c"
	line	21
	global	__size_of_System_init
	__size_of_System_init	equ	__end_of_System_init-_System_init
	
_System_init:	
	opt	stack 5
; Regs used in _System_init: [wreg+status,2]
	line	22
	
l10162:	
;MyConfiguration.c: 22: OPTION = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(129)^080h	;volatile
	line	23
	
l10164:	
;MyConfiguration.c: 23: OSCCON = 0x70;
	movlw	(070h)
	movwf	(143)^080h	;volatile
	line	24
	
l10166:	
;MyConfiguration.c: 24: WDTCON = 0x1E;
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	25
	
l3262:	
	return
	opt stack 0
GLOBAL	__end_of_System_init
	__end_of_System_init:
;; =============== function _System_init ends ============

	signat	_System_init,88
	global	_ISR
psect	text544,local,class=CODE,delta=2
global __ptext544
__ptext544:

;; *************** function _ISR *****************
;; Defined at:
;;		line 24 in file "MyTIMMER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_GetCCP1Value
;;		_VS1838ReceiveHandle
;;		_Clean_countReg
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text544
	file	"MyTIMMER.c"
	line	24
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 2
; Regs used in _ISR: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	ljmp	_ISR
psect	text544
	line	25
	
i1l10282:	
;MyTIMMER.c: 25: Cycle_CCPR=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_Cycle_CCPR)
	clrf	(_Cycle_CCPR+1)
	line	26
	
i1l10284:	
;MyTIMMER.c: 26: if(CCP1IE&CCP1IF == 1)
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1128/8)^080h,(1128)&7
	andlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfss	(104/8),(104)&7
	andlw	0
	iorlw	0
	skipnz
	goto	u43_21
	goto	u43_20
u43_21:
	goto	i1l7641
u43_20:
	line	28
	
i1l10286:	
;MyTIMMER.c: 27: {
;MyTIMMER.c: 28: CCP1IF = 0;
	bcf	(104/8),(104)&7
	line	29
	
i1l10288:	
;MyTIMMER.c: 29: Cycle_CCPR = GetCCP1Value();
	fcall	_GetCCP1Value
	movf	(1+(?_GetCCP1Value)),w
	movwf	(_Cycle_CCPR+1)
	movf	(0+(?_GetCCP1Value)),w
	movwf	(_Cycle_CCPR)
	line	30
	
i1l10290:	
;MyTIMMER.c: 30: VS1838ReceiveHandle(Cycle_CCPR);
	movf	(_Cycle_CCPR+1),w
	movwf	(?_VS1838ReceiveHandle+1)
	movf	(_Cycle_CCPR),w
	movwf	(?_VS1838ReceiveHandle)
	fcall	_VS1838ReceiveHandle
	line	31
	
i1l10292:	
;MyTIMMER.c: 31: Clean_countReg();
	fcall	_Clean_countReg
	line	32
;MyTIMMER.c: 32: }else if(TMR2IE&&TMR2IF){
	goto	i1l7647
	
i1l7641:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u44_21
	goto	u44_20
u44_21:
	goto	i1l7647
u44_20:
	
i1l10294:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u45_21
	goto	u45_20
u45_21:
	goto	i1l7647
u45_20:
	line	33
	
i1l10296:	
;MyTIMMER.c: 33: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	34
	
i1l10298:	
;MyTIMMER.c: 34: count++;
	incf	(_count),f
	skipnz
	incf	(_count+1),f
	line	35
	
i1l10300:	
;MyTIMMER.c: 35: if(count >= num){
	movf	(_num+1),w
	subwf	(_count+1),w
	skipz
	goto	u46_25
	movf	(_num),w
	subwf	(_count),w
u46_25:
	skipc
	goto	u46_21
	goto	u46_20
u46_21:
	goto	i1l10306
u46_20:
	line	36
	
i1l10302:	
;MyTIMMER.c: 36: TMR2ON = 0;
	bcf	(146/8),(146)&7
	line	37
	
i1l10304:	
;MyTIMMER.c: 37: flag_senf = count=0;
	clrf	(_count)
	clrf	(_count+1)
	clrc
	movlw	0
	skipnc
	movlw	1

	movwf	(_flag_senf)
	line	39
	
i1l10306:	
;MyTIMMER.c: 38: }
;MyTIMMER.c: 39: if(send_flag ==0){
	movf	(_send_flag),f
	skipz
	goto	u47_21
	goto	u47_20
u47_21:
	goto	i1l10310
u47_20:
	line	40
	
i1l10308:	
;MyTIMMER.c: 40: send_flag=1;
	clrf	(_send_flag)
	incf	(_send_flag),f
	line	41
;MyTIMMER.c: 41: PC2 = 1;
	bsf	(58/8),(58)&7
	line	42
;MyTIMMER.c: 42: }else{
	goto	i1l7647
	line	43
	
i1l10310:	
;MyTIMMER.c: 43: send_flag=0;
	clrf	(_send_flag)
	line	44
	
i1l10312:	
;MyTIMMER.c: 44: PC2 = 0;
	bcf	(58/8),(58)&7
	line	47
	
i1l7647:	
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	_Clean_countReg
psect	text545,local,class=CODE,delta=2
global __ptext545
__ptext545:

;; *************** function _Clean_countReg *****************
;; Defined at:
;;		line 107 in file "MyTIMMER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text545
	file	"MyTIMMER.c"
	line	107
	global	__size_of_Clean_countReg
	__size_of_Clean_countReg	equ	__end_of_Clean_countReg-_Clean_countReg
	
_Clean_countReg:	
	opt	stack 2
; Regs used in _Clean_countReg: [status,2]
	line	108
	
i1l10326:	
;MyTIMMER.c: 108: TMR1H=0;
	clrf	(15)	;volatile
	line	109
;MyTIMMER.c: 109: TMR1L=0;
	clrf	(14)	;volatile
	line	110
	
i1l7659:	
	return
	opt stack 0
GLOBAL	__end_of_Clean_countReg
	__end_of_Clean_countReg:
;; =============== function _Clean_countReg ends ============

	signat	_Clean_countReg,88
	global	_GetCCP1Value
psect	text546,local,class=CODE,delta=2
global __ptext546
__ptext546:

;; *************** function _GetCCP1Value *****************
;; Defined at:
;;		line 97 in file "MyTIMMER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  values          2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text546
	file	"MyTIMMER.c"
	line	97
	global	__size_of_GetCCP1Value
	__size_of_GetCCP1Value	equ	__end_of_GetCCP1Value-_GetCCP1Value
	
_GetCCP1Value:	
	opt	stack 2
; Regs used in _GetCCP1Value: [wreg+status,2]
	line	98
	
i1l10314:	
	line	100
	
i1l10316:	
;MyTIMMER.c: 100: values = CCPR1H;
	movf	(20),w	;volatile
	movwf	(GetCCP1Value@values)
	clrf	(GetCCP1Value@values+1)
	line	101
	
i1l10318:	
;MyTIMMER.c: 101: values = values<<8;
	movf	(GetCCP1Value@values),w
	movwf	(GetCCP1Value@values+1)
	clrf	(GetCCP1Value@values)
	line	102
	
i1l10320:	
;MyTIMMER.c: 102: values = values|CCPR1L;
	movf	(19),w	;volatile
	iorwf	(GetCCP1Value@values),f
	line	103
	
i1l10322:	
;MyTIMMER.c: 103: return values;
	movf	(GetCCP1Value@values+1),w
	movwf	(?_GetCCP1Value+1)
	movf	(GetCCP1Value@values),w
	movwf	(?_GetCCP1Value)
	line	104
	
i1l7656:	
	return
	opt stack 0
GLOBAL	__end_of_GetCCP1Value
	__end_of_GetCCP1Value:
;; =============== function _GetCCP1Value ends ============

	signat	_GetCCP1Value,90
	global	_VS1838ReceiveHandle
psect	text547,local,class=CODE,delta=2
global __ptext547
__ptext547:

;; *************** function _VS1838ReceiveHandle *****************
;; Defined at:
;;		line 25 in file "MyIR.c"
;; Parameters:    Size  Location     Type
;;  capdata         2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text547
	file	"MyIR.c"
	line	25
	global	__size_of_VS1838ReceiveHandle
	__size_of_VS1838ReceiveHandle	equ	__end_of_VS1838ReceiveHandle-_VS1838ReceiveHandle
	
_VS1838ReceiveHandle:	
	opt	stack 2
; Regs used in _VS1838ReceiveHandle: [wreg-fsr0h+status,2+status,0]
	line	26
	
i1l10244:	
;MyIR.c: 26: switch(VS1838_Status)
	goto	i1l10280
	line	29
	
i1l10246:	
;MyIR.c: 29: if((capdata >= 8500)&&(capdata <= 12500))
	movlw	high(02134h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(02134h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipc
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l10252
u36_20:
	
i1l10248:	
	movlw	high(030D5h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(030D5h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipnc
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l10252
u37_20:
	line	31
	
i1l10250:	
;MyIR.c: 30: {
;MyIR.c: 31: VS1838_Status = 1;
	clrf	(_VS1838_Status)
	incf	(_VS1838_Status),f
	line	32
;MyIR.c: 32: } else
	goto	i1l5470
	line	34
	
i1l10252:	
;MyIR.c: 33: {
;MyIR.c: 34: VS1838_Status = 0;
	clrf	(_VS1838_Status)
	line	35
;MyIR.c: 35: VS1838_Receive_Count = 0;
	clrf	(_VS1838_Receive_Count)
	goto	i1l5470
	line	39
	
i1l10254:	
;MyIR.c: 39: if((capdata>=2000)&&(capdata<=2500))
	movlw	high(07D0h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(07D0h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipc
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l10260
u38_20:
	
i1l10256:	
	movlw	high(09C5h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(09C5h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipnc
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l10260
u39_20:
	line	41
	
i1l10258:	
;MyIR.c: 40: {
;MyIR.c: 41: VS838_Receive_Data=VS838_Receive_Data<<1;
	clrc
	rlf	(_VS838_Receive_Data),f
	rlf	(_VS838_Receive_Data+1),f
	rlf	(_VS838_Receive_Data+2),f
	rlf	(_VS838_Receive_Data+3),f
	line	42
;MyIR.c: 42: VS1838_Receive_Count++;
	incf	(_VS1838_Receive_Count),f
	line	43
;MyIR.c: 43: }
	goto	i1l10274
	line	45
	
i1l10260:	
;MyIR.c: 44: else
;MyIR.c: 45: if((capdata >= 4000)&&(capdata <= 5000))
	movlw	high(0FA0h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(0FA0h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipc
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l10268
u40_20:
	
i1l10262:	
	movlw	high(01389h)
	subwf	(VS1838ReceiveHandle@capdata+1),w
	movlw	low(01389h)
	skipnz
	subwf	(VS1838ReceiveHandle@capdata),w
	skipnc
	goto	u41_21
	goto	u41_20
u41_21:
	goto	i1l10268
u41_20:
	line	47
	
i1l10264:	
;MyIR.c: 46: {
;MyIR.c: 47: VS838_Receive_Data=VS838_Receive_Data<<1;
	clrc
	rlf	(_VS838_Receive_Data),f
	rlf	(_VS838_Receive_Data+1),f
	rlf	(_VS838_Receive_Data+2),f
	rlf	(_VS838_Receive_Data+3),f
	line	48
	
i1l10266:	
;MyIR.c: 48: VS838_Receive_Data=VS838_Receive_Data|0x0001;
	bsf	(_VS838_Receive_Data)+(0/8),(0)&7
	line	49
;MyIR.c: 49: VS1838_Receive_Count++;
	incf	(_VS1838_Receive_Count),f
	line	50
;MyIR.c: 50: }
	goto	i1l10274
	line	53
	
i1l10268:	
;MyIR.c: 51: else
;MyIR.c: 52: {
;MyIR.c: 53: VS1838_Status = 0;
	clrf	(_VS1838_Status)
	line	54
	
i1l10270:	
;MyIR.c: 54: VS838_Receive_Data = 0;
	clrf	(_VS838_Receive_Data)
	clrf	(_VS838_Receive_Data+1)
	clrf	(_VS838_Receive_Data+2)
	clrf	(_VS838_Receive_Data+3)
	line	55
;MyIR.c: 55: VS1838_Receive_Count = 0;
	clrf	(_VS1838_Receive_Count)
	goto	i1l10274
	line	58
	
i1l5467:	
	line	60
;MyIR.c: 59: {
;MyIR.c: 60: VS1838_receive_ok = 1;
	clrf	(_VS1838_receive_ok)
	incf	(_VS1838_receive_ok),f
	goto	i1l10252
	line	58
	
i1l10274:	
	movf	(_VS1838_Receive_Count),w
	xorlw	020h
	skipnz
	goto	u42_21
	goto	u42_20
u42_21:
	goto	i1l5467
u42_20:
	goto	i1l5470
	line	69
	
i1l10276:	
;MyIR.c: 67: {
;MyIR.c: 69: VS1838_Status=0;
	clrf	(_VS1838_Status)
	line	71
;MyIR.c: 70: }
;MyIR.c: 71: break;
	goto	i1l5470
	line	26
	
i1l10280:	
	movf	(_VS1838_Status),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte            8     6 (fixed)
; jumptable            260     6 (fixed)
; rangetable             6     6 (fixed)
; spacedrange           10     9 (fixed)
; locatedrange           2     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l10246
	xorlw	1^0	; case 1
	skipnz
	goto	i1l10254
	goto	i1l10276
	opt asmopt_on

	line	73
	
i1l5470:	
	return
	opt stack 0
GLOBAL	__end_of_VS1838ReceiveHandle
	__end_of_VS1838ReceiveHandle:
;; =============== function _VS1838ReceiveHandle ends ============

	signat	_VS1838ReceiveHandle,4216
psect	text548,local,class=CODE,delta=2
global __ptext548
__ptext548:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
