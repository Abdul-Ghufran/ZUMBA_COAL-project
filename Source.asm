;Name: Abdul Ghufran
;Roll no: 23i-0576
;Section: CS-C


include irvine32.inc
include macros.inc

bullet STRUCT
	x db ?
	y db ?
	directionX db ?
    directionY db ?
    color db ?
    alive db ?
    moving db ?
bullet ENDS

ball STRUCT
    x db ?
    y db ?
    directionX db ?
    directionY db ?
    color db ?
    alive db ?
ball ENDS

.data
    ; Level layout

    walls BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    - -                                      |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                    - -                                      |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0


    ZUMBAmsg  db "___________________________________________________________________________________", 13, 10
             db "                                                                                  ", 13, 10
             db "            ____________ __       __  __     __  ________   _________             ", 13,10
             db "           /________   /|  |     |  ||  \   /  ||   ____ \ /         \            ", 13,10
             db "                   /  / |  |     |  ||   \_/   ||  |    | ||   ___   |            ", 13,10
             db "                 /  /   |  |     |  ||         ||  |___/ / |  /___\  |            ", 13,10
             db "               /  /     |  |     |  ||  |\_/|  ||   ____<  |   ___   |            ", 13,10
             db "             /  /_______|  |_____|  ||  |   |  ||  |___) \ |  |   |  |            ", 13,10
             db "           /___________/ \_________/ |__|   |__||_______ / |__|   |__|            ", 13,10
             db "                                                                                  ", 13,10
             db "__________________________________________________________________________________", 13,10
             db 0

    
     menu BYTE "___________________________________________________________________________", 13, 10
          BYTE "|                                                                         |", 13, 10
          BYTE "|                                                                         |", 13, 10
          BYTE "|    ####       ####    ##########    ####      ####    ####     ####     |", 13, 10
          BYTE "|    #   #     #   #    #   ######    #   #     #  #    #  #     #  #     |", 13, 10
          BYTE "|    #    #   #    #    #   #         #     #   #  #    #  #     #  #     |", 13, 10
          BYTE "|    #  #   #   #  #    #   #####     #       # #  #    #  #     #  #     |", 13, 10
          BYTE "|    #  # #   # #  #    #   #####     #  #      #  #    #  #     #  #     |", 13, 10
          BYTE "|    #  #   #   #  #    #   #         #  # #       #    #  #     #  #     |", 13, 10
          BYTE "|    #  #       #  #    #   ######    #  #   #     #    #  #######  #     |", 13, 10
          BYTE "|    #  #       #  #    #        #    #  #     #   #    #           #     |", 13, 10
          BYTE "|    ####       ####    ##########    ####      ####    #############     |", 13, 10
          BYTE "|                                                                         |", 13, 10
          BYTE "|_________________________________________________________________________|", 13, 10
          BYTE 0


    pauseScreen db"                 $$$$$$$\  $$$$$$$$\  $$$$$$\  $$\   $$\ $$\      $$\ $$$$$$$$\        " ,13,10
                db"      ._.        $$  __$$\ $$  _____|$$  __$$\ $$ |  $$ |$$$\    $$$ |$$  _____|       " ,13,10
                db"     /| |        $$ |  $$ |$$ |      $$ /  \__|$$ |  $$ |$$$$\  $$$$ |$$ |             " ,13,10
                db"      | |        $$$$$$$  |$$$$$\    \$$$$$$\  $$ |  $$ |$$\$$\$$ $$ |$$$$$\           " ,13,10
                db"      |_|        $$  __$$< $$  __|    \____$$\ $$ |  $$ |$$ \$$$  $$ |$$  __|          " ,13,10
                db"     -----       $$ |  $$ |$$ |      $$\   $$ |$$ |  $$ |$$ |\$  /$$ |$$ |             " ,13,10
                db"                 $$ |  $$ |$$$$$$$$\ \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$$$$$$$\        " ,13,10
                db"                 \__|  \__|\________| \______/  \______/ \__|     \__|\________|       " ,13,10
                db"                                                                                       " ,13,10
                db"                                                                                       " ,13,10
                db"                                                                                       " ,13,10
                db"                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\                     " ,13,10
                db"                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|                    " ,13,10
                db"           /---\             $$ |      \$$\ $$  |  $$ |     $$ |                       " ,13,10
                db"          '---\ \            $$$$$\     \$$$$  /   $$ |     $$ |                       " ,13,10
                db"           ___|_|            $$  __|    $$  $$<    $$ |     $$ |                       " ,13,10
                db"          |  ___.            $$ |      $$  /\$$\   $$ |     $$ |                       " ,13,10
                db"          |_____|            $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                       " ,13,10
                db"                             \________|\__|  \__|\______|   \__|                       " ,13,10
                db 0


 gameOverScreen   db"        ______        ______  _______     _____  _    _.______..______         " ,13,10
                  db"       / _____)  /\  |  ___ \( ._____)   / ___ \| |  | ( .____)(_____ \        " ,13,10
                  db"      | /  ___  /  \ | | _ | | |___     | |   | | |  | | |____.|_____) )       " ,13,10
                  db"      | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ____)(_____ (        " ,13,10
                  db"      | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |       " ,13,10
                  db"       \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|       " ,13,10
                  db 0



    ; Default character (initial direction)
    inputChar db 0

    VK_ENTER       EQU 13           ; Enter key ASCII value
    VK_BACK        EQU 8            ; Backspace key ASCII value
    choice db 0
    pName BYTE 50 DUP(0)

    ; Colors for the emitter and player
    ; color_red db 4       ; Red
    ; color_green db 2     ; Green
    ; color_yellow db 14   ; Yellow (for fire symbol)


    ; fire_color db 14     ; Fire symbol color (Yellow)

    ; seed DWORD ?                  ; Variable to store the seed


    ; Interface variables
    score db 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0
    
    ; Colors
    colors db red, green, yellow, blue

    ; Boundaries
    leftWall db 21
    rightWall db 95
    topWall db 6
    bottomWall db 27


	; Player's bullet
    playerBullet bullet <58, 16, 1, 0, green, TRUE, FALSE>


    ; Balls
    ballsSize = 50
    balls ball ballsSize dup (<56, 6, 1, 1, 0, TRUE>)
    
    ; index
    coll_idx db 0

    ; Temp variables
    current_color db 0
    chain_count db 0

