PRINT MACRO MSG
    LEA DX,MSG
    MOV AH,09H
    INT 21H
ENDM

DATA SEGMENT
    ARRAY DB 03H,01H,10H,02H,20H,30H
    LEN1 EQU ($-ARRAY) 
    KEY DB 01H
    STR1 DB 0DH,0AH,'KEY FOUND',0DH,0AH,'$'   
    STR2 DB 0DH,0AH,'KEY NOT FOUND',0DH,0AH,'$' 
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,ARRAY
        MOV CX,LEN1
        MOV BL,KEY
    NEXT:
        MOV AL,[SI]
        CMP AL,BL
        JE FOUND 
        INC SI
        DEC CX
        JNZ NEXT
        PRINT STR2
        JMP EXIT
    FOUND:    
        PRINT STR1
    EXIT:         
        MOV AH,4CH
        INT 21H
CODE ENDS
END START