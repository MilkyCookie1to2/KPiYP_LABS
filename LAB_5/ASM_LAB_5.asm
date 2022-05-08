.model tiny
.code
org 80h
cmd_length db ?
cmd_line db ?
org 100h
.386
print_str MACRO str
    mov dx, offset str
    mov ah, 09h
    int 21h
ENDM

enter_word MACRO str
    mov str[50], 0DH
    mov cx,50
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
    mov dl, 20h
    int 21h
    mov dl, 08h
    int 21h
    jmp enter_loop_word
    
    continue_enter:
    mov str[si],al
    inc si
    cmp al, 13
    loopne enter_loop_word  

    ;mov ax, size_word       ;write length word
    ;sub ax,cx
    ;dec ax
    ;mov size_word,ax
ENDM

from_int_to_str MACRO
    mov bx, 10000
    mov ax, dx
    xor di,di

    ;check negative
    and ax, 32768
    cmp ax, 0
    je posit
    mov ax, dx
    neg ax
    mov buf[di], '-'
    inc di
    jmp out_loop

    posit:
    mov ax, dx

    out_loop:
    xor dx,dx
    idiv bx

    add al, 30h
    mov buf[di],al
    inc di

    push dx

    mov ax, bx
    xor dx,dx
    mov bx, 10
    idiv bx
    mov bx,ax

    pop ax

    cmp bx, 0
    jne out_loop
    mov buf[di],'$'
ENDM

print_number_proc MACRO
    xor di,di
    search_number:
    mov dl, buf[di]
    inc di
    cmp dl, '0'
    je search_number
    cmp dl, '-'
    je print_minus
    cmp dl, '$'
    jne print_number
    print_zero:
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp exit_ret

    print_minus:
    mov dl, '-'
    mov ah, 02h
    int 21h
    jmp search_number

    print_number:
    dec di
    print_number_loop:
    mov dl, buf[di]
    inc di
    cmp dl, '$'
    je exit_ret
    mov ah, 02h
    int 21h
    jmp print_number_loop

    exit_ret:
ENDM


start:
print_str entry_word_message
enter_word input_word
print_str input_word_message
print_str input_word
print_str enter_message

cld
mov cl, cmd_length
cmp cl, 1
jle exit

mov cx, -1
mov di, offset cmd_line
find_param:
mov al,' '
repz scasb
dec di

mov si,di
scan_params:
lodsb
cmp al,0DH
je end_params
cmp al,20h
jne scan_params
dec si
mov byte ptr [si], 0
;mov di,si
;inc di
jmp OPEN_FILE


end_params:
dec si
mov byte ptr [si], 0

OPEN_FILE:
mov dx, di
mov ah, 3Dh
mov al, 00h
int 21h
jc error_open_file
mov bx, ax

mov dx, ' '
FIND_FIRST_GO:
xor dh,dh
mov si, dx
mov cx, 1
mov dx, offset buff
mov ah, 3Fh
int 21h
jc PRINT_COUNTER
mov cx, ax
cmp cx, 0
je PRINT_COUNTER

xor dx,dx
mov dl, byte ptr buff
cmp dl, input_word[0]
jne FIND_FIRST_GO

COMPARE_WORD:
cmp si, ' '
je begin_compare
cmp si, 0AH
jne FIND_FIRST_GO

begin_compare:
mov dx, si
mov di, 0
compare_word_loop:
inc di
xor dh,dh
mov si, dx
mov cx, 1
mov dx, offset buff
mov ah, 3Fh
int 21h
jc check_compare_with_end 
mov cx, ax
cmp cx, 0
je check_compare_with_end

xor dx,dx
mov dl, byte ptr buff
mov dh, input_word[di]
cmp dh, 0DH
je check_compare
cmp dh,dl
jne FIND_FIRST_GO
jmp compare_word_loop 

check_compare_with_end:
mov dh, input_word[di]
cmp dh, 0DH
jne PRINT_COUNTER
inc counter
jmp PRINT_COUNTER

check_compare:
cmp dl, ' '
je inc_counter
cmp dl, 0DH
je inc_counter
jmp FIND_FIRST_GO

inc_counter:
inc counter
cmp dl, 0DH
je FIND_FIRST_GO

mov dx,si

FIND_END_LINE:
xor dh,dh
mov si,dx
mov cx, 1
mov dx, offset buff
mov ah, 3Fh
int 21h
jc PRINT_COUNTER
mov cx, ax
cmp cx, 0
je PRINT_COUNTER

xor dx,dx
mov dl, byte ptr buff
cmp dl, 0AH
jne FIND_END_LINE
jmp FIND_FIRST_GO

PRINT_COUNTER:
print_str counter_message
mov dx, counter
from_int_to_str
print_number_proc
jmp exit

error_open_file:
print_str error_open_file_message

exit:
mov ah ,3Eh
int 21h
ret

entry_word_message db "Enter word:",10,13,'$'
input_word db 52 dup('$')
input_word_message db "Input word:", 10,13,'$'
buff db ' '
error_open_file_message db "ERROR_FILE_OPEN", 10, 13, '$'
counter dw 0
counter_message db "Count lines: ", 10,13,'$'
buf db ?
enter_message db 13,10,'$'
end start