.code


WellcomeScreen Proc
	; Set initial position for the ASCII art
	mov dl, 20                     ; (X-coordinate)
	mov dh, 7                      ; (Y-coordinate)
	call GoToXY                    
	mov eax, White + (Black * 16)  
	call SetTextColor

	; Load the starting address 
	mov esi, offset ZUMBAmsg           

printRow:
	lodsb                          ; Load a byte from [ESI] into AL
	cmp al, 0                      ; Check for end of string
	je printDone                   ; Exit loop if null terminator is found
	cmp al, 13                     ; Check for carriage return
	je nextLine                    
	call WriteChar                 ; Print the character in AL
	jmp printRow                   ; Continue printing

nextLine:
	lodsb                          ; Skip the newline character (line feed)
	mov dl, 20                     ; Reset X-coordinate
	inc dh                         ; Move to the next line
	call GoToXY                    ; Set the new position
	jmp printRow                   ; Continue printing the next row

printDone:
	; Print the prompt message below the menu
	mov dl, 20                     ; X-coordinate
	mov dh, 24                     ; Y-coordinate (position below the menu)
	call GoToXY
	mov eax, White + (Black * 16)  ; Set text color
	call SetTextColor

	mWrite "Press Enter to start the game"

	; Wait for the user to press Enter
waitForKey:
	mov eax, 0
	call ReadKey
	cmp al, VK_ENTER               ; Check if the Enter key was pressed
	jne waitForKey                 ; Loop until Enter is pressed

	ret

WellcomeScreen Endp



GAMEOVER Proc
    call clrscr

	; Set initial position for the ASCII art
	mov dl, 20                     ; Horizontal position (X-coordinate)
	mov dh, 7                     ; Vertical position (Y-coordinate)
	call GoToXY                    ; Position cursor
	mov eax, White + (Black * 16)  ; Set text color
	call SetTextColor

	; Load the starting address of the ASCII art
	mov esi, offset gameOverScreen           ; Point ESI to the 'menu' message

printRow:
	lodsb                          ; Load a byte from [ESI] into AL
	cmp al, 0                      ; Check for end of string
	je printDone                   ; Exit loop if null terminator is found
	cmp al, 13                     ; Check for carriage return
	je nextLine                    ; Move to the next line
	call WriteChar                 ; Print the character in AL
	jmp printRow                   ; Continue printing

nextLine:
	lodsb                          ; Skip the newline character (line feed)
	mov dl, 20                     ; Reset X-coordinate
	inc dh                         ; Move to the next line
	call GoToXY                    ; Set the new position
	jmp printRow                   ; Continue printing the next row

printDone:
	
    call displayPlayerName

    ; Print the prompt message below the menu
    mov dl, 50                     ; X-coordinate
    mov dh, 20                     ; Y-coordinate (position below the menu)
    call GoToXY
    mov eax, yellow  ; Set text color
    call SetTextColor
    mWrite "Your score is: "
    movzx eax, score
    call WriteDec

    call crlf
    mov dl, 35                     ; X-coordinate
    mov dh, 23                     ; Y-coordinate (position below the menu)
    call GoToXY
    mov eax, White + (Black * 16)
    call SetTextColor
	mWrite "Press Enter to exit the game"

	; Wait for the user to press Enter
