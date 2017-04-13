        %include 'functions.asm'
        SECTION .text
        global  main
main:
        mov     rax , 90
        mov     rdi , 9
        sub     rax , rdi
        call    iprintLF
        call    quit
