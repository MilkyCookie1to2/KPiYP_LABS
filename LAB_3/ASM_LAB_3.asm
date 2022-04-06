.model small
.stack 100h
.data
size_mas EQU 30
mas dw size_mas dup(?)
buf db ?
ten dw 10
enter_m db 10,13,'$'
error_empty_message db "Empty. Try enter again",10,13,'$'
error_overflow_message db "Overflow. Try enter again", 10,13,'$'
.code

print_str MACRO str
    mov ah,9h
    mov dx, offset str
    int 21h
ENDM

check MACRO
    
ENDM

start:
mov ax, DGROUP
mov ds, ax

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


mov cx, 30
xor si,si 
to_str_loop_0:
mov bx, 10000
mov ax, mas[si]
xor di,di

;check negative
and ax, 32768
cmp ax, 0
je posit
mov ax, mas[si]
neg ax
mov buf[di], '-'
inc di
jmp out_loop

to_str_loop_1:
jmp to_str_loop_0

posit:
mov ax, mas[si]

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
pop ax

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
jmp con_str

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
je con_str
mov ah, 02h
int 21h
jmp print_number_loop

con_str:
mov dl, ' '
mov ah,2h 
int 21h
add si, 2
loop to_str_loop_1

exit:
mov ax, 4c00h
int 21h
end start
