## 1.argument pass
64 bit mode use rax,rdi,rsi,rdx 
32 bit mode use eax,ebx,ecx,edx

## 2.system call
use syscall instead of int 80h
and the system call table is quite different from the 32 bit 

## 3.register preserve
you need to preserve some register when call a function or subrouting when using some common register

## 4.div 
should firstly clear the rdx register by xor rdx ,rdx
