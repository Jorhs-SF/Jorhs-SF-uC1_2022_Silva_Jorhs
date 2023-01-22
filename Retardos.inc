PSECT udata_acs
contador1:  DS 1	    ;reserva 1 byte en acces ram
contador2:  DS 1 

    
PSECT code  
 
Delay_Loop:
    Nop			    ; k*Tcy  
    DECFSZ  contador1,1,0   ; (k-1)+ 3Tcy 
    GOTO    Delay_Loop	    ; (k-1)+2Tcy 
    RETURN
    
Delay_10us:		    ; 2Tcy -- Call		   
    MOVLW   	1	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop
    
Delay_25us:		    ; 2Tcy -- Call		   
    MOVLW   	5	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop
    
Delay_50us:		    ; 2Tcy -- Call		   
    MOVLW   	11	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop
    
Delay_100us:		    ; 2Tcy -- Call		   
    MOVLW   	31	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop 
    
Delay_200us:		    ; 2Tcy -- Call		   
    MOVLW   	48	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop
    
Delay_250us:		    ; 2Tcy -- Call		   
    MOVLW   	81	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop     
    
Delay_500us:		    ; 2Tcy -- Call		   
    MOVLW   	124	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop
    
Delay_1ms:		    ; 2Tcy -- Call		   
    MOVLW   	249	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy 
    GOTO    Delay_Loop     
    
Ext_Loop:		   
    MOVLW   	249	    ; 1Tcy
    MOVWF   contador1,0	    ; 1Tcy
Int_Loop:
    Nop			    ; k*Tcy
    DECFSZ  contador1,1,0   ; (k-1)+ 3Tcy
    GOTO    Int_Loop	    ; (k-1)+2Tcy
    DECFSZ  contador2,1,0
    GOTO    Ext_Loop	  
    RETURN		    ; 2Tcy
Delay_5ms:		    ; 2Tcy -- Call
    MOVLW   5	    ; 1Tct
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop

Delay_10ms:		    ; 2Tcy -- Call
    MOVLW   10	    ; 1Tct
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop
    
Delay_25ms:		    ; 2Tcy -- Call
    MOVLW   25	    ; 1Tct
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop
    
Delay_50ms:		    ; 2Tcy -- Call
    MOVLW   50    ; 1Tct
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop
    
Delay_100ms:		    ; 2Tcy -- Call
    MOVLW   100		    ; 1Tct
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop
    
Delay_200ms:            ; 2 Tcy
    MOVLW   200         ; 1 Tcy --k2
    MOVWF   contador2,0 ; 1 Tcy
    GOTO    Ext_Loop
    
Delay_250ms:
    MOVLW   250		    ; 2Tcy -- Call
    MOVWF   contador2,0	    ; 1Tcy
    GOTO    Ext_Loop
