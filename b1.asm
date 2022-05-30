#Alexander Ukhin, Section A, September 23th 2021
#Program stores value 34567 in register x6 and value 23456 in register x7 the subtracts the two
#and stores result in x7


lui x6, 8 			// 4096*8 = 32768
addi x6, x6, 1799

lui x7, 5 			// 5*4096 = 20480
addi x7, x7, 2020
addi x7, x7, 956			// 22500 + 956 = 23456

sub x5, x6, x7			// 34567 - 23456 = 11111