// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

// reference :
// the register holding the keyboard input is 24,576 on the RAM map (KBD)
// the registers handling the screen are 16384-24575 on the RAM map (SCREEN)

(INIT)

    @SCREEN
    D = A   // point to screen registers
    @addr
    M = D

(INPUT)

    @KBD
    D = M

    @BLOOP
    D;JNE
    @WLOOP
    D;JEQ

(BLOOP)

    // RAM[addr] = value
    @value
    D = M
    @addr
    A = M
    M = D

    // set all bits in register to 1s
    M = -1

    // goto next address
    @addr
    MD = M + 1

    // if still on screen goto BLOOP
    @24575
    D = D - A
    @INPUT
    D;JLT

(WLOOP)

    // RAM[addr] = value
    @value
    D = M
    @addr
    A = M
    M = D

    // set all bits in register to 0s
    M = 0

    // goto next address
    @addr
    MD = M + 1

    // if still on screen goto WLOOP
    @24575
    D = D - A
    @INPUT
    D;JLT

    @HALT
(HALT)
    @INIT
    0;JMP