waitForKey:
	mov eax, 0
	call ReadKey
	cmp al, VK_ENTER               ; Check if the Enter key was pressed
    je exitProgram
	jne waitForKey                 ; Loop until Enter is pressed


GAMEOVER Endp


PauseScr Proc

    call clrscr
	; Set initial position for the ASCII art
	mov dl, 20                     ; Horizontal position (X-coordinate)
	mov dh, 7                     ; Vertical position (Y-coordinate)
	call GoToXY                    ; Position cursor
	mov eax, White + (Black * 16)  ; Set text color
	call SetTextColor

	; Load the starting address of the ASCII art
	mov esi, offset pauseScreen           ; Point ESI to the 'menu' message

printRow:
	lodsb                          ; Load a byte from [ESI] into AL
	cmp al, 0                      ; Check for end of string
	je printDone                   ; Exit loop if null terminator is found
	cmp al, 13                     ; Check for carriage return
	je nextLine                    ; Move to the next line
	call WriteChar                 ; Print the character in AL
	jmp printRow                   ; Continue printing

nextLine:
	lodsb                          ; Skip the newline character (line feed)
	mov dl, 20                     ; Reset X-coordinate
	inc dh                         ; Move to the next line
	call GoToXY                    ; Set the new position
	jmp printRow                   ; Continue printing the next row

printDone:
	; Print the prompt message below the menu
	mov dl, 20                     ; X-coordinate
	mov dh, 24                     ; Y-coordinate (position below the menu)
	call GoToXY
	mov eax, White + (Black * 16)  ; Set text color
	call SetTextColor


	; Wait for the user to press Enter
waitForKey:
	mov eax, 0
	call ReadChar
	cmp al, '1'               ; Check if the Enter key was pressed
	je finish                 ; Loop until Enter is pressed
    cmp al, '2'
    je exitProgram
jne waitForKey                 ; Loop until Enter is pressed

finish:
    call clrscr
	ret

PauseScr Endp


inputScreen Proc

	 ; Display the input screen for user name
    call clrscr
    mov dl, 35                     ; Position prompt in the middle of the screen
    mov dh, 12                     ; Centered vertically
    call GoToXY
    mWrite "Enter your name: "
    mov edx,offset pName
    mov ecx,20
    call readstring
    call clrscr
    ret

inputScreen Endp

displayPlayerName PROC
    mov dl, 47                     ; Horizontal position for display
    mov dh, 17                     ; Vertical position for display
    call GoToXY
    mov eax, yellow  ; Set text color
    call SetTextColor
    mWrite "Player Name: ghufran "
    
    ret
displayPlayerName ENDP


displayMenuScreen PROC
    ; Set initial position for the ASCII art
    mov dl, 20                     ; Horizontal position (X-coordinate)
    mov dh, 7                     ; Vertical position (Y-coordinate)
    call GoToXY                    ; Position cursor
    mov eax, White + (Black * 16)  ; Set text color
    call SetTextColor

    ; Load the starting address of the ASCII art
    mov esi, offset menu           ; Point ESI to the 'menu' message

printRow:
    lodsb                          ; Load a byte from [ESI] into AL
    cmp al, 0                      ; Check for end of string
    je printDone                   ; Exit loop if null terminator is found
    cmp al, 13                     ; Check for carriage return
    je nextLine                    ; Move to the next line
    call WriteChar                 ; Print the character in AL
    jmp printRow                   ; Continue printing

nextLine:
    lodsb                          ; Skip the newline character (line feed)
    mov dl, 20                     ; Reset X-coordinate
    inc dh                         ; Move to the next line
    call GoToXY                    ; Set the new position
    jmp printRow                   ; Continue printing the next row

printDone:
    ; Print the prompt message below the menu
    mov dl, 20                     ; X-coordinate
    mov dh, 24                     ; Y-coordinate (position below the menu)
    call GoToXY
    mov eax, White + (Black * 16)  ; Set text color
    call SetTextColor

    mWrite "Press Enter to start the game"

    ; Wait for the user to press Enter
waitForKey:
    mov eax, 0
    call ReadKey
    cmp al, VK_ENTER               ; Check if the Enter key was pressed
    jne waitForKey                 ; Loop until Enter is pressed

    ret

displayMenuScreen ENDP


