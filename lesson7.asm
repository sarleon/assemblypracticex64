        %include 'functions.asm'
        SECTION .data
        msg1    db      'moriturus te saluto!' , 0h
        msg2    db      'heil centurio !' ,0h

        SECTION .text
        global main
main:
        mov     rax , msg1
        call    sprintLF

        mov     rax , msg2
        call    sprintLF

        call    quit
