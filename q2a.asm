#Alexander Ukhin, Section A, October 21st, 2021
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
addi x3, x0, 10     //set a integer 10 for calculation purposes
addi x1, x0, 1		    //set x1 to = 1
addi x20, x0, 1		   //finds how many places the numbers are

//ask user for input
ecall x0, x7, 4		   //prints out input prompt
ecall x2, x0, 5		   //gets integer input from user
beq x2, x0, notLB
blt x2, x3, isLB

jal x6, loop        //start looping to find the numbers used
loop:	
	beq x5, x2, checkerAmnt		//jumps to checker if input is equal to the counter
	add x5, x5, x1			// adds 1 to counter
	add x13, x13, x1			// adds 1 to ones pos.
	beq x3, x13, addToTens
	jalr x0, 0(x6) 			//jumps back to start of loop

addToTens:
	addi x13, x0, 0
	add x12, x12, x1			// adds 1 to tens pos.
	beq x3, x12, addToHund
	addi x20, x0, 2
	beq x0, x0, loop

addToHund:
	addi x12, x0, 0
	add x11, x11, x1			// adds 1 to hundreds pos.
	beq x3, x12, addToThou
	addi x20, x0, 3
	beq x0, x0, loop

addToThou:
	addi x11, x0, 0
	add x10, x10, x1			// adds 1 to thousands pos.
	addi x20, x0, 4
	beq x0, x0, loop

//checks the final results
addi x6, x0, 2
checkerAmnt:
	beq x20, x6, checker2  //branches to corresponding checker depending on the amount of places
	add x6, x6, x1
	beq x20, x6, checker3
	add x6, x6, x1
	beq x20, x6, checker4
	
//x10 = 1000, x11 = 100, x12 = 10, x13 = 1
checker2:
	beq x12, x13, notLB
	rem x6, x2, x13     //result remainder of the number in our ones divided by input
	bge x6, x1, notLB
	rem x6, x2, x12
	bge x6, x1, notLB
	beq x0, x0, isLB

checker3:
	beq x12, x13, notLB
	beq x12, x11, notLB
	beq x13, x11, notLB
	
	rem x6, x2, x13     //result remainder of the number in our ones divided by input
	bge x6, x1, notLB
	rem x6, x2, x12
	bge x6, x1, notLB
	rem x6, x2, x11
	bge x6, x1, notLB
	beq x0, x0, isLB
	

checker4:
	beq x12, x13, notLB
	beq x12, x11, notLB
	beq x12, x10, notLB
	beq x13, x11, notLB
	beq x13, x10, notLB
	beq x10, x11, notLB

	rem x6, x2, x13     //result remainder of the number in our ones divided by input
	bge x6, x1, notLB
	rem x6, x2, x12
	bge x6, x1, notLB
	rem x6, x2, x11
	bge x6, x1, notLB
	rem x6, x2, x10
	bge x6, x1, notLB
	beq x0, x0, isLB
	

notLB:
	ecall x0, x8, 4
	ebreak x0, x0, 0

isLB:
	ecall x0, x9, 4
	ebreak x0, x0, 0