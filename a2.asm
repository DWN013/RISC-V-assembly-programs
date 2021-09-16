#Alexander Ukhin, Section A, September 16th 2021, 
#Program a2; to calculate (400/8-213*2)/2 and store the result in x5

addi x1, x0, 400   //ld 400 into register x1 (int x = 400)
srli x2, x1, 3     //divide register x2 (400) by value 8
addi x3, x0, 213   //ld 213 into register x3 (int z = 213)
slli x4, x3, 1     //multiply register x3 (213) by value 2
sub x5, x2, x4    //subtract register x2 from x4 and store it in x5
srai x5, x5, 1     //divide register x5 (-376) by value 2 and store result (-188) in x5