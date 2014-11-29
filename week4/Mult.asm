// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

(INIT)

  @R2
  M = 0   // we want to clear the result reg for answer

(LOOP)

  @R0
  D = M   // D hold the value of R0

  @R2
  M = M + D // add R3 to sum

  @R1
  M = M - 1 // decrement R2 for eventual 0
  D = M

  @LOOP
  D;JGT // exit loop if R1 == 0, otherwise goto (LOOP)

(INFINITE_LOOP)

  @INFINITE_LOOP
  0;JMP
