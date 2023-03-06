;#registers#;
;	E[A-D]X -- ESI/EDI -- general purpose registers;
;	first 4 registers (E[A-D]X) broken into most sig 2 bytes [A-D]X then broken further to;;
;		least sig 2 bytes, each addressable as a byte each [A-D]H (most sig)/[A-D]L (least sig);
;	ESP -- stack pointer;
;	EBP -- base pointer;

;#instructions#;
;	mov -- moves memory to register and vice versa (first is dest, second is src)

;#sizes/types#;
;	1 byte (8 bit): byte, DB, RESB
; 	2 bytes (16 bit): word, DW, RESW
; 	4 bytes (32 bit): dword, DD, RESD
; 	8 bytes (64 bit): qword, DQ, RESQ
; 	10 bytes (80 bit): tword, DT, REST
; 	16 bytes (128 bit): oword, DO, RESO, DDQ, RESDQ
; 	32 bytes (256 bit): yword, DY, RESY
; 	64 bytes (512 bit): zword, DZ, RESZ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



global _start		;export entrypoint to global namespace

; section .data		;define variables
; 		message: db 'hello world',0	;
; 		msgLength: equ $-message

; section .text		;define code
; 		_start:
; 		mov edx, msgLength	;arg 2 length in bytes
; 		mov ecx, message	;arg 1 pointer to character array
; 		mov ebx, 1			;arg 0 file descriptor (1 => stdout)
; 		mov eax, 4			;syscall to write
; 		int 0x80			;interrupt

; 		mov ebx, 0			;arg 0 exit status
; 		mov eax, 1			;syscall to exit
; 		int 0x80			;interrupt

section .text 
		_start:

		sub esp, 5*4			;allocate 20 bytes on stack (num of DWORDS * num bytes)
		mov WORD [esp + 5*4], 0x2069
		;mov DWORD [esp + 8], esp
		mov DWORD ecx, esp		;store stack pointer in ecx
		add ecx, 5*4			;increment pointer by 20 bytes to get 2nd arg for write (0x2069)
		mov edx, 2				;num of bytes to write
		mov ebx, 1				;file descriptor
		mov eax, 4				;function to call (write)
		int 0x80				;interrupt syscall

		sub ecx, 4
		mov WORD ecx, 0x6f6c	;store 0x6f6c at location referenced by ecx
		mov edx, 2
		mov ebx, 1
		mov eax, 4
		int 0x80


		
		; mov WORD [esp + 8], 0x6f6c
		; mov DWORD ecx, esp
		; add ecx, 8
		; ;add ecx, 12
		; mov edx, 2			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80

		; mov esp 

		; mov ecx, esp
		; mov edx, 2			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80			;interrupt syscall

		; mov ecx, esp + 4
		; mov edx, 2			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80			;interrupt syscall

		; mov ecx, esp + 8
		; mov edx, 2			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80			;interrupt syscall

		; mov ecx, esp + 12
		; mov edx, 2			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80			;interrupt syscall

		; mov ecx, 0x00
		; mov edx, 1			;num of bytes to write
		; mov ebx, 1			;file descriptor
		; mov eax, 4			;function to call (write)
		; int 0x80			;interrupt syscall
	
		mov ebx, 0
		mov eax, 1
		int 0x80