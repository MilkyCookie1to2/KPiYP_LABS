.model small
.stack 100h
.data
start_message db 'S',6Fh,'T',6Fh,'A',6Fh,'R',6Fh,'T',6Fh
start_message_size equ 10
exit_message db 'E',6Fh,'X',6Fh,'I',6Fh,'T',6Fh
exit_message_size equ 8
strelka db '>', 6Fh
time_message db 'T', 0Fh, 'I', 0Fh, 'M', 0Fh, 'E', 0Fh
time_message_size equ 8
evil_message db 'L', 0Fh,'o', 0Fh,'g', 0Fh,'i', 0Fh,'n', 0Fh
evil_message_size equ 10
castle_hp_message db 'C', 0Fh,'A', 0Fh,'S', 0Fh,'T', 0Fh,'L', 0Fh,'E', 0Fh,' ', 0Fh,'H', 0Fh,'P', 0Fh,' ', 0Fh, 181, 0Fh, 219, 7Ah, 219, 7Ah,219, 7Ah,219, 7Ah,219, 7Ah, 198,0Fh
castle_hp_message_size equ 34
retry_message db 'R', 6Fh,'E', 6Fh,'T', 6Fh,'R', 6Fh,'Y', 6Fh
retry_message_size equ 10
victory_message db 01h, 6Fh, ' ', 6Fh,'V', 6Fh,'I', 6Fh,'C', 6Fh,'T', 6Fh,'O', 6Fh,'R', 6Fh,'Y', 6Fh
victory_message_size equ 18
fail_message db ':', 6Fh,'(', 6Fh,' ', 6Fh,'F', 6Fh,'A', 6Fh,'I', 6Fh,'L', 6Fh
fail_message_size equ 14
map db ' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,220,6Ch,219,6Ch,220,6Ch,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh   ;46
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',0Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh,' ',0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 0Fh, ' ', 6Fh, ' ', 6Fh
    db ' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh,' ',6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh, ' ', 6Fh
old_int_9 dw ?,?
old_int_1C dw ?,?
time dw 0
tank_position dw ?
tank_hp dw 1
bomb_tank_active db 0
bomb_tank_position dw 1946
bomb_tank_direction db 1Eh

evil_tank_position dw ?
bomb_evil_tank_active db 0
bomb_evil_tank_position dw ?
bomb_evil_tank_direction db 1Eh

castle_hp dw 5
.code
.386
jmp start

FILL_DISPLAY PROC
    xor si,si
    mov cx, 2000
    fil_display:
    mov es:[si], ' '
    inc si
    mov es:[si], 6Fh
    inc si
    loop fil_display
    ret
FILL_DISPLAY ENDP

CLEAR_DISPLAY MACRO
    mov ah,00                       ;clear dispaly and set size 80x25
    mov al,03
    int 10h   
    mov ah,1                        ;set cursor transparent
    mov cx, 2000h        
    int 10h  
ENDM

