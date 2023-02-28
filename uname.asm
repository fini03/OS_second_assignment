; nyasm
%macro cout 3
            mov         r13, %1
            mov         r14, %2
            call        print
            mov         r13, utsname + %3
            mov         rdi, utsname + %3
            call        strlen
            mov         r14, rax
            call        print
            mov         r13, BREAK_LINE
            mov         r14, 1
            call        print
%endmacro

            section     .data
SYS_EXIT:   equ         60
SYS_UNAME:  equ         63
SYS_WRITE:  equ         1
STD_IN:     equ         1
BREAK_LINE: db          10
os:         db          "OS: "
hostName:   db          "Hostname: "
relInf:     db          "Release: "
verInf:     db          "Version: "
  
struc UTSNAME
    sysname:    resb 65
    nodename:   resb 65
    release:    resb 65
    version:    resb 65
endstruc

utsname:    istruc      UTSNAME
    at sysname, db ""
    at nodename, db ""
    at release, db ""
    at version, db ""
iend

            global      _start
            section     .text
            
_start:
            call        uname
            cout        os, 4, sysname
            cout        hostName, 10, nodename
            cout        relInf, 9, release
            cout        verInf, 9, version
            jmp         exit 

uname:
            mov         rax, SYS_UNAME
            mov         rdi, utsname
            syscall
            ret

print:
            mov         rax, SYS_WRITE
            mov         rdi, STD_IN
            mov         rsi, r13
            mov         rdx, r14
            syscall
            ret

strlen:
			push 		rbp
			mov 		rbp, rsp
			xor 		rax, rax 

_label_name:
			mov 		sil, byte 0 [rdi + rax] 
			inc 		rax
			test 		sil, sil 
			jnz 		_label_name
			dec 		rax 
			leave
			ret

exit:
            mov         rax, SYS_EXIT
            mov         rdi, 0
            syscall
