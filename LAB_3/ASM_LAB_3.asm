.model small
.stack 100h
.data
size_mas EQU 30
mas dw size_mas dup(?)
index_mas dw 31 dup(31)
buf db ?
ten dw 10
enter_m db 13,10,'$'
error_empty_message db "Empty. Try enter again",10,13,'$'
error_overflow_message db "Overflow. Try enter again", 10,13,'$'
message_entry db "Entry massive of 30 numbers:",10,13,'$'
message_print_mas db 10,13,"Massive:",10,13,'$'
message_print_max_count_number db 10,13,"The most meeting numbers:",10,13,'$'
.code

print_str MACRO str
    mov ah,9h
    mov dx, offset str
    int 21h
ENDM

exit_prog MACRO
    mov ax, 4c00h
    int 21h
ENDM

entry_mas MACRO
    xor di,di
    mov cx, size_mas
    enter_loop_0:

    xor si,si
    enter_loop:
    mov ah, 01h
    int 21h

    cmp al, 13
    je check_empty

    cmp al, '-'
    jne con_check

    cmp si, 0
    je con_enter
    jmp int_back_symbol

    con_check:
    cmp al, 8h
    je begin_back

    cmp al, '0'
    jl int_back_symbol

    cmp al, '9'
    jle con_enter

    int_back_symbol:
    mov ah, 02h
    mov dl, 8h
    int 21h
    jmp int_backspace

    begin_back:
    cmp si,0
    je int_backspace
    dec si
    int_backspace:
    mov ah,02h
    mov dl, 20h
    int 21h
    mov dl, 8h
    int 21h
    jmp enter_loop

    check_empty:
    cmp si,0
    je error_empty
    mov dl, buf[0]
    cmp dl, '-'
    jne con_enter
    cmp si,1
    jne con_enter

    error_empty:
    print_str error_empty_message
    xor si,si
    jmp enter_loop

    enter_loop_1:
    jmp enter_loop_0

    con_enter:
    mov buf[si], al
    inc si
    cmp al, 13
    jne enter_loop

    sub si, 2
    ;call to_num
        mov mas[di], 0
        mov dx,1
        mov bx,10
        to_num_loop:
            xor ax, ax
            mov al, buf[si]
            cmp al, '-'
            je skip_neg_sigh
            sub al, 30h
            push dx
            mul dx
            pop dx
            push ax
            mov ax, dx
            mul bx
            mov dx,ax
            pop ax
            add mas[di], ax 
            jnc skip_neg_sigh       ;check OF
            overflow_error:
            print_str error_overflow_message
            xor si,si
            jmp enter_loop

            skip_neg_sigh:
            push bx                 ;check 16s bit
            mov bx,mas[di]
            and bx, 32768
            cmp bx,0
            jne overflow_error
            pop bx
            dec si
            cmp si, 65535
        jne to_num_loop
    mov dl, buf[0]
    cmp dl, '-'
    jne next_number
    neg mas[di]
    next_number:
    xor ax,ax

    add di, 2
    loop enter_loop_1
ENDM

print_mas MACRO
    mov cx, 30
    xor si,si 
    to_str_loop_0:
    mov dx, mas[si]


    call from_int_to_str
    ;print number
    call print_number_proc

    con_str:
    mov dl, ' '
    mov ah,2h 
    int 21h
    add si, 2
    loop to_str_loop_0
ENDM

from_int_to_str PROC
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
    ;pop ax
    ret
from_int_to_str ENDP

print_number_proc PROC
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
    ret
print_number_proc ENDP

start:
mov ax, DGROUP
mov ds, ax

print_str message_entry

entry_mas

print_str message_print_mas

print_mas


xor si,si
xor di,di
xor bx,bx
xor cx,cx
walk_mas:
mov dx, mas[si]

check_mas:
mov ax, mas[di]
add di, 2
cmp ax, dx
jne check_di
inc cl

check_di:
cmp di,60
jne check_mas
cmp cl, ch
jge check_counter
xor cl,cl
xor di,di
add si,2
cmp si,60
jne walk_mas
jmp print_max_count  ;exit loop


add_in_index:
mov ch, cl

;check that this number already in index mas
;dx = adding number
push di
push bx
xor di,di
searh_twink:
mov di, index_mas[di]
cmp di, 31
je sure_add
mov bx, mas[di]
cmp dx,bx
je not_add
add di,2
jmp searh_twink

sure_add:
pop bx
pop di
mov index_mas[bx], si
add bx, 2
mov index_mas[bx], 31
jmp skip_pop
not_add:
pop bx
pop di
skip_pop:
xor cl,cl
xor di,di
add si,2
cmp si,60
jne walk_mas
jmp print_max_count   ;exit loop

check_counter:
cmp cl,ch
je add_in_index
xor bx,bx
jmp add_in_index

print_max_count:
print_str message_print_max_count_number

xor si,si
print_number_count_max:
mov di, index_mas[si]
cmp di,31
je exit_flag
add si,2

mov dx, mas[di]
call from_int_to_str
call print_number_proc

mov dl, ' '
mov ah,2h 
int 21h
jmp print_number_count_max

exit_flag:
exit_prog
end start
