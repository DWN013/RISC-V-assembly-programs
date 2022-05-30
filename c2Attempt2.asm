#Alexander Ukhin, Section A, ATTEMPT 2
# tail recursive version of the sum of n numbers procedure

str1: 	DC "Entr +n:"
	ld x5, str1(x0)			// Save string characters into str1 -> String str1 = "Enter n:"

	ecall x6, x5, 5 			// Ask user for an integer input
	addi x7, x6, 0			// copy value user has entered into register x7
	addi x5, x0, 1			// Set register x5 to be 1
	jal x1, checker

checker: 
	beq x6, x0, ret0			// branch to return 0 if x6 == 0
	bge x6, x5, retN			// branch to return N if x6 >= 1 (x5)

retN:
	addi x6, x6, -1
	add x7, x7, x6
	jalr x0, 0(x1)
ret0:
	ecall x0, x7, 0