KEYBOARD_INTERRUPT PROC FAR
    sti
    mov si, tank_position
    in al, 60h
    cmp al, 48h
    je up
    cmp al, 4Bh
    je left
    cmp al, 50h
    je down
    cmp al, 4Dh
    je right
    cmp al, 39h 
    je space
    jmp i_exit

    up:
    mov dl, es:[si-159]
    cmp dl,6fh
    je i_exit
    cmp dl, 6Ch
    je i_exit
    cmp dl, 05h
    je i_exit
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    mov es:[si-160],1Eh
    mov es:[si-159],0Fh
    sub si, 160
    mov tank_position, si
    jmp i_exit

    left:
    mov dl, es:[si-1]
    cmp dl,6fh
    je i_exit
    cmp dl, 6Ch
    je i_exit
    cmp dl, 05h
    je i_exit
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    mov es:[si-2],11h
    mov es:[si-1],0Fh
    sub si, 2
    mov tank_position, si
    jmp i_exit

    down:
    mov dl, es:[si+161]
    cmp dl,6fh
    je i_exit
    cmp dl, 6Ch
    je i_exit
    cmp dl, 05h
    je i_exit
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    mov es:[si+160],1Fh
    mov es:[si+161],0Fh
    add si, 160
    mov tank_position, si
    jmp i_exit

    right:
    mov dl, es:[si+3]
    cmp dl,6fh
    je i_exit
    cmp dl, 6Ch
    je i_exit
    cmp dl, 05h
    je i_exit
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    mov es:[si+2],10h
    mov es:[si+3],0Fh
    add si, 2
    mov tank_position, si
    jmp i_exit

    space:
    mov dl, bomb_tank_active
    cmp dl, 1
    je i_exit
    mov dl, es:[si]
    cmp dl, 1Eh
    je up_dir
    cmp dl, 11h
    je left_dir
    cmp dl, 1Fh
    je down_dir
    cmp dl, 10h
    je rigth_dir
    jmp i_exit

    up_dir:
    mov bomb_tank_direction, 1Eh
    mov dl, es:[si-159]
    cmp dl, 6Fh
    je i_exit
    cmp dl, 6Ch
    je minus_hp_castle_key
    mov bomb_tank_active, 1
    mov di, si
    sub di, 160
    mov bomb_tank_position, di
    mov es:[si-160], 07h
    mov es:[si-159], 0Fh
    jmp i_exit

    left_dir:
    mov bomb_tank_direction, 11h
    mov dl, es:[si-1]
    cmp dl, 6Fh
    je i_exit
    cmp dl, 6Ch
    je minus_hp_castle_key
    mov bomb_tank_active, 1
    mov di, si
    sub di, 2
    mov bomb_tank_position, di
    mov es:[si-2], 07h
    mov es:[si-1], 0Fh
    mov es:[si], 11h
    mov es:[si+1], 0Fh
    jmp i_exit

    down_dir:
    mov bomb_tank_direction, 1Fh
    mov dl, es:[si+161]
    cmp dl, 6Fh
    je i_exit
    cmp dl, 6Ch
    je minus_hp_castle_key
    mov bomb_tank_active, 1
    mov di, si
    add di, 160
    mov bomb_tank_position, di
    mov es:[si+160], 07h
    mov es:[si+161], 0Fh
    jmp i_exit

    rigth_dir:
    mov bomb_tank_direction, 10h
    mov dl, es:[si+3]
    cmp dl, 6Fh
    je i_exit
    cmp dl, 6Ch
    je minus_hp_castle_key
    mov bomb_tank_active, 1
    mov di, si
    add di, 2
    mov bomb_tank_position, di
    mov es:[si], 10h
    mov es:[si+1], 0Fh
    mov es:[si+2], 07h
    mov es:[si+3], 0Fh
    jmp i_exit

    minus_hp_castle_key:
    mov si, castle_hp
    add si, si
    mov es:[si+392], ' ' 
    mov es:[si+393], 0Fh
    mov es:[404], 198
    mov es:[405], 0Fh
    dec castle_hp

    i_exit:  
    mov al, 20h 
    out 20h, al
    iret                               ;return from interrupt
KEYBOARD_INTERRUPT ENDP 

