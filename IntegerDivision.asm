    //Check same sign
    @0
    D=M
    @negR0
    D;JLT
    @1
    D=M
    @flag
    D;JLT
    @quotient
    0;JMP

(negR0)
    @1
    D=M
    @flag
    D;JGT
    @quotient
    0;JMP

(quotient)
    @0   //If R1 > R0 go to remainder
    D=M
    @1
    D=D-M
    @remainder
    D;JLT

    @0
    D=M
    @6   //Using R6 to store the reminants of R0
    M=D

    (quotientLoop)
        @7   //Using R7 to count amount of R1s removed - adds 1 to the multiple counter
        D=M+1
        M=D

        @6   //Removes 1 * R1 from reminants of R0
        D=M
        @1
        D=D-M
        @6
        M=D

        @6   //Checks if R6 > R1
        D=M
        @1
        D=D-M

        @remainder  //If D<0 fo to remainder
        D;JLT

        @6   //If D>0 stay in loop
        D=M
        @quotientLoop
        D;JGT

(remainder)
    @6   //If D=0 go to end
    D=M
    @END
    D;JEQ
    
    (remainderLoop)
        @6   //Removes 1 from reminants of R0
        D=M-1
        M=D

        @8   //Using R8 to count subtractions
        D=M+1
        M=D

        @6   //If D=0 go to end
        D=M
        @END
        D;JEQ

        @remainderLoop
        0;JMP


(flag)   //Sets flag then goes to end
    @1
    D=A
    @4 
    M=D
    @END
    0;JGT


(END)   //Puts each value in it's correct register and ends the program
    @7   //Puts the count of R1s removed into R2
    D=M 
    @2
    M=D

    @8   //Puts the remainder count into R3
    D=M 
    @3
    M=D
