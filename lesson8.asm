        %include 'functions.asm'
        SECTION .text
        global  main
main:
        pop     rdi

nextArg:
        cmp     rdi , 1h
        jz      noMoreArgs
        pop     rax
        call    sprintLF
        dec     rdi
        jmp     nextArg
noMoreArgs:
        call    quit