TIMER_INTERRUPT PROC FAR
    pushf
    call dword ptr [ds:old_int_1C]

    inc time
    call print_time

    mov dl, bomb_tank_active
    cmp dl, 0
    je MOVEMENT_EVIL_TANK

    mov ax, time
    mov bx, 2
    xor dx, dx
    div bx
    cmp dx, 0
    jne MOVEMENT_EVIL_TANK

    mov si, bomb_tank_position
    mov dl, bomb_tank_direction
    cmp dl, 1Eh
    je up_dir_bomb
    cmp dl, 11h
    je left_dir_bomb
    cmp dl, 1Fh
    je down_dir_bomb
    cmp dl, 10h
    je right_dir_bomb
    jmp MOVEMENT_EVIL_TANK

    up_dir_bomb:
    mov dl, es:[si-159]
    cmp dl, 6Fh
    je delete_bomb
    cmp dl, 05h
    je delete_bomb
    cmp dl, 6Ch
    je minus_hp_castle
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    sub si, 160
    mov bomb_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 0Fh
    jmp MOVEMENT_EVIL_TANK

    left_dir_bomb:
    mov dl, es:[si-1]
    cmp dl, 6Fh
    je delete_bomb
    cmp dl, 05h
    je delete_bomb
    cmp dl, 6Ch
    je minus_hp_castle
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    sub si, 2
    mov bomb_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 0Fh
    jmp MOVEMENT_EVIL_TANK

    down_dir_bomb:
    mov dl, es:[si+161]
    cmp dl, 6Fh
    je delete_bomb
    cmp dl, 05h
    je delete_bomb
    cmp dl, 6Ch
    je minus_hp_castle
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    add si, 160
    mov bomb_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 0Fh
    jmp MOVEMENT_EVIL_TANK

    right_dir_bomb:
    mov dl, es:[si+3]
    cmp dl, 6Fh
    je delete_bomb
    cmp dl, 05h
    je delete_bomb
    cmp dl, 6Ch
    je minus_hp_castle
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    add si, 2
    mov bomb_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 0Fh
    jmp MOVEMENT_EVIL_TANK

    minus_hp_castle:
    mov si, castle_hp
    add si, si
    mov es:[si+392], ' ' 
    mov es:[si+393], 0Fh
    mov es:[404], 198
    mov es:[405], 0Fh
    dec castle_hp

    delete_bomb:
    mov bomb_tank_active, 0
    mov si, bomb_tank_position
    mov es:[si], ' '
    mov es:[si+1], 0Fh

    MOVEMENT_EVIL_TANK:
    mov ax, time
    mov bx, 6
    xor dx, dx
    div bx
    cmp dx, 0
    jne CHECK_TANK

    mov ax, tank_position
    mov bx, 160
    xor dx,dx
    div bx
    mov cx, ax
    mov si, dx
    mov ax, evil_tank_position
    xor dx,dx
    div bx
    cmp ax, cx
    jg up_tank
    cmp ax, cx
    jl down_tank
    
    mov_right_left:
    cmp dx, si
    jg left_tank
    right_tank:
    mov di, evil_tank_position
    mov al, es:[di+3]
    cmp al, 6Fh
    je exit_from_int
    cmp al, 6Ch
    je exit_from_int
    mov es:[di], ' '
    mov es:[di+1], 0Fh
    add di, 2
    mov evil_tank_position, di
    mov es:[di], 10h 
    mov es:[di+1], 05h
    jmp CHECK_TANK

    left_tank:
    mov di, evil_tank_position
    mov al, es:[di-1]
    cmp al, 6Fh
    je exit_from_int
    cmp al, 6Ch
    je exit_from_int
    mov es:[di], ' '
    mov es:[di+1], 0Fh
    sub di, 2
    mov evil_tank_position, di
    mov es:[di], 11h 
    mov es:[di+1], 05h
    jmp CHECK_TANK

    up_tank:
    mov di, evil_tank_position
    mov al, es:[di-159]
    cmp al, 6Fh
    je mov_right_left
    cmp al, 6Ch
    je mov_right_left
    mov es:[di], ' '
    mov es:[di+1], 0Fh
    sub di, 160
    mov evil_tank_position, di
    mov es:[di], 1Eh 
    mov es:[di+1], 05h
    jmp CHECK_TANK

    down_tank:
    mov di, evil_tank_position
    mov al, es:[di+161]
    cmp al, 6Fh
    je mov_right_left
    cmp al, 6Ch
    je mov_right_left
    mov es:[di], ' '
    mov es:[di+1], 0Fh
    add di, 160
    mov evil_tank_position, di
    mov es:[di], 1Fh 
    mov es:[di+1], 05h
    jmp CHECK_TANK

    CHECK_TANK:
    mov dl, bomb_evil_tank_active
    cmp dl, 1
    je EVIL_TANK_BOMB

    mov si, evil_tank_position
    mov dl, es:[si]
    cmp dl, 1Eh
    je up_check
    cmp dl, 11h
    je left_check
    cmp dl, 1Fh
    je down_check
    cmp dl, 10h
    je right_check
    jmp exit_from_int

    up_check:
    sub si, 159
    mov dl, es:[si]
    cmp dl, 6Fh
    je exit_from_int
    cmp dl, 6Ch
    je exit_from_int
    dec si
    mov dl, es:[si]
    cmp dl, 07h
    je up_check
    cmp dl, 1Eh
    je activate_up
    cmp dl, 11h
    je activate_up
    cmp dl, 1Fh
    je activate_up
    cmp dl, 10h
    jne up_check
    
    activate_up:
    mov bomb_evil_tank_active, 1
    mov si, evil_tank_position
    sub si, 160
    mov es:[si], 07h
    mov es:[si+1], 05h
    mov bomb_evil_tank_position, si
    mov bomb_evil_tank_direction, 1Eh
    jmp EVIL_TANK_BOMB

    left_check:
    sub si, 1
    mov dl, es:[si]
    cmp dl, 6Fh
    je exit_from_int
    cmp dl, 6Ch
    je exit_from_int
    dec si
    mov dl, es:[si]
    cmp dl, 07h
    je left_check
    cmp dl, 1Eh
    je activate_left
    cmp dl, 11h
    je activate_left
    cmp dl, 1Fh
    je activate_left
    cmp dl, 10h
    jne left_check
    
    activate_left:
    mov bomb_evil_tank_active, 1
    mov si, evil_tank_position
    sub si, 2
    mov es:[si], 07h
    mov es:[si+1], 05h
    mov bomb_evil_tank_position, si
    mov bomb_evil_tank_direction, 11h
    jmp EVIL_TANK_BOMB

    down_check:
    add si, 161
    mov dl, es:[si]
    cmp dl, 6Fh
    je exit_from_int
    cmp dl, 6Ch
    je exit_from_int
    dec si
    mov dl, es:[si]
    cmp dl, 07h
    je down_check
    cmp dl, 1Eh
    je activate_down
    cmp dl, 11h
    je activate_down
    cmp dl, 1Fh
    je activate_down
    cmp dl, 10h
    jne down_check
    
    activate_down:
    mov bomb_evil_tank_active, 1
    mov si, evil_tank_position
    add si, 160
    mov es:[si], 07h
    mov es:[si+1], 05h
    mov bomb_evil_tank_position, si
    mov bomb_evil_tank_direction, 1Fh
    jmp EVIL_TANK_BOMB

    right_check:
    add si, 3
    mov dl, es:[si]
    cmp dl, 6Fh
    je exit_from_int
    cmp dl, 6Ch
    je exit_from_int
    dec si
    mov dl, es:[si]
    cmp dl, 07h
    je right_check
    cmp dl, 1Eh
    je activate_right
    cmp dl, 11h
    je activate_right
    cmp dl, 1Fh
    je activate_right
    cmp dl, 10h
    jne right_check
    
    activate_right:
    mov bomb_evil_tank_active, 1
    mov si, evil_tank_position
    add si, 2
    mov es:[si], 07h
    mov es:[si+1], 05h
    mov bomb_evil_tank_position, si
    mov bomb_evil_tank_direction, 10h
    jmp EVIL_TANK_BOMB

    EVIL_TANK_BOMB:
    mov dl, bomb_evil_tank_active
    cmp dl, 0
    je exit_from_int

    mov ax, time
    mov bx, 3
    xor dx, dx
    div bx
    cmp dx, 0
    jne exit_from_int

    mov si, bomb_evil_tank_position
    mov dl, bomb_evil_tank_direction
    cmp dl, 1Eh
    je up_dir_evil_bomb
    cmp dl, 11h
    je left_dir_evil_bomb
    cmp dl, 1Fh
    je down_dir_evil_bomb
    cmp dl, 10h
    je right_dir_evil_bomb
    jmp exit_from_int

    up_dir_evil_bomb:
    mov dl, es:[si-159]
    cmp dl, 6Fh
    je delete_evil_bomb
    cmp dl, 05h
    je delete_evil_bomb
    cmp dl, 6Ch
    je delete_evil_bomb
    mov dl, es:[si-160]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov dl, es:[si]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    sub si, 160
    mov bomb_evil_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 05h
    jmp exit_from_int

    left_dir_evil_bomb:
    mov dl, es:[si-1]
    cmp dl, 6Fh
    je delete_evil_bomb
    cmp dl, 05h
    je delete_evil_bomb
    cmp dl, 6Ch
    je delete_evil_bomb
    mov dl, es:[si-2]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov dl, es:[si]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    sub si, 2
    mov bomb_evil_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 05h
    jmp exit_from_int

    down_dir_evil_bomb:
    mov dl, es:[si+161]
    cmp dl, 6Fh
    je delete_evil_bomb
    cmp dl, 05h
    je delete_evil_bomb
    cmp dl, 6Ch
    je delete_evil_bomb
    mov dl, es:[si+160]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov dl, es:[si]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    add si, 160
    mov bomb_evil_tank_position, si
    mov es:[si], 07h
    mov es:[si+1], 05h
    jmp exit_from_int

    right_dir_evil_bomb:
    mov dl, es:[si+3]
    cmp dl, 6Fh
    je delete_evil_bomb
    cmp dl, 05h
    je delete_evil_bomb
    cmp dl, 6Ch
    je delete_evil_bomb
    mov dl, es:[si+2]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov dl, es:[si]
    cmp dl, 1Eh
    je minus_tank
    cmp dl, 11h
    je minus_tank
    cmp dl, 1Fh
    je minus_tank
    cmp dl, 10h
    je minus_tank
    mov es:[si], ' '
    mov es:[si+1], 0Fh
    add si, 2
    mov bomb_evil_tank_position, si
    mov dh, es:[si+2]
    mov dl, es:[si+3]
    mov es:[si], 07h
    mov es:[si+1], 05h
    mov es:[si+2], dh
    mov es:[si+3], dl
    jmp exit_from_int

    minus_tank:
    dec tank_hp

    delete_evil_bomb:
    mov bomb_evil_tank_active, 0
    mov si, bomb_evil_tank_position
    mov es:[si], ' '
    mov es:[si+1], 0Fh


    exit_from_int:
    iret
