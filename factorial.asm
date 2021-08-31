.STACK 100H
.DATA
    NUM DB 05H
    FACT DW ?
.CODE

    MAIN PROC        
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AX,1
        MOV BL,NUM
        MOV BH,0
        CALL FACTORIAL
        MOV FACT,AX
          
        HLT     
                
        
    MAIN ENDP
    
    FACTORIAL PROC
        CMP BX,1
        JE BACK
        PUSH BX
        DEC BX
        CALL FACTORIAL
        POP BX
        MUL BX
        
        BACK:
            RET
    FACTORIAL ENDP
