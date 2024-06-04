segment .bss ;must include a space after "segment and the .".. gave errors when no space

theTempLetter resb 3 ;used to store the temp letter

segment .data


segment .text
        global swapLetters ;tell assenmbly where to start code from

swapLetters ;start here

call swapFunction    ;if not, swap
ret 

swapFunction:

    push rbp
    mov rbp, rsp ;allign the stack

    mov r12, rdi ;rdi holds first parmeter from c function. This case it's the array pointer
    mov r13, rsi ;rsi holds second parameter from c function. This case it's the first index
    mov r14, rdx ;rdx holds third parameter from c function. This case it's the second index

    ; r12, r13, r14 are safe call registers
    lea rsi, [rdi + r14] ;move temp var into rsi(the source)
    lea rdi, [theTempLetter] ;move to destination which is rdi. theTempLetter now holds Z 
    movsb ;move them

    ;don't try to use a register as a temp..gave seg faults

    lea rsi, [r12 + r13] ;move into rsi
    lea rdi, [r12 + r14] ; move into rdi
    movsb ; swap them


    lea rsi, [theTempLetter] ; load temp var into rsi
    lea rdi, [r12 + r13] ;replace the other letter
    movsb ;swap

    lea rax, [r12]
    leave ;do this when leaving a function..dunno why


ret
