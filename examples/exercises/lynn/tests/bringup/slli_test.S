// slli test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_slli_test
.extern fail

    .section .text.init
    .globl slli_test
    .type  slli_test, @function

slli_test:
    test1:
        li   t0, 33
        slli t2, t0, 3
        li   t3, 264
        beq  t2, t3, test2
        j Fail_Slli_1

    test2:
        li   t0, 31
        slli t2, t0, 3
        li   t3, 248
        beq  t2, t3, test3
        j Fail_Slli_2

    test3:
        li   t0, 57
        slli t2, t0, 3
        li   t3, 456
        beq  t2, t3, test4
        j Fail_Slli_3

    test4:
        li   t0, 29
        slli t2, t0, 2
        li   t3, 116
        beq  t2, t3, test5
        j Fail_Slli_4

    test5:
        li   t0, 12
        slli t2, t0, 4
        li   t3, 192
        beq  t2, t3, test6
        j Fail_Slli_5

    test6:
        li   t0, 9
        slli t2, t0, 2
        li   t3, 36
        beq  t2, t3, test7
        j Fail_Slli_6

    test7:
        li   t0, 34
        slli t2, t0, 3
        li   t3, 272
        beq  t2, t3, test8
        j Fail_Slli_7

    test8:
        li   t0, 5
        slli t2, t0, 1
        li   t3, 10
        beq  t2, t3, test9
        j Fail_Slli_8

    test9:
        li   t0, 8
        slli t2, t0, 5
        li   t3, 256
        beq  t2, t3, test10
        j Fail_Slli_9

    test10:
        li   t0, 2
        slli t2, t0, 4
        li   t3, 32
        beq  t2, t3, pass
        j Fail_Slli_10

    pass:
        j return_slli_test

Fail_Slli_1:
    li   gp, 601
    j    fail

Fail_Slli_2:
    li   gp, 602
    j    fail

Fail_Slli_3:
    li   gp, 603
    j    fail

Fail_Slli_4:
    li   gp, 604
    j    fail

Fail_Slli_5:
    li   gp, 605
    j    fail

Fail_Slli_6:
    li   gp, 606
    j    fail

Fail_Slli_7:
    li   gp, 607
    j    fail

Fail_Slli_8:
    li   gp, 608
    j    fail

Fail_Slli_9:
    li   gp, 609
    j    fail

Fail_Slli_10:
    li   gp, 610
    j    fail
