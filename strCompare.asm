;compare string
;two types
;1. CMPSB - compares byte size string (compares byte by byte)
;2. CMPSW - compares word size string (compares word by word)

DATA SEGMENT
    ARRAY1 DB 'HANNA' 
    ARRAY2 DB 'ANNA'
    CNT DB 05H
    STR1 DB 'STRINGS ARE EQUAL $'
    STR2 DB 'STRINGS RE UNEQUAL $'
DATA ENDS

CODE SEGMENT
    ASSUME CS: CODE,DS: DATA, ES:DATA
    START:
        MOV AX,DATA
        MOV DS,AX
        MOV ES,AX
        MOV CL,CNT
        LEA SI,ARRAY1
        LEA DI,ARRAY2
        REP CMPSB 
        JNZ L1
        LEA DX,STR1
        JMP L2
        L1: LEA DX,STR2
        L2:MOV AH,09H
           INT 21H    
CODE ENDS
END START