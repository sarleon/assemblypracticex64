        %include 'functions.asm'
        SECTION         .data
        msg1    db      'intrabit quaeso nomen tuum' , 0h
        msg2    db      'salve !',0h

        SECTION         .bss
        sinput  resb    255

        SECTION         .text
        global  main
main:
        mov     rax , msg1
        call    sprintLF


        mov     rdx , 255
        mov     rsi , sinput
        mov     rdi , 0
        mov     rax , 0

        syscall


        mov     rax , msg2
        call    sprint

        mov     rax , sinput
        call    sprintLF

        call    quit