TIMER_INTERRUPT ENDP 

print_time PROC
    mov ax, time
    xor dx,dx
    mov bx, 18
    div bx
    xor dx,dx
    mov bx, 60
    div bx
    mov cx,dx
    xor dx,dx
    mov bx,10
    div bx
    add ax, 30h
    add dx, 30h
    mov es:[222], ax
    mov es:[223], 0Fh
    mov es:[224], dx
    mov es:[225], 0Fh
    mov es:[226], ':'
    mov es:[227], 0Fh

    mov ax,cx
    xor dx,dx
    div bx
    add ax, 30h
    add dx, 30h
    mov es:[228], ax
    mov es:[229], 0Fh
    mov es:[230], dx
    mov es:[231], 0Fh
    ret
print_time ENDP

restore_interrupts PROC
    mov ax, 251Ch
    mov dx, old_int_1C
    mov cx, old_int_1C+2
    push ds
    mov ds, cx
    int 21h
    pop ds

    mov ax, 2509h
    mov dx, old_int_9
    mov cx, old_int_9+2
    push ds
    mov ds, cx
    int 21h
    pop ds

    ret
restore_interrupts ENDP

start:
.386
mov ax, DGROUP
mov ds, ax

CLEAR_DISPLAY

push 0b800h                     ;set video memory
pop es

