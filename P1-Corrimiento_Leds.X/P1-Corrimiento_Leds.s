;Nombre: P1-Corrimiento_Leds
;Fecha: 13/01/2023
;Descripción: 
;    Corrimientos de leds pares con un retardo de 500ms e impares de 250ms
;Autor: Jorhs Giampier Silva Flores
    
PROCESSOR 18F57Q84 
#include "Bit_Config.inc" 
#include "Retardos.inc"
#include <xc.inc>
    
PSECT resetVect,class=CODE, reloc=2
resetVect:
    goto Main
PSECT CODE
Main:
    CALL    Config_OSC
    CALL    Config_Port
    NOP

verifica:
    BANKSEL PORTA
    BTFSC   PORTA,3,1		; PORTA<3> = 0? - button press? si-> skip instrucction / no -> next instruction
    GOTO    verifica		; instruccion siguiente
    Led_Stop2:   
	CALL    Delay_250ms	; = 0 -> skip
	BTFSS   PORTA,3,1	; PORTA<3> = 1? button no press? no -> skip instrucction / si -> next instruction
	GOTO    verifica	; salta si es 1
	
    
    Corrimiento_general:
    
    Corrimiento_impar:
    ; Delay 250ms
	BANKSEL PORTE
	BSF	PORTE,0,1
	BANKSEL PORTC
	CLRF	PORTC,1
	BSF	PORTC,0,1
	CALL	Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
 	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	    ;mover un bit a la izquierda
	CALL Delay_250ms,1
	BCF	PORTE,0,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
    
    Corrimiento_par:
    ;Delay 500ms
	BANKSEL PORTE
	BSF	PORTE,1,1
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	RLNCF   PORTC,1,1	;mover un bit a la izquierda
	CALL Delay_250ms,1
	CALL Delay_250ms,1
	BCF PORTE,1,1
	BTFSS PORTA,3,1
	CALL	Led_Stop
	GOTO Corrimiento_impar
   
Led_Stop:   
    CALL    Delay_1s	  ; Salta si es 0
    BTFSC   PORTA,3,1	  ;PORTA<3> = 1? - button no press? no -> skip instrucction / si -> next instruction
    GOTO    verifica2	  ; salta si es 1
verifica2:
    BANKSEL PORTA
    BTFSC   PORTA,3,1	  ; PORTA<3> = 0? button press? si-> skip instrucction / no -> next instruction
    GOTO    verifica2	  ; next instruction	 
    RETURN    
	
Config_OSC:
    BANKSEL OSCCON1
    MOVLW 0x60		  ;seleccionamos el bloque del osc interno con un div:1
    MOVWF OSCCON1
    MOVLW 0X02		  ;seleccionamos a una frecuencia de 4Mhz
    MOVWF OSCFRQ
    RETURN
 
Config_Port:	  
    ;Button Config
    BANKSEL PORTA
    CLRF    PORTA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;RA3 = salida
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP DEL PIN RA3
    ;Port Config E
    BANKSEL PORTE
    CLRF    PORTE,1	;PORTE<7,0> = 0
    CLRF    ANSELE,1	;PORTE DIGITAL
    BCF	    TRISE,0,1	;RE0 = SALIDA
    BCF	    TRISE,1,1	;RE1 = SALIDA
    ;Port Config C
    BANKSEL PORTC
    CLRF    PORTC,1	;PORTC<7,0>=0
    CLRF    ANSELC,1	;PORTC DIGITAL
    CLRF    TRISC,1	;PORTC COMO SALIDA
    RETURN