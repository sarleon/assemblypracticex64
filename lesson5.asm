        %include 'functions.asm'

        SECTION .data
        msg1    db      'moriturus te saluto' , 0ah
        msg2    db      'heil centurio!' , 0ah

		SECTION .text
		global 	main
main:
        mov     rax , msg1
        call    sprint

        mov     rax , msg2
        call    sprint

        call    quit
