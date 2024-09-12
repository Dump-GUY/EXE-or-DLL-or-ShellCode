section .text
bits 64
global _start

_start:
    db 0x4D, 0x5A               ; "MZ" DOS signature, valid as 64-bit instruction
    call get_base               ; Call instruction pushes the return address onto the stack
get_base:
    pop rsi                     ; Pop the return address into RSI, which is now our current address
    sub rsi, 7                  ; Adjust the current address by subtracting 7 bytes to get base
    add rsi, 0x900              ; Add raw address of exported func "test" - adjust if needed
    jmp rsi
    db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0