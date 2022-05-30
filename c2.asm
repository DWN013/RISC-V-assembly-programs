#Alexander Ukhin, Section A, September 30th 2021
# tail recursive version of the sum of n numbers procedure

addi x1, x0, 2  // starting number n = ? (also functions as counter)
		// INPUT SHOULD GO INTO imm (rd,rs1,imm) [where the 2 is located]

add x2, x0, x1 // copies previous register


addi x4, x0, 1 // register used to subtract - 1

loop:   
	beq x2, x0, end1  //if (n == 0) return 0
	beq x1, x0, end2 // if our counter goes down
	sub x1, x1, x4		 //subtract (n-1)
	add x3, x1, x2	  //n + (n-1)
	beq x1, x0, loop


end2: add x5, x3, x0

end1: ecall x0, x5, 0   // outputs result of calculation print(result)