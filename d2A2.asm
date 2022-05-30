#Alexander Ukhin, Section A, October 10th, 2021
# This program approximates 1/(1-x) (the geometric series)
# by sum of the series: 1 + x + x^2 . . . + x^n

str1: 	DC "Entr +n between .5 and 1:"

	addi x5, x0, str1				// Save string characters into strings and output when needed


	addi x1, x0, 1				// set a register to equal to 1 to use in computation
	addi x2, x0, 1
	addi x10, x0, 0				// have a counter variable to count up for exponent

	ecall x0, x5, 4
	ecall x3, x5, 5 				// get input and store an integer in x3

loop1:					// loop for the geometric series
	
	ebreak x0, x0, 0