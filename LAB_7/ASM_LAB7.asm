.model tiny
.code
org 100h

print_str MACRO str
    mov ah, 09h
    mov dx, offset str
    int 21h    
ENDM

enter_word MACRO str
    mov cx,255
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

    mov size_path, si
    dec si
    mov str[si],'\'
    mov str[si+1],'*'
    mov str[si+2],'.'
    mov str[si+3],'e'
    mov str[si+4],'x'
    mov str[si+5],'e'
    mov str[si+6], 0
ENDM

start:
mov sp, program_length+100h+200h

mov ah, 4Ah
stack_shift = program_length +100h+200h
mov bx, stack_shift shr 4+1
int 21h

mov ax,cs
mov word ptr EPB+4, ax
mov word ptr EPB+8, ax
mov word ptr EPB+0Ch, ax

print_str message_input
enter_word program_path

    mov dx,offset DTA
    mov ah,1Ah
    int 21h

    mov dx,offset program_path
    mov cx, 0
    mov ah,4Eh
    int 21h
    jc error_print1

run_files:

    print_str message_enter
    print_str message_run

    mov si, 1Eh
    mov di, size_path
    set_name_file:
    mov dl, DTA[si]
    mov program_path[di], dl
    cmp dl, 0
    je end_name_file
    mov ah, 02h
    int 21h
    inc si
    inc di
    jmp set_name_file

    error_print1:
    jmp error_print

    end_name_file:
    print_str message_enter
    print_str message_enter

    mov ax, 4b00h
    mov dx, offset program_path
    mov bx, offset EPB
    int 21h
    jc exe_error_print

    continue:
    mov dx,offset DTA
    mov ah,1Ah
    int 21h

    mov ah, 4fh
    int 21h
    jnc run_files
jmp error_print

exe_error_print:
mov dx, ax
cmp dx, 02h
jne check_con 
print_str message_file_not_found
jmp exit
check_con:
cmp dx, 05h 
jne check_memory
print_str message_permission_denied
jmp exit
check_memory:
cmp dx, 08h
jne continue
print_str message_nope_memory
jmp exit


error_print:
mov dx, ax
cmp dx, 02h
jne con_check
print_str message_file_not_found
jmp exit
con_check:
cmp dx, 03h
jne exit
print_str message_path_not_found
jmp exit

exit:
print_str message_enter
print_str message_enter
print_str message_end
int 20h 

message_input db "Enter path to programs:", 0DH, 0AH, '$'
message_run db "    RUNNING $"
message_enter db 0DH,0AH,'$'
message_file_not_found db "File not found",0DH,0AH,'$'
message_path_not_found db "Path not found",0DH,0AH,'$'
message_unknow_error db "Unknow error",0DH,0AH,'$'
message_permission_denied db "Permission denied",0DH,0AH,'$'
message_nope_memory db "Nope memory", 0DH,0AH,'$'
message_end db "    END", 0DH,0AH,'$'
size_path dw 0
EPB dw 0000
    dw offset commandline, 0
    dw 005Ch, 0, 006Ch, 0
commandline db 125
            db " /?"
command_text db 122 dup(?)

DTA db 128h dup(0)
program_path db ?
program_length equ $-start
end start 