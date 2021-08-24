data segment 
m1 db "enter side: $"
newline db 13,10,"$"
m2 db "Volume of cube of radius $ "
m3 db " is $" 
product dw 1
val db ?
ends 

code segment 
start:
mov ax, @data
mov ds, ax 

lea dx,m1
mov ah, 09h 
int 21h 

mov ah, 01h 
int 21h 
sub al, 30h 
mov [val],al 
mov cl, 3 

for: 
mul [product]
cmp cl,1
je for_end:
mov byte ptr product, al
mov al,[val]
loop for 

for_end:
aam
mov [product],ax

lea dx, newline 
mov ah, 09h 
int 21h 

lea dx, m2 
mov ah, 09h 
int 21h 

mov dl,[val]
add dl,30h 
mov ah, 02h 
int 21h 

lea dx, m3
mov ah, 09h 
int 21h

mov dl, byte ptr product[1]
add dl, 30h 
mov ah, 02h 
int 21h 

mov dl, byte ptr product[0]
add dl, 30h 
mov ah, 02h 
int 21h 

mov ax, 4c00h 
int 21h 

ends

end start
