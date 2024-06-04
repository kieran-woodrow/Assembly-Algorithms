segment .bss 

        numberOfWords resb 1
        lengthOfWords resb 1
        tempIndexA resb 1
        tempIndexB resb 1
        storedWord resb 10
        tempLetter1 resb 1
        tempLetter2 resb 1
        x resb 1

segment .data


segment .text
        global sort

sort:
    push rbp
    mov rbp, rsp

    jmp sortFunction
    ret

sortFunction:

    
    mov r13, rdi                        ;stores array pointer
    mov r12, rsi                        ; stores the number of words
   ; mov [numberOfWords], r12
   ; mov [lengthOfWords], rdx
    mov r15, rdx                        ;stores the word length

    mov r10, 0 ; outer forloop counter
    mov r11, 0 ; inner forloop counter



    outerForLoopStart:
        cmp r10, r12                     ;if bigger, finished
        je outerForLoopEnd
       
        innerForLoopStart:
            mov r9, r12
            sub r9, r10
            dec r9
            mov [x], r9

            cmp r11, [x]
            jge innerForLoopEnd

            mov r14, r15
            inc r14
            imul r14, r11
            mov [tempIndexA], r14
       
            mov rax, 0
            mov rax, r11
            inc rax

            mov r9, 0
            mov r9, r15
            inc r9
            imul r9, rax
            mov [tempIndexB], r9


            lea rsi, [r13 + r14]
            lea rdi, [tempLetter1]
            movsb

            lea rsi, [r13 + r9]
            lea rdi, [tempLetter2]
            movsb

            mov rax, 0
            mov rbx, 0

            mov al, [r13 + r14]
            mov bl, [r13 + r9]

            cmp al, bl
            jg swapWordsFunction
            inc r11
            jmp innerForLoopStart
        
        innerForLoopEnd:
            inc r10
            mov r11, 0
            jmp outerForLoopStart

    outerForLoopEnd:
    lea rax, [r13]
    leave
    ret


swapWordsFunction:

    lea rsi, [r13 + r14]                 ;start at the new r11 value to get the word
    lea rdi, [storedWord]               ;store it in temp var
    mov rcx, 0
    mov rcx, r15                     ;add counter
    rep movsb                           ;call rep mov sd 

    lea rsi, [r13 + r9]
    lea rdi, [r13 + r14]
    mov rcx, r15
    rep movsb

    lea rsi, [storedWord]
    lea rdi, [r13 + r9]
    mov rcx, r15
    rep movsb

    lea rax, [r13]
    inc r11
    jmp innerForLoopStart
        

 

 







