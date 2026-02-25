// sltu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sltu_test
.extern fail

    .section .text.init
    .globl sltu_test
    .type  sltu_test, @function

sltu_test:
    test1:
        li   t0, 3277
        li   t1, 2163
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test2
        j Fail_Sltu_1

    test2:
        li   t0, 1716
        li   t1, 575
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test3
        j Fail_Sltu_2

    test3:
        li   t0, 1762
        li   t1, 1918
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test4
        j Fail_Sltu_3

    test4:
        li   t0, 1010
        li   t1, 1998
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test5
        j Fail_Sltu_4

    test5:
        li   t0, 1006
        li   t1, 2338
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test6
        j Fail_Sltu_5

    test6:
        li   t0, 1437
        li   t1, 416
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test7
        j Fail_Sltu_6

    test7:
        li   t0, 494
        li   t1, 1724
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test8
        j Fail_Sltu_7

    test8:
        li   t0, 1799
        li   t1, 1206
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test9
        j Fail_Sltu_8

    test9:
        li   t0, 1642
        li   t1, 863
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test10
        j Fail_Sltu_9

    test10:
        li   t0, 485
        li   t1, 516
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, pass
        j Fail_Sltu_10

    pass:
        j return_sltu_test

Fail_Sltu_1:
    li   gp, 1101
    j    fail

Fail_Sltu_2:
    li   gp, 1102
    j    fail

Fail_Sltu_3:
    li   gp, 1103
    j    fail

Fail_Sltu_4:
    li   gp, 1104
    j    fail

Fail_Sltu_5:
    li   gp, 1105
    j    fail

Fail_Sltu_6:
    li   gp, 1106
    j    fail

Fail_Sltu_7:
    li   gp, 1107
    j    fail

Fail_Sltu_8:
    li   gp, 1108
    j    fail

Fail_Sltu_9:
    li   gp, 1109
    j    fail

Fail_Sltu_10:
    li   gp, 1110
    j    fail