displayMenu PROC

    ; Clear the screen and display the menu
    call clrscr
    ; Set text color
    mov eax, White + (Black * 16)
    call SetTextColor

    ; Print the main menu
    mov dl, 40                     ; Set horizontal position
    mov dh, 5                      ; Set vertical position
    call GoToXY
    mWrite "+-------------------------------+"
    mov dh, 6
    call GoToXY
    mWrite "|              MENU             |"
    mov dh, 7
    call GoToXY
    mWrite "+-------------------------------+"
    mov dh, 8
    call GoToXY
    mWrite "| [1] Start Game                |"
    mov dh, 9
    call GoToXY
    mWrite "| [2] Instructions              |"
    mov dh, 10
    call GoToXY
    mWrite "| [3] Options                   |"
    mov dh, 11
    call GoToXY
    mWrite "| [4] Exit                      |"
    mov dh, 12
    call GoToXY
    mWrite "+-------------------------------+"

    ; Print instructions below the menu
    mov dh, 14
    call GoToXY
    mWrite "Enter 1 to start the game"
    mov dh, 15
    call GoToXY
    mWrite "Enter 2 to display the instructions"
    mov dh, 16
    call GoToXY
    mWrite "Enter 3 for game controls"
    mov dh, 17
    call GoToXY
    mWrite "Enter 4 to exit"

waitForInput:
    ; Wait for user input
    call ReadChar               ; Read keypress
    mov choice, al          ; Store the input character in `inputChar`

    ; Check user input
    cmp choice, '1'
    je callStartGame           ; If '1' is pressed, jump to startGame
    cmp choice, '2'
    je callInstructions        ; If '2' is pressed, jump to instructions
    cmp choice, '3'
    je callOptions             ; If '3' is pressed, jump to options
    cmp choice, '4'
    je callExitProgram         ; If '4' is pressed, jump to exitProgram

    ; Invalid input handling
    mov dh, 18
    call GoToXY
    mWrite "Invalid choice, please try again."
    jmp waitForInput           ; Go back to waiting for input

callStartGame:
    call startGame             ; Start game procedure
    ret

callInstructions:
    call instructions          ; Instructions procedure
    jmp redisplayMenu

callOptions:
    call controls               ; Options procedure
    jmp redisplayMenu

callExitProgram:
    call exitProgram           ; Exit program procedure

redisplayMenu:
    call displayMenu           ; Redisplay the menu

    ret
displayMenu ENDP





startGame PROC
    ; Clear screen and display game
    call clrscr
    mov dl, 20
    mov dh, 10
    call GoToXY
    mWrite "Starting the game..."
    ret
startGame ENDP


instructions PROC
    ; Clear screen and display instructions
    call clrscr
    mov eax, White + (Black * 16)  ; Set text color
    call SetTextColor


    mov dl, 20
    mov dh, 8
    call GoToXY
    mWrite "Game Instructions:"
    
    mov dh, 10
    call GoToXY
    mWrite "- Use WASDQEZC keys to aim."
    
    mov dh, 11
    call GoToXY
    mWrite "- Press Spacebar to Shoot."
    
    mov dh, 12
    call GoToXY
    mWrite "- destroy the entire obstacles to win."

    mov dh, 14
    call GoToXY
    mWrite "Objective:"
    
    mov dh, 16
    call GoToXY
    mWrite "- Reach the end of the level without losing lives."

    mov dh, 17
    call GoToXY
    mWrite "- You have 3 lives to start with."
    
    mov dh, 18
    call GoToXY
    mWrite "- You can shoot colored balls to destroy the chain."

    mov dh, 20
    call GoToXY
    mWrite "Press Enter to return to the main menu."

waitForEnter:
    call ReadKey           
    mov inputChar, al          
    cmp inputChar, 13          ; ascii of enter is 13
    jne waitForEnter           
    ret
instructions ENDP


controls PROC
    ; Clear screen and display options
    call clrscr
    mov dl, 20
    mov dh, 5
    call GoToXY
    mWrite "Game Controls:"
    
    mov dh, 7
    call GoToXY
    mWrite "- ( W ) key: Aim up"

    mov dh, 8
    call GoToXY
    mWrite "- ( A ) key: Aim left"

    mov dh, 9
    call GoToXY
    mWrite "- ( S ) key: Aim down"

    mov dh, 10
    call GoToXY
    mWrite "- ( D ) key: Aim right"

    mov dh, 11
    call GoToXY
    mWrite "- ( Q ) key: Aim up-left"

    mov dh, 12
    call GoToXY
    mWrite "- ( E ) key: Aim up-right"

    mov dh, 13
    call GoToXY
    mWrite "- ( Z ) key: Aim down-left"

    mov dh, 14
    call GoToXY
    mWrite "- ( C ) key: Aim down-right"

    
    mov dh, 16
    call GoToXY
    mWrite "- Spacebar key: Shoot"
    
    mov dh, 17
    call GoToXY
    mWrite "- ( ESC ) key : Exit game"
    
    mov dh, 19
    call GoToXY
    mWrite "Press Enter to return to the main menu."

