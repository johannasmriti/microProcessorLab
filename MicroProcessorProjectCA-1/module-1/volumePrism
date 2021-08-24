org 100h
.data
a db 10,13,"Enter the Length of base : $"     
b db 10,13,"Enter the Breadth of base : $"    
c db 10,13,"Enter the Height of the prism : $"
d db 10,13,"Volume of the prism is $"     
product dw 1
.code
mov ax,@data
mov ds,ax 
       
;first       
lea dx,a
mov ah,09h
int 21h

mov ah,01
int 21h   

mov bl,al  

;second
lea dx,b
mov ah,09h
int 21h

mov ah,01
int 21h 

mov bh,al 

;third
lea dx,c
mov ah,09h
int 21h

mov ah,01
int 21h 
mov cl,al  
;sub lel          
sub bh,30h
sub bl,30h 
sub cl,30h
 
 
lea dx,d
mov ah,09h
int 21h

mov al,bl
mul bh
mov product,ax 

mul cl
aam
mov product,ax

mov dl,byte ptr product[1]    
add dx,30h
mov ah,02
int 21h            


mov dl,byte ptr product[0]    
add dx,30h
mov ah,02
int 21h              

ret
