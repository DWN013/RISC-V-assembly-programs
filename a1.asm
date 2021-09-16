#Alexander Ukhin, Section A, September 16th 2021, 
#Program a1; to calculate (1024-512)-(128+ 64) and store the result in x5

addi x1, x0, 1024  //ld 1024 into register x1
addi x2, x1, -512  //add -512 and register x1 which contains 1024 to register x2 to get result 512
addi x3, x0, 128   //ld 128 into register x3
addi x4, x3, 64    //add 64 and register x3 which contains 128 to register x4 to get result 192
sub x5, x2, x4     //subtract register x2 (512) from register x4 (192) to get result 320 in register x5