waitForEnterOptions:
    call ReadKey               
    mov inputChar, al          
    cmp inputChar, 13          ; Check if Enter (ASCII 13) is pressed
    jne waitForEnterOptions    
    ret
controls ENDP


exitProgram PROC
    ; Clear screen and exit program
    call clrscr
    mov dl, 20
    mov dh, 10
    call GoToXY
    mWrite "Exiting the program. Goodbye!"
    call ExitProcess
    ret
exitProgram ENDP


initializeBalls PROC uses eax ecx edx ebx
        mov ecx, 0                      ; Index for the balls array
        mov ebx, 0                      ; Offset increment for x position

    InitializeLoop:
        ; Check if ecx is less than ballsSize * sizeof ball
        cmp ecx, ballsSize * sizeof ball
        jge InitializeEnd               ; Exit loop if condition fails

        ; Initialize ball x position
        mov al, balls[ecx].x
        sub al, bl
        mov balls[ecx].x, al

        ; Generate a random number and assign a color
        mov eax, 2                      ; Pass range value for RandomRange
        call RandomRange
        mov dl, colors[eax]
        mov balls[ecx].color, dl

        ; Increment the counters
        add ecx, sizeof ball            ; Move to the next ball
        inc bl                          ; Increment the offset

        jmp InitializeLoop              ; Repeat the loop

InitializeEnd:
    ret
initializeBalls ENDP


moveBalls PROC uses eax ecx edx
    mov ecx, 0                      ; Index for the balls array

    MoveLoop:
        ; Check if ecx is less than ballsSize * sizeof ball
        cmp ecx, ballsSize * sizeof ball
        jge MoveEnd                    ; Exit loop if condition fails

        ; Clear the current position of the ball
        mov dl, balls[ecx].x
        mov dh, balls[ecx].y
        call Gotoxy
        mWrite " "

        ; Load current directions
        mov al, balls[ecx].directionX
        mov ah, balls[ecx].directionY

        ; Case 1: Moving Right
        cmp al, 1
        jne CheckDown                  ; If not moving right, check down
        mov dl, balls[ecx].x
        cmp dl, rightWall
        jge ChangeToDown               ; If at right boundary, change direction
        inc balls[ecx].x               ; Keep moving right
        jmp UpdateIndex

    ChangeToDown:
        mov balls[ecx].directionX, 0
        mov balls[ecx].directionY, 1   ; Change to moving down
        cmp ecx, 0
        jne UpdateIndex
        dec bottomWall
        jmp UpdateIndex

    CheckDown:
        ; Case 2: Moving Down
        cmp ah, 1
        jne CheckLeft                  ; If not moving down, check left
        mov dh, balls[ecx].y
        cmp dh, bottomWall
        jge ChangeToLeft               ; If at bottom boundary, change direction
        inc balls[ecx].y               ; Keep moving down
        jmp UpdateIndex

    ChangeToLeft:
        mov balls[ecx].directionY, 0
        mov balls[ecx].directionX, -1  ; Change to moving left
        cmp ecx, 0
        jne UpdateIndex
        add leftWall, 3
        jmp UpdateIndex

    CheckLeft:
        ; Case 3: Moving Left
        cmp al, -1
        jne CheckUp                    ; If not moving left, check up
        mov dl, balls[ecx].x
        cmp dl, leftWall
        jle ChangeToUp                 ; If at left boundary, change direction
        dec balls[ecx].x               ; Keep moving left
        jmp UpdateIndex

    ChangeToUp:
        mov balls[ecx].directionX, 0
        mov balls[ecx].directionY, -1  ; Change to moving up
        cmp ecx, 0
        jne UpdateIndex
        inc topWall
        jmp UpdateIndex

    CheckUp:
        ; Case 4: Moving Up
        cmp ah, -1
        jne UpdateIndex                ; If not moving up, skip to next
        mov dh, balls[ecx].y
        cmp dh, topWall
        jle ChangeToRight              ; If at top boundary, change direction
        dec balls[ecx].y               ; Keep moving up
        jmp UpdateIndex

    ChangeToRight:
        mov balls[ecx].directionY, 0
        mov balls[ecx].directionX, 1   ; Change to moving right
        cmp ecx, 0
        jne UpdateIndex
        sub rightWall, 3

    UpdateIndex:
        ; Increment the loop counter
        add ecx, sizeof ball
        jmp MoveLoop

    MoveEnd:
        ret
moveBalls ENDP


