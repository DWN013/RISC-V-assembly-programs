#Alexander Ukhin, Section A, October 10th, 2021
# This program takes input a positive integer, finds all divisors, and outputs the result prime/not prime
#precondition positive integer

P: 	DC "prime"
notP: 	DC "NotPrime"
str1: 	DC "Entr +n:"

	ld x6, P(x0)
	ld x7, notP(x0)
	ld x5, str1(x0)				// Save string characters into strings and output when needed


	addi x1, x0, 1				// set a register to equal to 1 to use as a comparison
	addi x8, x0, 2				// have a counter variable to count up


	ecall x2, x5, 5 				// get input and store an integer in x2
	addi x3, x2, 0				// copy value stored in x2 to x3, x3 = x2


#Initial Checks for non prime number
	blt x2, x1, notPrime				// checks if value is less than 1 (accounts for negative case)
	beq x2, x1, notPrime				// checks if value is equal to 1 which is not prime	
	beq x2, x0, notPrime				// checks if input is equal to 0 which is not prime
	
	jal x10, loop1				// start of recursive function

loop1:	
	beq x8, x2, prime
	rem x11, x3, x8				// stores the remainder of x3/x7 in x11 (copyOfInput/counter)
	beq x0, x11, notPrime				// go to not prime if remainder is 0
	add x8, x8, x1				// adds 1 to counter
	jalr x0, 0(x10)
	

prime:	
	ecall x0, x6, 3				// prints prime and breaks
	ebreak x0, x0, 0

notPrime: 
	ecall x0, x7, 3				// prints not prime and breaks
	ebreak x0, x0, 0