.model small
.stack 100h
.data
result_m db 10,13,"Result:",10,13,'$'
enter_m db 10,13,'$'
error_empty db 10,13,"String is empty. Exiting...$"
foundm db 10,13,"Found$"
failm db 10,13,"Fail$"
inputstring db 201 dup('$')
inputstring2 db 201 dup('$')
message db 10,13,"Enter string: ",10,13,'$'
message1 db 10,13, "Output: ",10,13,'$'
message2 db 10,13,"Enter word, that would be removed: ",10,13,'$'
.code
print_str MACRO str
    mov dx, offset str
    mov ah,9
    int 21h
ENDM
input_str MACRO str
    mov ah,0Ah
    mov dx,offset str
    int 21h
ENDM

checker_empty:
    mov si,2 
    mov bx, dx 
    a:
    mov dl,[bx+si]
    inc si
    cmp dl,' '
    je a
    cmp dl,13
    jne b
    mov dx, offset error_empty
    mov ah, 9
    int 21h
    jmp exit 
    b:
    ret 


start:
mov ax, DGROUP
mov ds,ax

print_str message
input_str inputstring
call checker_empty
print_str message1
print_str inputstring[2]
print_str message2
input_str inputstring2
call checker_empty
print_str message1
print_str inputstring2[2]

xor bx,bx

find_word:
mov cx,200
mov si,2
find_word_cycle:
mov dl, inputstring[si]
mov di,2
cmp dl,' '
jne check_word
inc si
loop find_word_cycle
check_word:
mov dl, inputstring2[di]
mov dh, inputstring[si]
cmp dl,13
je checker_space
cmp dl,' '
je checker_space
continue_cycle:
cmp dh,dl
je next_el
inc si
xor bx,bx
loop find_word_cycle
jmp fail_m

checker_space:
cmp dh,13
je found_m
cmp dh,' '
je found_m
cmp dl,' '
je next_di
jmp continue_cycle

next_di:
inc di
inc bx
jmp check_word

next_el:
    inc si
    inc di
    loop check_word

found_m:
mov cx, 200
sub cx, si
mov dx, si  ;di=si-di+bl+1
sub dx, di
add dx, bx
inc dx
mov di, dx
mov dl, inputstring[di]
cmp dl,' '
jne more_di
remove_word_cycle:
mov dl, inputstring[si]
mov inputstring[di], dl
inc si
inc di 
loop remove_word_cycle
print_str result_m
print_str inputstring[2]
jmp exit

more_di:
inc di
jmp remove_word_cycle

fail_m:
mov dx, offset failm
mov ah, 9
int 21h
jmp exit

exit:
mov ax,4c00h
int 21h
end start
