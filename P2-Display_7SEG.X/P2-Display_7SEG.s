;Nombre: P2-Display_7SEG
;Fecha: 13/01/2023
;Descripción:
;    Si el botón de la placa no esta presionado, se muestran los valores (0-9)
;    Si el botón de la placa se mantiene presionado, se muestran los valores (A-F)
;    Los valores se muestran en un display de 7 segmentos
;Autor: Jorhs Giampier Silva Flores
    
#include "Bit_Config.inc" /config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc"
    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 
Main:
    CALL Config_OSC,1
    CALL Button
    CALL Display
    CALL Loop
    NOP
Loop:
    BTFSS PORTA,3,1
    goto Letras
Numeros:
    ; Número 0
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0    
    BCF TRISD,3,0
    BCF LATD,3,0    
    BCF TRISD,4,0
    BCF LATD,4,0   
    BCF TRISD,5,0
    BCF LATD,5,0   
    BCF TRISD,6,0
    BSF LATD,6,0   
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 1
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 2
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 3
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 4
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 5
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 6
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 7
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 8
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Número 9
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letras
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    goto Loop
Letras:
    
    ; Letra A
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Letra b
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Letra C
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Letra d
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Letra E
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BSF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    ; Letra F
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0    
    BCF TRISD,2,0
    BSF LATD,2,0    
    BCF TRISD,3,0
    BSF LATD,3,0   
    BCF TRISD,4,0
    BCF LATD,4,0    
    BCF TRISD,5,0
    BCF LATD,5,0   
    BCF TRISD,6,0
    BCF LATD,6,0   
    BCF TRISD,7,0
    BSF LATD,7,1
    BTFSC PORTA,3,1
    goto Numeros
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    goto Loop
    
Button:
    BANKSEL PORTA
    CLRF PORTA,1
    CLRF ANSELA,1
    BSF TRISA,3,1
    BSF LATA,3,1
    BSF WPUA,3,1
    RETURN
     
Config_OSC:
    BANKSEL OSCCON1
    MOVLW 0x60		;seleccionamos el bloque del osc interno con un div:1 
    MOVWF OSCCON1,1
    MOVLW 0x02		;;Seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1
    RETURN   
    
Display:
    BANKSEL PORTD
    CLRF PORTD,0
    CLRF ANSELD,0
    RETURN
    
    END resetVect
