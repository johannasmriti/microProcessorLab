Data segment
    s1 db 'Good morning all $'
    l1 db $-s1
    s2 db 'Have a nice day$'
    l2 db $-s2
Data ends

Code segment
    Begin: 
    mov ax,Data
    mov ds,ax 
    
    lea si,s1
    mov cl,l1
    sub cl,1 
    findingS1End:
        inc si
        dec cl
        jne findingS1End
        
    lea di,s2
    mov cl,l2
    concatAtEnd:
        mov al,[di] 
        mov [si],al         
        inc di
        inc si
        dec cl
        jnz concatAtEnd
    
        lea dx,s1
        mov ah,09H
        int 21H
    
Code ends
end Begin
