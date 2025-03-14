    //check divisor not 0
    @1
    D=M 
    @flag
    D;JEQ   
    
    
    //Check same sign
    @0
    D=M
    @negR0
    D;JLT
    @1
    D=M

    @0
    D=M 
    @10
    M=D
    @1
    @1
    D=M 
    @11
    M=D

    @flag
    D;JLT
    @quotient
    0;JMP

(negR0)
    @1
    D=M
    @flag
    D;JGT

    @0   //making R0 values positive
    D=M 
    @10
    D=!D
    M=D+1

    @1   //making R1 values positive
    D=M 
    @11
    D=!D
    M=D+1

    @9   //setting flag for negatives so the end remainder can be negated
    M=1

    @quotient
    0;JMP

(quotient)
    @10   //If R1 > R0 go to remainder
    D=M
    @11
    D=D-M
    @remainder
    D;JLT

    @10
    D=M
    @6   //Using R6 to store the reminants of R0
    M=D

    @7   //initialising to 0
    M=0

    (quotientLoop)
        @7   //Using R7 to count amount of R1s removed - adds 1 to the multiple counter
        D=M+1
        M=D

        @6   //Removes 1 * R1 from reminants of R0
        D=M
        @11
        D=D-M
        @6
        M=D

        @6   //Checks if R6 > R1
        D=M
        @11
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
    @8   //initialising to 0
    M=0
    
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
    @quotient
    0;JGT



(END)   //Puts each value in it's correct register and ends the program
    @9   //Returns remainder to negative if triggered
    D=M
    @END2
    D;JEQ
    @8   
    D=!M 
    D=D+1
    M=D 

(END2)

    @7   //Puts the count of R1s removed into R2
    D=M 
    @2
    M=D

    @8   //Puts the remainder count into R3
    D=M 
    @3
    M=D