call FILL_DISPLAY

;set menu
mov cx, start_message_size
mov di,word ptr 1990
mov si, offset start_message
cld
rep movsb

mov cx, exit_message_size
mov di,word ptr 2310
mov si, offset exit_message
cld
rep movsb

mov es:[1986], '>'
mov es:[1987], 6Fh


ENTER:
mov ah, 10h
int 16h

cmp al, 0e0h
jne check_enter
cmp ah, 48h
je move
cmp ah, 50h
je move
jmp ENTER

check_enter:
cmp ah, 1ch
jne ENTER 

mov dl, es:[2306]
cmp dl, '>'
je EXIT
jmp BEGIN_GAME

move:
mov dl, es:[1986]
cmp dl, '>'
jne move_up
mov es:[1986], ' '
mov es:[1987], 6fh
mov es:[2306], '>'
mov es:[2307], 6Fh
jmp ENTER
move_up:
mov es:[2306], ' '
mov es:[2307], 6Fh
mov es:[1986], '>'
mov es:[1987], 6Fh
jmp ENTER


;start game process
BEGIN_GAME:
CLEAR_DISPLAY

mov bomb_tank_active, 0
mov bomb_evil_tank_active, 0
mov castle_hp, 5
mov time, 0
mov tank_hp, 1

;set map
mov cx,13
xor bx,bx
mov ax,164
draw_map_loop:
push cx
mov cx, 46
mov di,word ptr ax
lea si, map[bx]
cld
rep movsb
add bx, 46
add ax, 160
pop cx
loop draw_map_loop

