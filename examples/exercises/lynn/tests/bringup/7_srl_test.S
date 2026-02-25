// srl test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_srl_test
.extern fail

    .section .text.init
    .globl srl_test
    .type  srl_test, @function

srl_test:
    test1:
        li   t0, 2025
        li   t1, 5
        srl t2, t0, t1
        li   t3, 63
        beq  t2, t3, test2
        j Fail_Srl_1

    test2:
        li   t0, 1213
        li   t1, 5
        srl t2, t0, t1
        li   t3, 37
        beq  t2, t3, test3
        j Fail_Srl_2

    test3:
        li   t0, 1744
        li   t1, 8
        srl t2, t0, t1
        li   t3, 6
        beq  t2, t3, test4
        j Fail_Srl_3

    test4:
        li   t0, 737
        li   t1, 8
        srl t2, t0, t1
        li   t3, 2
        beq  t2, t3, test5
        j Fail_Srl_4

    test5:
        li   t0, 452
        li   t1, 5
        srl t2, t0, t1
        li   t3, 14
        beq  t2, t3, test6
        j Fail_Srl_5

    test6:
        li   t0, 1643
        li   t1, 8
        srl t2, t0, t1
        li   t3, 6
        beq  t2, t3, test7
        j Fail_Srl_6

    test7:
        li   t0, 1745
        li   t1, 3
        srl t2, t0, t1
        li   t3, 218
        beq  t2, t3, test8
        j Fail_Srl_7

    test8:
        li   t0, 1393
        li   t1, 1
        srl t2, t0, t1
        li   t3, 696
        beq  t2, t3, test9
        j Fail_Srl_8

    test9:
        li   t0, 1341
        li   t1, 3
        srl t2, t0, t1
        li   t3, 167
        beq  t2, t3, test10
        j Fail_Srl_9

    test10:
        li   t0, 1163
        li   t1, 0
        srl t2, t0, t1
        li   t3, 1163
        beq  t2, t3, pass
        j Fail_Srl_10

    pass:
        j return_srl_test

Fail_Srl_1:
    li   gp, 701
    j    fail

Fail_Srl_2:
    li   gp, 702
    j    fail

Fail_Srl_3:
    li   gp, 703
    j    fail

Fail_Srl_4:
    li   gp, 704
    j    fail

Fail_Srl_5:
    li   gp, 705
    j    fail

Fail_Srl_6:
    li   gp, 706
    j    fail

Fail_Srl_7:
    li   gp, 707
    j    fail

Fail_Srl_8:
    li   gp, 708
    j    fail

Fail_Srl_9:
    li   gp, 709
    j    fail

Fail_Srl_10:
    li   gp, 710
    j    fail
