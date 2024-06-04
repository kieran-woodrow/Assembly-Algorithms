segment .bss 

    storedWord resb  10
    storeNewRCX resb 2
    indexA resb 1
    indexB resb 1


segment .data


segment .text
        global swapWords

swapWords:

    call swapWordsFunction
    ret

swapWordsFunction:

    push rbp
    mov rbp, rsp 

    mov r9, rdi
    mov r10, rsi
    mov r11, rdx
    mov r12, rcx

    mov [indexA], r10 ; this stores the number of index A 
    mov [indexB], r11 ; this stores number of index B

    inc rcx                             ; must inc rcx according to formula given

    mov [storeNewRCX], rcx              ;store this new value

    imul r10, [storeNewRCX]             ;multiply this value by first index

    imul r11, [storeNewRCX]             ;multiply this value by second index

    lea rsi, [r9 + r11]                 ;start at the new r11 value to get the word
    lea rdi, [storedWord]               ;store it in temp var
    mov rcx, r12                        ;add counter
    rep movsb                           ;call rep mov sd 

    mov r13, [storedWord]

    lea rsi, [r9 + r10]
    lea rdi, [r9 + r11]
    mov rcx, r12
    rep movsb

    lea rsi, [storedWord]
    lea rdi, [r9 + r10]
    mov rcx, r12
    rep movsb

    lea rax, [r9]
    leave
    ret

 

 







