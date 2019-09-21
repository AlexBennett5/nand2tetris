// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
	@SCREEN
	D=A
	@pos
	M=D
	@8191
	D=A
	@SCREEN
	D=D+A
	@max
	M=D

(CHECK)
	@KBD
	D=M
	@WHITE
	D;JEQ
	@BLACK
	0;JMP

(WHITE)
	@pos
	A=M
	M=0
	@INC
	0;JMP

(BLACK)
	@pos
	A=M
	M=-1
	@INC

(INC)
	@pos
	D=M+1
	M=D

	@max
	D=D-M
	@START
	D;JNE

	@SCREEN
	D=A
	@pos
	M=D
	0;JMP