checkCollision PROC uses eax ecx edx ebx

    mov ebx, 0                      ; Ball index tracker
    mov ecx, 0                      ; Offset for balls array

    CheckCollisionLoop:
        cmp ecx, ballsSize * sizeof ball
        jge CollisionEnd                ; Exit loop if all balls processed

        mov al, balls[ecx].alive
        cmp al, TRUE
        jne SkipBall                    ; Skip this ball if not active

        ; Check collision between ball and playerBullet
        mov al, balls[ecx].x
        mov ah, balls[ecx].y
        mov dl, playerBullet.x
        mov dh, playerBullet.y
        cmp ah, dh
        jne CheckShooterCollision       ; Check next condition if y-coordinates don't match
        cmp al, dl
        jne CheckShooterCollision       ; Check next condition if x-coordinates don't match

        ; Collision detected with playerBullet
        mov dh, 0
        mov dl, 0
        call Gotoxy
        mov eax, white
        call SetTextColor
        mWrite "Collision detected"
        mov coll_idx, bl
        call updateBalls
        call resetBullet
        ret                             ; Exit if collision detected

    CheckShooterCollision:
        ; Check collision between ball and player shooter
        mov dl, 57                      ; Shooter x-coordinate
        mov dh, 16                      ; Shooter y-coordinate
        mov al, balls[ecx].x
        mov ah, balls[ecx].y
        cmp ah, dh
        jne SkipBall                    ; Skip this ball if y-coordinates don't match
        cmp al, dl
        jne SkipBall                    ; Skip this ball if x-coordinates don't match

        ; Collision detected with shooter
        call clrscr
        call GAMEOVER
        ret                             ; Exit if collision detected

    SkipBall:
        add ecx, sizeof ball            ; Move to the next ball
        inc ebx
        jmp CheckCollisionLoop          ; Continue the loop

    CollisionEnd:
        ret
checkCollision ENDP


chainCount PROC uses eax ecx ebx edx esi

    movzx esi, coll_idx             ; Load coll_idx into esi
    mov eax, esi                    ; Initialize previous index
    mov ebx, esi                    ; Initialize next index
    dec eax                         ; Previous index
    inc ebx                         ; Next index
    imul esi, sizeof ball           ; Current ball offset
    imul eax, sizeof ball           ; Previous ball offset
    imul ebx, sizeof ball           ; Next ball offset
    mov chain_count, 1              ; Initialize chain count
    mov cl, balls[esi].color        ; Load the color of the current ball

    CheckPrevious:
        cmp eax, 0                      ; Check if previous index is valid
        jl CheckNext                    ; Exit previous loop if index < 0

        mov dl, balls[eax].color        ; Load the color of the previous ball
        cmp dl, cl                      ; Compare colors
        jne CheckNext                   ; Exit previous loop if colors don't match

        mov dl, balls[eax].alive        ; Check if the ball is alive
        cmp dl, TRUE
        jne CheckNext                   ; Exit previous loop if ball is not alive

        inc chain_count                 ; Increment chain count
        sub eax, sizeof ball            ; Move to the previous ball
        jmp CheckPrevious               ; Repeat loop for previous balls

    CheckNext:
        cmp ebx, ballsSize * sizeof ball ; Check if next index is within bounds
        jge EndChainCount                ; Exit next loop if index >= array size

        mov dl, balls[ebx].alive         ; Check if the ball is alive
        cmp dl, TRUE
        jne EndChainCount                ; Exit next loop if ball is not alive

        mov dl, balls[ebx].color         ; Load the color of the next ball
        cmp dl, cl                       ; Compare colors
        jne EndChainCount                ; Exit next loop if colors don't match

        inc chain_count                  ; Increment chain count
        add ebx, sizeof ball             ; Move to the next ball
        jmp CheckNext                    ; Repeat loop for next balls

    EndChainCount:
        ret
chainCount ENDP


chainReaction PROC uses eax ebx ecx edx esi edi

    call chainCount

    cmp chain_count, 3
    jl skipReaction

    movzx esi, coll_idx
    mov eax, esi
    mov ebx, esi
    dec eax
    inc ebx
    imul eax, sizeof ball
    imul ebx, sizeof ball
    imul esi, sizeof ball
    mov balls[esi].alive, FALSE
    inc score

    mov cl, current_color

    ; Move eax to the left until we hit 0 or the color stops matching
    left_check:
        cmp eax, 0
        jl end_left_check
        cmp balls[eax].color, cl
        jne end_left_check
        cmp balls[eax].alive, TRUE
        je continue_left_check
        jmp end_left_check

    continue_left_check:
        mov balls[eax].alive, FALSE
        inc score
        sub eax, sizeof ball
        jmp left_check

    end_left_check:

        ; Move ebx to the right until we hit the end or the color stops matching
    right_check:
        cmp ebx, ballsSize * sizeof ball
        jge end_right_check
        cmp balls[ebx].alive, TRUE
        jne end_right_check
        cmp balls[ebx].color, cl
        jne end_right_check
        mov balls[ebx].alive, FALSE
        inc score
        add ebx, sizeof ball
        jmp right_check

    end_right_check:

    skipReaction:
        ret

