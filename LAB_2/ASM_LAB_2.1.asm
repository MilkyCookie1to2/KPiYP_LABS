.model small
.stack 100h
.data
message_enter_string db 10,13,"Enter string: ",10,13,'$'
message_enter_word db 10,13,"Enter word: ",10,13,'$'
message_result db 10,13,"Result: ",10,13,'$'
error_empty db "String is empty. Exiting...$"
inputstring db 201 dup('$')
inputword db 201 dup('$')
size_word dw 200
enter_m db 10,13,'$'
message1 db 10,13,"Equal",10,13,'$'
message2 db 10,13,"NotEqual",10,13,'$'

.code
print_str MACRO str
    mov ah,9
    mov dx, offset str
    int 21h
ENDM

enter_string MACRO str
    mov cx,200
    xor si,si
    enter_loop:
    mov ah,1
    int 21h
    cmp al,8            ;check backspace

    jne check_dollar_s
    back_s:
    cmp si,0
    je enter_loop 
    mov ah, 02h
    mov dl, 20h
    int 21h 
    mov dl, 08h
    int 21h
    inc cx
    dec si
    mov str[si],'$'
    jmp enter_loop  

    check_dollar_s:
    cmp al,'$'             ;check dollar
    jne continue
    mov ah, 02h
    mov dl, 08h
    int 21h
    jmp back_s

    continue:
    mov str[si],al
    inc si
    cmp al, 13
    loopne enter_loop  
ENDM

enter_word MACRO str
    mov cx,200
    xor si,si
    enter_loop_word:
    mov ah,1
    int 21h
    cmp al,08h            ;check backspace
    jne check_space
    back:
    cmp si,0
    je enter_loop_word
    mov ah, 02h
    mov dl, 20h
    int 21h 
    mov dl, 08h
    int 21h
    inc cx
    dec si
    mov str[si],'$'
    jmp enter_loop_word 

    check_space:
    cmp al,' '           ;check space
    jne check_dollar

    mov ah, 02h
    mov dl, 08h
    int 21h
    jmp enter_loop_word

    check_dollar:
    cmp al,'$'             ;check dollar
    jne continue_enter
    mov ah, 02h
    mov dl, 08h
    int 21h
    jmp back
    
    continue_enter:
    mov str[si],al
    inc si
    cmp al, 13
    loopne enter_loop_word  

    mov ax, size_word       ;write length word
    sub ax,cx
    dec ax
    mov size_word,ax
ENDM

check_empty PROC
    xor si, si
    a:
    mov dl, [bx+si]
    inc si
    cmp dl, ' '
    je a
    cmp dl, 13
    jne b
    print_str error_empty
    mov ax, 4c00h
    int 21h
    b:
    ret
check_empty ENDP

exit_prog MACRO
    mov ax, 4c00h
    int 21h
ENDM

start:
mov ax,DGROUP
mov ds,ax
mov es,ax

print_str message_enter_string
enter_string inputstring
mov bx,offset inputstring
call check_empty
print_str message_enter_word
enter_word inputword
mov bx,offset inputstring
call check_empty

xor si,si
found_word:
mov dl,inputstring[si]
inc si
cmp dl,' '
je found_word
cmp dl,13
je exit_with_result
cmp dl, '$'
je exit_with_result

;check word
dec si
mov bx,si
mov di,si
CLD
mov cx, size_word
lea si, inputstring[di]
lea di, inputword
repe cmpsb
jne NotEqual
;check word in string
mov si,bx
add si, size_word
mov dl, inputstring[si]
cmp dl, ' '
je Equal
cmp dl, 13
je Equal
cmp dl, '$'
je Equal
jmp NotEqual

Equal:
;remove word
print_str message1
mov si, bx
mov di, bx
add di, size_word
cmp si, 0
jne dec_si
move_symbol:
mov dl, inputstring[di]
mov inputstring[si], dl
cmp dl, '$'
je to_found_word
inc si
inc di
jmp move_symbol
to_found_word:
mov si,bx
jmp found_word

dec_si:
dec si
dec bx
jmp move_symbol

NotEqual:                   ;move to end word
mov si, bx
to_end_word:
inc si
mov dl, inputstring[si]
cmp dl, 13
je exit_with_result
cmp dl, '$'
je exit_with_result
cmp dl, ' '
jne to_end_word
jmp found_word

exit_with_result:
print_str message_result
mov bx, offset inputstring
call check_empty
print_str inputstring

exit:
exit_prog
end start