#Alexander Ukhin, Section A, October 21st, 2021
# This program queries the user with the prompt a cylinder volume V, 
# a real number, and prints the given string followed by the value computed with the given formula

str1: DC "Input a positive real number volume:\0"
str2: DC "The radius of the cylinder is:\0"
pi: DF 3.1415
ten: DF 10.0		  // this is a pre determined height for the cylinder

addi x8, x0, str1 //instantiate the string into a variable
addi x6, x0, str2 //instantiate the second string into a variable

fld f1, pi(x0)    //loads the value of pi into f1
fld f10, ten(x0)	 //loads the value of height into f10

// Stores: Volume in register f2, bottom portion of formula in f4, result in register f5

jal x7, loop
//checks if input is negative and asks for new input if it is
loop:	
	ecall x0, x8, 4		 //prints out input prompt
	ecall f2, x0, 6		 //gets float input from user
	fmv.x.d x5, f2		     //changes intput from float to integer for checking purposes
	bge x5, x0, continue
	jalr x0, 0(x7)
	
continue:
fmul.d f4, f1, f10 //pi * h (f4 = f1 * f10)
fdiv.d f5, f2, f4  // V/(pi * h)
fsqrt.d f5, f5

ecall x0, x6, 4
ecall x0, f5, 1