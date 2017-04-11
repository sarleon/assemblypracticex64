slen:
        push    rdi
        mov     rdi , rax


nextchar:
        cmp     byte[rax] , 0
        jz      finished
        inc     rax
        jmp     nextchar

finished:
        sub     rax , rdi
        pop     rdi
        ret


sprint:
        push    rcx
        push    rdx
        push    rsi
        push    rdi
        push    rax

        call    slen
        mov     rdx , rax
        pop     rax

        mov     rsi , rax
        mov     rax , 1
        mov     rdi , 1
        syscall


        pop     rdi
        pop     rsi
        pop     rdx
        pop     rcx
        ret

quit:
        mov     rdi , 0
        mov     rax , 60
        syscall
        ret
sprintLF:
        call    sprint

        push    rax
        mov     rax  , 0Ah
        push    rax
        mov     rax , rsp
        call    sprint
        pop     rax
        pop     rax
        ret
iprint:                         ;parameter in rax
        push    rax
        push    rcx
        push    rdx
        push    rsi
        mov     rcx , 0
divideLoop:
        inc     rcx             ;count byte to print
        mov     rdx , 0         ;empty  rdx
        mov     rsi , 10        ;mov rsi to 10
        idiv    rsi             ;divide rax by rsi,store the result to rax , the remainder to rdx
        add     rdx , 48
        push    rdx
        cmp     rax , 0         ;if the quotient is 0 ,the loop is stop and turn to print
        jnz     divideLoop
printLoop:
        dec     rcx
        mov     rax , rsp
        call    sprint          ;print
        pop     rax             ;parameter pop out stack
        cmp     rcx , 0
        jnz     printLoop

        pop     rsi
        pop     rdx
        pop     rcx
        pop     rax

        ret

iprintLF:
        call    iprint

        push    rax
        mov     rax , 0Ah
        push    rax
        mov     rax , rsp
        call    sprint
        pop     rax
        pop     rax
        ret
