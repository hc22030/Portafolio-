section .data
mensaje db "El resultado de la multiplicación es: "
len equ $ - mensaje

section .bss
resultado resb 4

section .text
global _start

_start:

    ;Datos de la multiplicación
    mov al, 10   
    mov bl, 5     

    mul bl ; Multiplica al por bl

  
    mov eax, 10    
    div ebx        
    mov [resultado + 1], dl 

    mov [resultado], al    

    ;Convierte los dìgitos en caracter ASCII 
    add byte [resultado], '0'  
    add byte [resultado + 1], '0'

    ; Imprime el mensaje 
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 0x80

    ; Imprime el resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2     ; Se encarga de imprimir dos dìgitos 
    int 0x80

salir:
    mov eax, 1
    mov ebx, 0
    int 0x80  
