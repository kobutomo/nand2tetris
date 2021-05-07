// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192
D=A
@pixels
M=D
(REC)
  @KBD
  D=M
  @FILLB
  D;JGT
  @REC
  0;JMP
(FILLB)
  @i
  M=0
(LOOP1)
  @i
  D=M
  @pixels
  D=D-M
  @WAIT
  D;JGT
  @i
  D=M
  @SCREEN
  // ディスプレイのアドレスを変数に
  A=A+D
  M=-1
  @i
  M=M+1
  @LOOP1
  0;JMP
(WAIT)
  @KBD
  D=M
  @FILLW
  D;JEQ
  @WAIT
  0;JMP
(FILLW)
  @i
  M=0
(LOOP2)
  @i
  D=M
  @pixels
  D=D-M
  @REC
  D;JGT
  @i
  D=M
  @SCREEN
  A=A+D
  M=0
  @i
  M=M+1
  @LOOP2
  0;JMP