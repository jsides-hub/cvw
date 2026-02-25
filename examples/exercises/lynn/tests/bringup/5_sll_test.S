// sll test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sll_test
.extern fail

    .section .text.init
    .globl sll_test
    .type  sll_test, @function

sll_test:
    test1:
        li   t0, 38
        li   t1, 4
        sll t2, t0, t1
        li   t3, 608
        beq  t2, t3, test2
        j Fail_Sll_1

    test2:
        li   t0, 57
        li   t1, 3
        sll t2, t0, t1
        li   t3, 456
        beq  t2, t3, test3
        j Fail_Sll_2

    test3:
        li   t0, 6
        li   t1, 4
        sll t2, t0, t1
        li   t3, 96
        beq  t2, t3, test4
        j Fail_Sll_3

    test4:
        li   t0, 36
        li   t1, 3
        sll t2, t0, t1
        li   t3, 288
        beq  t2, t3, test5
        j Fail_Sll_4

    test5:
        li   t0, 49
        li   t1, 4
        sll t2, t0, t1
        li   t3, 784
        beq  t2, t3, test6
        j Fail_Sll_5

    test6:
        li   t0, 31
        li   t1, 2
        sll t2, t0, t1
        li   t3, 124
        beq  t2, t3, test7
        j Fail_Sll_6

    test7:
        li   t0, 49
        li   t1, 5
        sll t2, t0, t1
        li   t3, 1568
        beq  t2, t3, test8
        j Fail_Sll_7

    test8:
        li   t0, 12
        li   t1, 1
        sll t2, t0, t1
        li   t3, 24
        beq  t2, t3, test9
        j Fail_Sll_8

    test9:
        li   t0, 48
        li   t1, 2
        sll t2, t0, t1
        li   t3, 192
        beq  t2, t3, test10
        j Fail_Sll_9

    test10:
        li   t0, 60
        li   t1, 3
        sll t2, t0, t1
        li   t3, 480
        beq  t2, t3, pass
        j Fail_Sll_10

    pass:
        j return_sll_test

Fail_Sll_1:
    li   gp, 501
    j    fail

Fail_Sll_2:
    li   gp, 502
    j    fail

Fail_Sll_3:
    li   gp, 503
    j    fail

Fail_Sll_4:
    li   gp, 504
    j    fail

Fail_Sll_5:
    li   gp, 505
    j    fail

Fail_Sll_6:
    li   gp, 506
    j    fail

Fail_Sll_7:
    li   gp, 507
    j    fail

Fail_Sll_8:
    li   gp, 508
    j    fail

Fail_Sll_9:
    li   gp, 509
    j    fail

Fail_Sll_10:
    li   gp, 510
    j    fail
