        %include 'functions.asm'
        SECTION .text

        global main
main:
        mov     rax , 90
        mov     rdi , 9
        mul     rdi             ;mutiple by rax and store to rax

        call    iprintLF

        call    quit
