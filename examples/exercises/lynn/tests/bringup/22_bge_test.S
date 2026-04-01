// bge test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_bge_test
.extern fail

    .section .text.init
    .globl bge_test
    .type  bge_test, @function

bge_test:
    test1:
        li   t0, 628
        li   t1, 266
        bge  t0, t1, test2
        j Fail_Bge_1

    test2:
        li   t0, 129
        li   t1, 87
        bge  t0, t1, test3
        j Fail_Bge_2

    test3:
        li   t0, 767
        li   t1, 169
        bge  t0, t1, test4
        j Fail_Bge_3

    test4:
        li   t0, 110
        li   t1, -338
        bge  t0, t1, test5
        j Fail_Bge_4

    test5:
        li   t0, 593
        li   t1, 495
        bge  t0, t1, test6
        j Fail_Bge_5

    test6:
        li   t0, 273
        li   t1, -529
        bge  t0, t1, test7
        j Fail_Bge_6

    test7:
        li   t0, 85
        li   t1, -357
        bge  t0, t1, test8
        j Fail_Bge_7

    test8:
        li   t0, 889
        li   t1, 843
        bge  t0, t1, test9
        j Fail_Bge_8

    test9:
        li   t0, -274
        li   t1, -762
        bge  t0, t1, test10
        j Fail_Bge_9

    test10:
        li   t0, -367
        li   t1, -533
        bge  t0, t1, pass
        j Fail_Bge_10

    pass:
        j return_bge_test

Fail_Bge_1:
    li   gp, 2201
    j    fail

Fail_Bge_2:
    li   gp, 2202
    j    fail

Fail_Bge_3:
    li   gp, 2203
    j    fail

Fail_Bge_4:
    li   gp, 2204
    j    fail

Fail_Bge_5:
    li   gp, 2205
    j    fail

Fail_Bge_6:
    li   gp, 2206
    j    fail

Fail_Bge_7:
    li   gp, 2207
    j    fail

Fail_Bge_8:
    li   gp, 2208
    j    fail

Fail_Bge_9:
    li   gp, 2209
    j    fail

Fail_Bge_10:
    li   gp, 2210
    j    fail
