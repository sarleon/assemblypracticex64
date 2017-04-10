        SECTION .data
        msg     db      "moriturus te saluto" ,0Ah

        SECTION .text
        global main
main:
        mov     rdi , msg
        mov     rax , rdi

nextchar:
        cmp     byte[rax] , 0   ;
        jz      finished

        inc     rax
        jmp     nextchar

finished:
        sub     rax , rdi


        mov     rdx , rax
        mov     rsi , msg
        mov     rdi , 1
        mov     rax , 1
        syscall

        mov     rdi , 0
        mov     rax , 60
        syscall
