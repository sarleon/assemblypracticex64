        %include 'functions.asm'
        SECTION .text
        global main
main:
        mov     rsi , 0
nextNumber:
        inc     rsi
        mov     rax , rsi
        call    iprintLF
        cmp     rsi , 1111
        jne     nextNumber
        call    quit
