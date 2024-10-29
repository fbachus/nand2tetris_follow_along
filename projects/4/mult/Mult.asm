// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
    @2
    M=0
(MULT)
    @1: // R1 as loop counter
    D=M
    M=M-1   

    @END
    D;JEQ

    @0
    D=M
    @2
    M=M+D // R2 = R2+R0

    @MULT
    0;JMP
(END)
    @END
    0;JMP
