PROCESSOR 18F57Q84
#include "Bit_Config.inc"   /config statements should precede project file includes./
#include "Retardos.inc"
#include <xc.inc>
    

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT ISRVectLowPriority,class=CODE,reloc=2
ISRVectLowPriority:
    BTFSS   PIR1,0,0	
    GOTO    Exit1
Leds_on1:
    BCF	    PIR1,0,0	
    GOTO    Reload
Exit1:
    RETFIE
PSECT ISRVectHighPriority,class=CODE,reloc=2
ISRVectHighPriority:
    BTFSS   PIR10,0,0	
    GOTO    Exit
Leds_on2:
    BCF	    PIR10,0,0	; limpiamos el flag de INT2
    GOTO    Exit2
Exit2:
    RETFIE    

PSECT udata_acs
contador1:  DS 1	    
contador2:  DS 1
offset:	    DS 1
offset1:    DS 1
counter:    DS 1
counter1:   DS 1 
    
PSECT CODE    
Main:
    CALL    Config_OSC,1
    CALL    Config_Port,1
    CALL    Config_PPS,1
    CALL    Config_INT0_INT1_INT2
    CALL    Secuencias
toggle:
   BTG	   LATF,3,0
   CALL    Delay_250ms,1
   CALL    Delay_250ms,1
   BTG	   LATF,3,0
   CALL    Delay_250ms,1
   CALL    Delay_250ms,1
   goto	   toggle

Loop:
    BSF	    LATF,3,0	   
    BANKSEL PCLATU
    MOVLW   low highword(Table)
    MOVWF   PCLATU,1
    MOVLW   high(Table)
    MOVWF   PCLATH,1
    RLNCF   offset,0,0
    CALL    Secuencia
    MOVWF   LATC,0
    CALL    Delay_250ms,1
    DECFSZ  counter,1,0
    GOTO    Next_Seq
    
Verifica:
    DECFSZ  counter1,1,0
    GOTO    Reload2
    Goto    off
    
 Next_Seq:
    INCF    offset,1,0
    GOTO    Loop
    
Reload:
    MOVLW   0x05	
    MOVWF   counter1,0	
    MOVLW   0x00	
    MOVWF   offset,0	
    
Reload2:
    MOVLW   0x0A	
    MOVWF   counter,0	
    MOVLW   0x00	
    MOVWF   offset,0	
    GOTO    Loop  
    
    
Config_OSC:
    BANKSEL OSCCON1
    MOVLW   0x60    
    MOVWF   OSCCON1,1 
    MOVLW   0x02    
    MOVWF   OSCFRQ,1
    RETURN
OFF:
    NOP
    
Config_Port:	
    ;Config Led
    BANKSEL PORTF
    CLRF    PORTF,1	
    BSF	    LATF,3,1
    BSF	    LATF,2,1
    CLRF    ANSELF,1	
    BCF	    TRISF,3,1
    BCF	    TRISF,2,1
    
    ;Button RA3
    BANKSEL PORTA
    CLRF    PORTA,1	
    CLRF    ANSELA,1	
    BSF	    TRISA,3,1	
    BSF	    WPUA,3,1
    
    ;Button RB4
    BANKSEL PORTB
    CLRF    PORTB,1	
    CLRF    ANSELB,1	
    BSF	    TRISB,4,1	
    
    
    ;BUTTON RF2
    BANKSEL PORTF
    CLRF    PORTF,1	
    CLRF    ANSELF,1	
    BSF	    TRISF,2,1	
   
    
    ;Config PORTC
    BANKSEL PORTC
    CLRF    PORTC,1	
    CLRF    LATC,1	
    CLRF    ANSELC,1	
    CLRF    TRISC,1
    RETURN
    
    
Config_PPS:
    ;Config INT0
    BANKSEL INT0PPS
    MOVLW   0x03       
    MOVWF   INT0PPS,1	
    
    ;Config INT1
    BANKSEL INT1PPS
    MOVLW   0x0C
    MOVWF   INT1PPS,1	
    
    ;Config INT2
    BANKSEL INT2PPS
    MOVLW   0x2A
    MOVWF   INT2PPS,1   
    
    RETURN
    
Config_INT0_INT1_INT2:
    ;Configuracion de prioridades
    BSF	INTCON0,5,0 
    BANKSEL IPR1
    BCF	IPR1,0,1    
    BSF	IPR6,0,1   
    BSF IPR10,0,1   
    
    ;Config INT0
    BCF	INTCON0,0,0 
    BCF	PIR1,0,0    
    BSF	PIE1,0,0   
    
    ;Config INT1
    BCF	INTCON0,1,0 
    BCF	PIR6,0,0   
    BSF	PIE6,0,0    
    
    ;Config INT2
    BCF INTCON0,,0 
    BCF PIR10,0,0  
    BSF PIE10,0,0 
    
    ;enable interrupts
    BSF	INTCON0,7,0 
    BSF	INTCON0,6,0 
    RETURN
   
Secuencias:
    ADDWF   PCL,1,0
    RETLW   10000001B	
    RETLW   01000010B	
    RETLW   00100100B	
    RETLW   00011000B	
    RETLW   00000000B	
    RETLW   00011000B	
    RETLW   00100100B	
    RETLW   01000010B	
    RETLW   10000001B	
    RETLW   00000000B	

Delay_250ms:		    ; 2Tcy -- Call
    MOVLW   250		    ; 1Tcy -- k2
    MOVWF   contador2,0	    ; 1Tcy
; T = (6 + 4k)us	    1Tcy = 1us
Ext_Loop:		    
    MOVLW   249		    ; 1Tcy -- k1
    MOVWF   contador1,0	    ; 1Tcy
Int_Loop:
    NOP			    ; k1*Tcy
    DECFSZ  contador1,1,0   ; (k1-1)+ 3Tcy
    GOTO    Int_Loop	    ; (k1-1)*2Tcy
    DECFSZ  contador2,1,0
    GOTO    Ext_Loop
    RETURN		    ; 2Tcy
    
Delay_500ms:
    MOVLW 245
    MOVWF Contador2,0   
Primer_loop: ; (6+8k)
    ; 2 Tcy por el call
    MOVLW	255	    ; 1 Tcy
    MOVWF	Contador1,0 ; 1 Tcy
segundo_loop:
    NOP
    NOP
    NOP
    NOP
    NOP			    ; 1 Tcy
    DECFSZ Contador1,1,0    ; (k-1)+3Tcy
    GOTO   segundo_loop    ; (k-1)*Tcy, salta a goto cuando no es cero
    DECFSZ Contador2,1,0    ; (k-1)+3Tcy
    GOTO   Primer_loop
    RETURN		    ; 2 Tcy, salta a return cuando es cero       

     
   
End resetVect


