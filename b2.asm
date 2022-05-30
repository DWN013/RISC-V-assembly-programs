src:    DD    -2, 66, -4, 7, 1, 0  // int[] c = {-2, 66, -4, 7, 1, 0};
    add    x6, x0, x0              // int i = 0;
loop:    ld    x7, src(x6)        // int temp = c[i];
    beq    x7, x0, end            // if (temp = 0) break;
    bge    x7, x5, skip          // if (temp >= min);
    ld    x5, src(x6)            // else min = c[i];
skip:    addi    x6, x6, 8       // i++
    beq    x0, x0, loop         // while(1)
end:                            // exit program; min value saved in x5