chainReaction ENDP


updateBalls PROC uses eax edx ebx
    movzx eax, coll_idx
    imul eax, sizeof ball
    mov bl, playerBullet.color
    cmp balls[eax].color, bl
    jne skipUpdate

    ; Update the balls because color matches
    mov current_color, bl
    call chainReaction

    ; Update the score on screen
    mov dl, 26
    mov dh, 2
    call Gotoxy
    mov eax, Blue
    call SetTextColor
    movzx eax, score
    call WriteDec
    mov eax, white
    call SetTextColor

skipUpdate:
    ret
updateBalls ENDP


drawBalls PROC uses edx eax ecx
    mov ecx, 0
    drawLoop:
        cmp ecx, ballsSize * sizeof ball
        jge endDrawLoop

        cmp balls[ecx].alive, TRUE
        jne skipBall

        movzx eax, balls[ecx].color
        call SetTextColor
        mov dh, balls[ecx].y
        mov dl, balls[ecx].x
        call Gotoxy
        mWrite "O"

    skipBall:
        add ecx, sizeof ball
        jmp drawLoop

    endDrawLoop:
        mov eax, white
        call SetTextColor

    ret
drawBalls ENDP



updateDirection PROC uses eax edx
    ; Check for key press
    cmp playerBullet.alive, TRUE
    jne skipUpdate
    cmp playerBullet.moving, FALSE
    jne skipUpdate

    mov dh, 16
    mov dl, 57
    add dl, playerBullet.directionX
    add dh, playerBullet.directionY
    call Gotoxy
    mWrite " "

    ; Check for input key and update direction
    cmp inputChar, 'q'
    je setDirectionQ
    cmp inputChar, 'w'
    je setDirectionW
    cmp inputChar, 'e'
    je setDirectionE
    cmp inputChar, 'a'
    je setDirectionA
    cmp inputChar, 'd'
    je setDirectionD
    cmp inputChar, 'z'
    je setDirectionZ
    cmp inputChar, 'x'
    je setDirectionX
    cmp inputChar, 'c'
    je setDirectionC
    jmp skipUpdate

    setDirectionQ:
        mov playerBullet.directionX, -1
        mov playerBullet.directionY, -1
        jmp updateDirectionDone

    setDirectionW:
        mov playerBullet.directionX, 0
        mov playerBullet.directionY, -1
        jmp updateDirectionDone

    setDirectionE:
        mov playerBullet.directionX, 1
        mov playerBullet.directionY, -1
        jmp updateDirectionDone

    setDirectionA:
        mov playerBullet.directionX, -1
        mov playerBullet.directionY, 0
        jmp updateDirectionDone

    setDirectionD:
        mov playerBullet.directionX, 1
        mov playerBullet.directionY, 0
        jmp updateDirectionDone

    setDirectionZ:
        mov playerBullet.directionX, -1
        mov playerBullet.directionY, 1
        jmp updateDirectionDone

    setDirectionX:
        mov playerBullet.directionX, 0
        mov playerBullet.directionY, 1
        jmp updateDirectionDone

    setDirectionC:
        mov playerBullet.directionX, 1
        mov playerBullet.directionY, 1
        jmp updateDirectionDone

    skipUpdate:
        ret

    updateDirectionDone:
        movzx eax, playerBullet.color
        call SetTextColor
        mov dh, 16
        mov dl, 57
        add dl, playerBullet.directionX
        add dh, playerBullet.directionY
        call Gotoxy
        mWrite "*"

        ret
updateDirection ENDP



drawWall PROC uses eax edx ecx esi
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue
	call SetTextColor
	mov al, score
	call WriteDec

    mov eax, White
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
drawWall ENDP

drawPlayer PROC uses eax edx
	; set color of player
    mov eax, brown
    call SetTextColor
    mov dh, 16
    mov dl, 57
    call Gotoxy
    mWrite "O"
    ; set color of bullet
    movzx eax, playerBullet.color
    call SetTextColor
    add dh, playerBullet.directionY
    add dl, playerBullet.directionX
    call Gotoxy
    mWrite "*"
    ret
drawPlayer ENDP

