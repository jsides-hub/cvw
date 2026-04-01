// bgeu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_bgeu_test
.extern fail

    .section .text.init
    .globl bgeu_test
    .type  bgeu_test, @function

bgeu_test:
    test1:
        li   t0, 2043
        li   t1, 2036
        bgeu  t0, t1, test2
        j Fail_Bgeu_1

    test2:
        li   t0, 1492
        li   t1, 1312
        bgeu  t0, t1, test3
        j Fail_Bgeu_2

    test3:
        li   t0, 1894
        li   t1, 380
        bgeu  t0, t1, test4
        j Fail_Bgeu_3

    test4:
        li   t0, 1911
        li   t1, 1567
        bgeu  t0, t1, test5
        j Fail_Bgeu_4

    test5:
        li   t0, 1845
        li   t1, 1768
        bgeu  t0, t1, test6
        j Fail_Bgeu_5

    test6:
        li   t0, 1794
        li   t1, 1720
        bgeu  t0, t1, test7
        j Fail_Bgeu_6

    test7:
        li   t0, 1720
        li   t1, 1617
        bgeu  t0, t1, test8
        j Fail_Bgeu_7

    test8:
        li   t0, 1887
        li   t1, 70
        bgeu  t0, t1, test9
        j Fail_Bgeu_8

    test9:
        li   t0, 604
        li   t1, 25
        bgeu  t0, t1, test10
        j Fail_Bgeu_9

    test10:
        li   t0, 1485
        li   t1, 1309
        bgeu  t0, t1, pass
        j Fail_Bgeu_10

    pass:
        j return_bgeu_test

Fail_Bgeu_1:
    li   gp, 2301
    j    fail

Fail_Bgeu_2:
    li   gp, 2302
    j    fail

Fail_Bgeu_3:
    li   gp, 2303
    j    fail

Fail_Bgeu_4:
    li   gp, 2304
    j    fail

Fail_Bgeu_5:
    li   gp, 2305
    j    fail

Fail_Bgeu_6:
    li   gp, 2306
    j    fail

Fail_Bgeu_7:
    li   gp, 2307
    j    fail

Fail_Bgeu_8:
    li   gp, 2308
    j    fail

Fail_Bgeu_9:
    li   gp, 2309
    j    fail

Fail_Bgeu_10:
    li   gp, 2310
    j    fail
