#Alexander Ukhin, Section A, September 30th 2021
# tail recursive version of the sum of n numbers procedure

ecall x6, x0, 5 //int input();
addi x9, x0, 6
		
		//1^2 + 2^2 +3^3 ... n^2 = n(n+1)(2n+1)/6
addi x1, x6, 1  // n+1
mul x2, x6, x1  // n(n+1)
slli x3, x6, 1   // 2n
addi x3, x3, 1  // 2n+1
mul x4, x2, x3  // n(n+1)(2n+1)
div x5, x4, x9   // n(n+1)(2n+1)/6

ecall x0, x5, 0   // outputs result of calculation print(result)