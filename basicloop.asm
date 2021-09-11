;calculates 4!=4*3*2*1=24
addi x5, x0, 4
addi x6, x0, 1
loop: mul x6, x6, x5
addi x5, x5, -1
ebreak x0, x0, 0
blt x0, x5, loop