mov es:[24], 222
mov es:[25], 0Ch
mov es:[26], 1
mov es:[27], 0Ch
mov es:[28], 221
mov es:[29], 0Ch
mov es:[30], 27
mov es:[31], 0Fh

mov cx, evil_message_size
mov di,word ptr 32
mov si, offset evil_message
cld
rep movsb

mov cx, time_message_size
mov di,word ptr 212
mov si, offset time_message
cld
rep movsb

mov cx, castle_hp_message_size
mov di, word ptr 372
mov si, offset castle_hp_message
cld
rep movsb

;set tank on start position
mov tank_position, 1946
mov es:[1946],1Eh
mov es:[1947],0Fh

;set evil tank on start position
mov evil_tank_position, 328
mov es:[328], 10h
mov es:[329], 05h

;set new interrupt handlers
mov ax, 3509h                   ;save old interrupt handler
int 21h
mov [old_int_9], bx
mov ax, es
mov [old_int_9+2], ax

cli
push ds
push cs
pop ds
lea dx, KEYBOARD_INTERRUPT
mov ax, 2509h
int 21h
pop ds
sti

mov ax, 351Ch
int 21h
mov [old_int_1C], bx
mov ax, es
mov [old_int_1C+2], ax

cli
push ds
push cs
pop ds
lea dx, TIMER_INTERRUPT
mov ax, 251Ch
int 21h
pop ds
sti

push 0b800h                     ;set video memory
pop es

;game process
game:  
    mov ax, castle_hp
    cmp ax, 0
    je VICTORY
    mov ax, tank_hp
    cmp ax, 0
    je FAIL
jmp game      

VICTORY:
call restore_interrupts
call FILL_DISPLAY
mov cx, victory_message_size
mov di,word ptr 386
mov si, offset victory_message
cld
rep movsb
jmp CONTINUE_MENU

FAIL:
call restore_interrupts
call FILL_DISPLAY
mov cx, fail_message_size
mov di,word ptr 386
mov si, offset fail_message
cld
rep movsb

CONTINUE_MENU:
;set menu
mov cx, retry_message_size
mov di,word ptr 1990
mov si, offset retry_message
cld
rep movsb

mov cx, exit_message_size
mov di,word ptr 2310
mov si, offset exit_message
cld
rep movsb

mov es:[1986], '>'
mov es:[1987], 6Fh


ENTER_V_F:
mov ah, 10h
int 16h

cmp al, 0e0h
jne check_enter_v_f
cmp ah, 48h
je move_v_f
cmp ah, 50h
je move_v_f
jmp ENTER_V_F

check_enter_v_f:
cmp ah, 1ch
jne ENTER_V_F

mov dl, es:[2306]
cmp dl, '>'
je EXIT
jmp BEGIN_GAME

move_v_f:
mov dl, es:[1986]
cmp dl, '>'
jne move_up_v_f
mov es:[1986], ' '
mov es:[1987], 6fh
mov es:[2306], '>'
mov es:[2307], 6Fh
jmp ENTER_V_F
move_up_v_f:
mov es:[2306], ' '
mov es:[2307], 6Fh
mov es:[1986], '>'
mov es:[1987], 6Fh
jmp ENTER_V_F


EXIT:
mov ah, 00                      ;clear dispaly and set size 80x25
mov al, 03
int 10h

mov ax, 4c00h
int 21h
end start