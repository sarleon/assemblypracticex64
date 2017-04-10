        SECTION .data
        msg     db      "hello world!",0Ah

        SECTION .text
        global main

main:
        mov     rdx , 13
        mov     rsi , msg
        mov     rdi , 1
        mov     rax , 1
        syscall

        mov     rdi , 0
        mov     rax , 60
        syscall