moveBullet PROC uses edx eax
    ; Check if the bullet is at the boundary
    cmp playerBullet.x, 20
    je resetBulletLogic
    cmp playerBullet.x, 96
    je resetBulletLogic
    cmp playerBullet.y, 5
    je resetBulletLogic
    cmp playerBullet.y, 27
    je resetBulletLogic

    ; Bullet is within bounds, so move it
    mov dh, playerBullet.y
    mov dl, playerBullet.x
    call Gotoxy
    mWrite " "
    
    ; Set color of the bullet
    movzx eax, playerBullet.color
    call SetTextColor

    add dh, playerBullet.directionY
    add dl, playerBullet.directionX
    call Gotoxy
    mWrite "*"
    
    mov playerBullet.y, dh
    mov playerBullet.x, dl
    jmp moveBulletEnd

    resetBulletLogic:
        call resetBullet

    moveBulletEnd:
        ret
moveBullet ENDP


resetBullet PROC uses edx eax

    mov dh, playerBullet.y
    mov dl, playerBullet.x
    call Gotoxy
    mWrite " "
    ; generate random color for next bullet
	mov eax, 2
	call RandomRange
	mov dl, colors[eax]
	mov playerBullet.color, dl

    mov playerBullet.moving, FALSE
	mov playerBullet.alive, TRUE
    mov playerBullet.x, 57
    mov playerBullet.y, 16
    mov dl, playerBullet.x
    mov dh, playerBullet.y
    add dh, playerBullet.directionY
    add dl, playerBullet.directionX

    movzx eax, playerBullet.color
	call SetTextColor
    call Gotoxy
    mWrite "*"
	; reset color to white
    mov eax, white
	call SetTextColor
    ret
resetBullet ENDP

shootBullet PROC uses edx
	mov playerBullet.moving, TRUE
    mov dh, 16
    mov dl, 57
    add dh, playerBullet.directionY
    add dl, playerBullet.directionX
    call Gotoxy
    mWrite " "
    mov playerBullet.x, dl
	mov playerBullet.y, dh
    ret
shootBullet ENDP


mainGameLoop PROC

    GameLoop:
        ; Check for key press
        mov dx, 0
        call GoToXY

        mov eax, 5
        call Delay

        ; Check for key press
        mov eax, 0
        call ReadKey
        mov inputChar, al

        ; Handle player bullet movement
        mov al, playerBullet.moving
        cmp al, TRUE
        jne SkipBulletMovement
        call moveBullet
        call checkCollision
    SkipBulletMovement:

        ; Move balls and check for collisions
        call moveBalls
        call checkCollision

        ; Handle input character for direction
        mov al, inputChar
        cmp al, 'q'
        je HandleDirectionInput
        cmp al, 'w'
        je HandleDirectionInput
        cmp al, 'e'
        je HandleDirectionInput
        cmp al, 'a'
        je HandleDirectionInput
        cmp al, 'd'
        je HandleDirectionInput
        cmp al, 'z'
        je HandleDirectionInput
        cmp al, 'x'
        je HandleDirectionInput
        cmp al, 'c'
        je HandleDirectionInput

        ; Check if input character is VK_SPACE
        cmp al, VK_SPACE
        jne CheckEscapeKey
        mov al, playerBullet.moving
        cmp al, FALSE
        jne SkipShootBullet
        mov al, playerBullet.alive
        cmp al, TRUE
        jne SkipShootBullet
        call shootBullet
    SkipShootBullet:
        jmp DrawEverything

    CheckEscapeKey:
        ; Check if input character is VK_ESCAPE
        cmp al, VK_ESCAPE
        jne CheckEnterKey
        jmp ExitGameLoop

    CheckEnterKey:
        ; Check if input character is VK_ENTER
        cmp al, VK_ENTER
        jne DrawEverything
        call PauseScr
        call initializeScreen
        jmp DrawEverything

    HandleDirectionInput:
        call updateDirection
        jmp DrawEverything

    DrawEverything:
        ; Draw everything on the screen
        call drawBalls
        jmp GameLoop

    ExitGameLoop:
        ret

mainGameLoop ENDP



initializeScreen PROC
    ; Draw the level layout at the start
    call drawWall

    ; Need to be printed only once
    call drawPlayer

    ret
initializeScreen ENDP






main PROC

    ; Display the welcome screen
    call WellcomeScreen

    ; Display the input screen for user name
	call inputScreen

    ; Display the menuScreen
	call displayMenuScreen

    ; Display the main menu
	call displayMenu
    
    ; Get the current time to use as a seed
    call GetMSeconds              ; Get milliseconds since the system started

    ; Seed the random number generator
    call Randomize                ; Initialize the random number generator

    ; Initialize screen and emitter
    call initializeScreen

	; Initialize balls
	call initializeBalls

    ; this function is recursive, and will repeat until the game is either won or lost 
    call mainGameLoop

    exit
main ENDP
END main
