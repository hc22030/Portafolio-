section .data 

  num1 dw 30
  num2 dw 5
  num3 dw 4
  mensaje db "La resta es: ", 0xA
  len equ $ -mensaje 
  
section .bss
  
  resultado resb 2

section .text

   global _start

_start:

   mov ax, [num1]
   sub ax, [num2]
   sub ax, [num3]
   
   mov ah,0
   mov bl, 10
   div bl
   
   add al, '0'
   add ah, '0'
   
   mov [resultado], al
   mov [resultado + 1], ah
   
   ; imprime el mensaje
   mov eax, 4
   mov ebx, 1
   mov ecx, mensaje
   mov edx, len
   int 0x80
   
   ; imprime el resultado
   mov eax, 4
   mov ebx, 1
   mov ecx, resultado
   mov edx, 2
   int 0x80
   
   ; final
   mov eax, 1
   mov ebx, 0
   int 0x80  ;Interrupción del sistema 
