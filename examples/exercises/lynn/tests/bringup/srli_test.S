// srli test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_srli_test
.extern fail

    .section .text.init
    .globl srli_test
    .type  srli_test, @function

srli_test:
    test1:
        li   t0, 1601
        srli t2, t0, 4
        li   t3, 100
        beq  t2, t3, test2
        j Fail_Srli_1

    test2:
        li   t0, 3466
        srli t2, t0, 7
        li   t3, 27
        beq  t2, t3, test3
        j Fail_Srli_2

    test3:
        li   t0, 3831
        srli t2, t0, 8
        li   t3, 14
        beq  t2, t3, test4
        j Fail_Srli_3

    test4:
        li   t0, 633
        srli t2, t0, 1
        li   t3, 316
        beq  t2, t3, test5
        j Fail_Srli_4

    test5:
        li   t0, 3497
        srli t2, t0, 9
        li   t3, 6
        beq  t2, t3, test6
        j Fail_Srli_5

    test6:
        li   t0, 3492
        srli t2, t0, 9
        li   t3, 6
        beq  t2, t3, test7
        j Fail_Srli_6

    test7:
        li   t0, 2791
        srli t2, t0, 8
        li   t3, 10
        beq  t2, t3, test8
        j Fail_Srli_7

    test8:
        li   t0, 1997
        srli t2, t0, 4
        li   t3, 124
        beq  t2, t3, test9
        j Fail_Srli_8

    test9:
        li   t0, 323
        srli t2, t0, 8
        li   t3, 1
        beq  t2, t3, test10
        j Fail_Srli_9

    test10:
        li   t0, 3587
        srli t2, t0, 1
        li   t3, 1793
        beq  t2, t3, pass
        j Fail_Srli_10

    pass:
        j return_srli_test

Fail_Srli_1:
    li   gp, 801
    j    fail

Fail_Srli_2:
    li   gp, 802
    j    fail

Fail_Srli_3:
    li   gp, 803
    j    fail

Fail_Srli_4:
    li   gp, 804
    j    fail

Fail_Srli_5:
    li   gp, 805
    j    fail

Fail_Srli_6:
    li   gp, 806
    j    fail

Fail_Srli_7:
    li   gp, 807
    j    fail

Fail_Srli_8:
    li   gp, 808
    j    fail

Fail_Srli_9:
    li   gp, 809
    j    fail

Fail_Srli_10:
    li   gp, 810
    j    fail
