(sizeOfArrayR3)   //Find the number of elements in the array - store in R3
    @1
    D=M 
    @3
    M=D

(startingAddressR4)   //Find the starting address - store in R4
    @0
    D=M 
    @4
    M=D

(initializeR2)   //Initializes R2 to 0
    @2
    M=0

(loop)   //Loop using R3 as an element counter, R4 as an address counter and accumulating a running total - store running total in R2
    @4
    A=M   //Sets pointer to address counter

    D=M   //adds value to the running sum
    @2
    M=M+D

    @4   //Adds 1 to the address counter
    D=M+1
    M=D

    @3   //Removes 1 from the element counter
    D=M-1
    M=D

    @loop   //If the counter is greater than 0 jump to start of loop
    D;JGT

(END)
