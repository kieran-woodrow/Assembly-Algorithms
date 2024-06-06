segment .data
  

segment .bss
       
segment .text
        global countWords



countWords:

cmp rsi, 0 ;check if input value was zero from the beginning..note: rdi holds first parameter, rsi holds second parameter

jne _functionCountWords ;if not equal to zero, calculate it

mov rax, rsi ;if equal to zero, return the value 0
ret


_functionCountWords:

        mov r14, 0 ; string words counter variable
        mov rcx, 0 ; for loop counter variable 
       

for:
        mov al, [rdi+rcx] ; point it to falue of first character
        cmp rcx, rsi ; compare loop counter with number from parameter
        jge endfor ; if it's bigger than or equal to , exit loop and jump to endfor

if:     
        cmp al, 0x20 ; if the value stored in here is a space character
        jne endif ; if not equal to then go to end if
        inc r14;  if it is eual, increase word counter variable

endif:
        inc rcx ; increase loop counter variable
        jmp for ; jump back into loop 

endfor:
        inc r14 ; if at end of chat array, increase counter once more
        mov rax,r14 ; move value of r14 into rax
        ret ; return rax




    

