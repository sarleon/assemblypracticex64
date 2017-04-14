        %include 'functions.asm'

        SECTION .data
        msg     db      ' remain '
        SECTION .text
        global  main
main:
        mov     rax , 92
        mov     rdi , 9
        xor     rdx , rdx
        div    rdi             ;divide rax by the number in register ,and store the quotient in rax,remainder in rdx
        call    iprint
        mov     rax , msg
        call    sprint
        mov     rax , rdx
        call    iprint
        call    quit
