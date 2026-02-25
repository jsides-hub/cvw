// sra test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sra_test
.extern fail

    .section .text.init
    .globl sra_test
    .type  sra_test, @function

sra_test:
    test1:
        li   t0, 1109
        li   t1, 5
        sra t2, t0, t1
        li   t3, 34
        beq  t2, t3, test2
        j Fail_Sra_1

    test2:
        li   t0, 1842
        li   t1, 1
        sra t2, t0, t1
        li   t3, 921
        beq  t2, t3, test3
        j Fail_Sra_2

    test3:
        li   t0, 1493
        li   t1, 1
        sra t2, t0, t1
        li   t3, 746
        beq  t2, t3, test4
        j Fail_Sra_3

    test4:
        li   t0, 1582
        li   t1, 1
        sra t2, t0, t1
        li   t3, 791
        beq  t2, t3, test5
        j Fail_Sra_4

    test5:
        li   t0, 1433
        li   t1, 3
        sra t2, t0, t1
        li   t3, 179
        beq  t2, t3, test6
        j Fail_Sra_5

    test6:
        li   t0, 1276
        li   t1, 2
        sra t2, t0, t1
        li   t3, 319
        beq  t2, t3, test7
        j Fail_Sra_6

    test7:
        li   t0, 544
        li   t1, 4
        sra t2, t0, t1
        li   t3, 34
        beq  t2, t3, test8
        j Fail_Sra_7

    test8:
        li   t0, 925
        li   t1, 3
        sra t2, t0, t1
        li   t3, 115
        beq  t2, t3, test9
        j Fail_Sra_8

    test9:
        li   t0, 289
        li   t1, 0
        sra t2, t0, t1
        li   t3, 289
        beq  t2, t3, test10
        j Fail_Sra_9

    test10:
        li   t0, 1378
        li   t1, 4
        sra t2, t0, t1
        li   t3, 86
        beq  t2, t3, pass
        j Fail_Sra_10

    pass:
        j return_sra_test

    Fail_Sra_1:
        li   gp, 901
        j    fail

    Fail_Sra_2:
        li   gp, 902
        j    fail

    Fail_Sra_3:
        li   gp, 903
        j    fail

    Fail_Sra_4:
        li   gp, 904
        j    fail

    Fail_Sra_5:
        li   gp, 905
        j    fail

    Fail_Sra_6:
        li   gp, 906
        j    fail

    Fail_Sra_7:
        li   gp, 907
        j    fail

    Fail_Sra_8:
        li   gp, 908
        j    fail

    Fail_Sra_9:
        li   gp, 909
        j    fail

    Fail_Sra_10:
        li   gp, 910
        j    fail
