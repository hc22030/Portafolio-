section .data 

mensaje dd "La division es: " ;Mensaje a ser mostrado 
len equ $ -mensaje ;Longitud del mensaje

section .bss   ;Variables no inicializadas 

resultado resb 6   ;Reserva el espacio para almacenar el resulado de la división 

section .text 

  global _start ;Inicio del programa
  
_start:

    mov eax, 10
    mov ebx, 2
    
    div ebx ;Realiza la división
    
    add eax, "0"  ; Convierte el resultado en un carácter ASCII
    
    mov [resultado], eax ; Almacena el resultado convertido en la variable resultado
    ;Imprime el mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje 
    mov ebx, len
    int 0x80
    ;Muestra el resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado 
    mov edx, 4
    int 0x80
    
salir:
    
    mov eax, 1
    mov ebx, 0
    int 0x80
