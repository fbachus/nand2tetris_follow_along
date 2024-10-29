// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

    //@R0
    //M=0
    //@RESET
    //0;JMP

(MAINLOOP)
    @R0
    D=M
    @MODEOFF
    D;JEQ

    (MODEON)
    @KBD
    D=M
    @SWITCH
    D;JEQ
    @PIXELCHANGE
    0;JMP

    (MODEOFF)
    @KBD
    D=M
    @SWITCH
    D;JGT

    (PIXELCHANGE)

    @R0
    D=M

    @PIXEL //Current Pixel
    M=M+1 // Increment pixel variable
    A=M-1 // go to pixel pointer (but not the next iteration yet)
    M=D // set pixel to mode value
    D=A // get pixel address


    @KBD
    D=A-D // if pixel address reaches KBD, we have reached the end of RAM
    D=D-1
    @RESET
    D;JEQ

    @MAINLOOP
    0;JMP

(SWITCH)
    @R0
    M=!M
    @RESET
    0;JMP

(RESET)
    @SCREEN
    D=A
    @PIXEL  // reset to first pixel of screen
    M=D
    @MAINLOOP
    0;JMP
