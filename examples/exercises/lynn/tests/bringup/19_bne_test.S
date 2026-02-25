// bne test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_bne_test
.extern fail

    .section .text.init
    .globl bne_test
    .type  bne_test, @function

bne_test:
    test1:
        li   t0, 763
        li   t1, 352
        bne  t0, t1, test2
        j Fail_Bne_1

    test2:
        li   t0, 71
        li   t1, -656
        bne  t0, t1, test3
        j Fail_Bne_2

    test3:
        li   t0, -646
        li   t1, -770
        bne  t0, t1, test4
        j Fail_Bne_3

    test4:
        li   t0, 751
        li   t1, -761
        bne  t0, t1, test5
        j Fail_Bne_4

    test5:
        li   t0, 406
        li   t1, 723
        bne  t0, t1, test6
        j Fail_Bne_5

    test6:
        li   t0, -550
        li   t1, -744
        bne  t0, t1, test7
        j Fail_Bne_6

    test7:
        li   t0, 372
        li   t1, -145
        bne  t0, t1, test8
        j Fail_Bne_7

    test8:
        li   t0, -100
        li   t1, 318
        bne  t0, t1, test9
        j Fail_Bne_8

    test9:
        li   t0, -629
        li   t1, 462
        bne  t0, t1, test10
        j Fail_Bne_9

    test10:
        li   t0, 582
        li   t1, 622
        bne  t0, t1, pass
        j Fail_Bne_10

    pass:
        j return_bne_test

Fail_Bne_1:
    li   gp, 1901
    j    fail

Fail_Bne_2:
    li   gp, 1902
    j    fail

Fail_Bne_3:
    li   gp, 1903
    j    fail

Fail_Bne_4:
    li   gp, 1904
    j    fail

Fail_Bne_5:
    li   gp, 1905
    j    fail

Fail_Bne_6:
    li   gp, 1906
    j    fail

Fail_Bne_7:
    li   gp, 1907
    j    fail

Fail_Bne_8:
    li   gp, 1908
    j    fail

Fail_Bne_9:
    li   gp, 1909
    j    fail

Fail_Bne_10:
    li   gp, 1910
    j    fail
