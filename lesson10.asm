        %include 'functions.asm'
        SECTION         .text
        global  main
main:
        mov     rsi , 0
nextNumber:
        inc     rsi

        mov     rax , rsi
        add     rax , 48
        push    rax
        mov     rax , rsp
        call    sprintLF

        pop     rax
        cmp     rsi , 10
        jne     nextNumber

        call    quit
