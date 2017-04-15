        SECTION .data
        msg     db      'please enter the index of the array you want to print, split by space,maxium length of input string is 256',0h
        color_red       db  1Bh, '[31;1m', 0
        color_green       db  1Bh, '[32;1m', 0
        color_yellow     db  1Bh, '[33;1m', 0
        color_blue       db  1Bh, '[34;1m', 0
        color_purple       db  1Bh, '[35;1m', 0
        color_darkgreen       db  1Bh, '[36;1m', 0
        color_white       db  1Bh, '[37;1m', 0

        inputerrormsg     db      'invalid input!please input a number list!',0h
        SECTION .bss
        inputstr   resb    10



        SECTION .text
        global  main
main:
        mov     rax , msg
        mov     r14 , rax

        call    input

        cmp     rax , 0
        je      printResult


        cmp     rax , 1
        call    printOne
        je      printResult


        cmp     rax , 2
        call    printOne
        je      printResult

        mov     r14 , rax       ;the maxium index of the array
        mov     r15 , 2         ;the current index of the array
        mov     r12 , rsp
        mov     rsi , 1
        mov     rdi , 1
        push    rsi
        push    rdi
fib:
        mov     rsi , [rsp+8]
        mov     rdi , [rsp]
        add     rsi , rdi
        mov     rax , r15
        call    colorPrint
        mov     rax , rsi
        call    iprintLF
        push    rsi
        cmp     r14 , r15
        je      printResult
        inc     r15
        jmp     fib
printResult:
        call    quit

printOne:
        push    rax
        mov     rax , 0x31
        push    rax
        mov     rax , rsp
        call    sprintLF
        pop     rax
        pop     rax
        ret
colorPrint:
        push    rbx
        push    rdx
        mov     rbx , 7
        xor     rdx , rdx
        div     rbx
        cmp     rdx , 0
        je      printRed
        cmp     rdx , 1
        je      printBlue
        cmp     rdx , 2
        je      printPurple
        cmp     rdx , 3
        je      printGreen
        cmp     rdx , 4
        je      printYellow
        cmp     rdx , 5
        je      printDarkGreen
        cmp     rdx , 6
        je      printWhite

printRed:
        mov     rax ,color_red
        call    sprint
        jmp    colorFinish
printBlue:
        mov     rax ,color_blue
        call    sprint
        jmp    colorFinish
printPurple:
        mov     rax , color_purple
        call    sprint
        jmp    colorFinish
printGreen:
        mov     rax , color_green
        call    sprint
        jmp    colorFinish
printYellow:
        mov     rax , color_yellow
        call    sprint
        jmp    colorFinish
printDarkGreen:
        mov     rax , color_darkgreen
        call    sprint
        jmp    colorFinish
printWhite:
        mov     rax , color_white
        call    sprint
        jmp    colorFinish
colorFinish:
        pop     rdx
        pop     rbx
        ret
;;; parse input functions
input:

        push    rsi
        push    rdi
        push    rdx
        push    rcx
        push    rbx
        mov     rax , 0
        mov     rsi , inputstr
        mov     rdi , 0
        mov     rdx , 511
        syscall

        ;; parse input string
        xor     rcx , rcx       ;clear the rcx
        mov     rax , inputstr
        call    slen            ;now length in rax
        dec     rax
        mov     rdi , inputstr
        add     rdi , rax       ;rdi store the keeped length of the

        mov     rcx , rax       ;the length is in rcx
        xor     rdx , rdx       ;result:store the number of input in rdx

addToNum:
        mov     rbx , rcx
        mov     rsi , 1

getOrder:
        mov     rax , 10
        push    rdx
        mul     rsi             ;the result store to rax
        pop     rdx
        mov     rsi , rax

        mov     rax , rsi
        cmp     rbx , 1

        je      addFinish
        dec     rbx
        jmp     getOrder

addFinish:                      ;the order now store in rax
        mov     rsi , rdi
        sub     rsi , rcx
        movzx   rsi , byte[rsi]
        sub     rsi , 48
        push    rdx
        mul     rsi
        pop     rdx
        add     rdx , rax
        cmp     rcx , 1
        je      calFinish
        dec     rcx
        jmp     addToNum
calFinish:
        mov     rax , rdx
        xor     rdx , rdx
        mov     rsi , 10
        div     rsi

        pop     rbx
        pop     rcx
        pop     rdx
        pop     rdi
        pop     rsi
        ret

inputError:
        mov     rax , inputerrormsg
        call    sprintLF
        call    quit






;;; input and output functions
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
