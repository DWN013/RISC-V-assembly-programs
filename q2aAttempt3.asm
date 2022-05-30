#
# This program finds if the given number is a Lynch-Bell number

prompt: DC "Enter a positive integer number:\0"
not: DC " was NOT a LB number\0"
is: DC " IS a LB number\0"


//Register assignments:
// t0, t1 store intermediate results (nicknames for x5, x6)
// x7, x8, x9 all store strings for output
// x2 stores user input
// x1 stores the integer 1 for counting, x3 stores the integer 10
// x10, x11, x12, x13 stores four digits, each corresponding to the thousands, hundreds, tens, and ones respectively
// x20 counts how many digit places there are total

addi x7, x0, prompt //instantiate the prompt into a variable
addi x8, x0, not    //instantiate the second string into a variable
addi x9, x0, is     //instantiate the third string into a variable
addi x12, x0, 10     //set a integer 10 for calculation purposes

//ask user for input
ecall x0, x7, 4		   //prints out input prompt
ecall x5, x0, 5		   //gets integer input from user           input = n
add x15, x0, x5    //copies user integer input into regsister x15
beq x5, x0, notLB		 //basic check for if the number is 0


loop:	
	beq x5, x0, result		//jumps to result if input is equal to 0
	rem x13, x5, x12		    //finds the remainder of x2 / 10 and stores it in register x5
	beq x13, x0, divide
	rem x17, x15, x13	     //finds the remainder of x2 / x5 and stores it in register x6
	bne x17, x0, result  
	div x5, x5, x12		    // divide register x2 by 10
	beq x6, x0, loop 		 //jumps back to start of loop

divide:
	div x5, x5, x12 		   //divides x5 by 10
	beq x17, x0, loop		  //loop restarts if x6 == 0

result:
	beq x17, x0, isLB
	beq x0, x0, notLB

notLB:
	ecall x0, x8, 4
	ebreak x0, x0, 0

isLB:
	ecall x0, x9, 4
	ebreak x0, x0, 0