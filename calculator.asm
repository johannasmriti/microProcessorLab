org 100h 
jmp start 
op1 dw 100   
op2 dw 10   
addRes dw ? 
subRes dw ?
mulResL dw ? 
mulResH dw ?
divRem dw ?     
divQuo dw ?


start:

lea si, op1 
lea bx, op2    

;add  

lea di, addRes  
mov ax, [si]
add ax, [bx]
mov [di], ax 

;sub            
lea di, subRes
mov ax, [si]   
sub ax, [bx]
mov [di], ax  

;mul
mov ax, [si] 
mov cx, [bx]
mul cx
lea di, mulResL
mov [di], ax          
lea di, mulResH
mov [di], dx
      
          
;div
mov ax, [si] 
mov cx, [bx]
div cx
lea di, divRem
mov [di], dx    
lea di, divQuo
mov [di], ax   

hlt