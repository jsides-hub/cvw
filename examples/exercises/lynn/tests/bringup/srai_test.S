// srai test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_srai_test
.extern fail

    .section .text.init
    .globl srai_test
    .type  srai_test, @function

srai_test:
test1:
    li   t0, -250
    srai t2, t0, 5
    li   t3, -8
    beq  t2, t3, test2
    j Fail_Srai_1

test2:
    li   t0, 34
    srai t2, t0, 5
    li   t3, 1
    beq  t2, t3, test3
    j Fail_Srai_2

test3:
    li   t0, 179
    srai t2, t0, 1
    li   t3, 89
    beq  t2, t3, test4
    j Fail_Srai_3

test4:
    li   t0, 1810
    srai t2, t0, 5
    li   t3, 56
    beq  t2, t3, test5
    j Fail_Srai_4

test5:
    li   t0, 950
    srai t2, t0, 3
    li   t3, 118
    beq  t2, t3, test6
    j Fail_Srai_5

test6:
    li   t0, 593
    srai t2, t0, 1
    li   t3, 296
    beq  t2, t3, test7
    j Fail_Srai_6

test7:
    li   t0, 1499
    srai t2, t0, 4
    li   t3, 93
    beq  t2, t3, test8
    j Fail_Srai_7

test8:
    li   t0, 129
    srai t2, t0, 5
    li   t3, 4
    beq  t2, t3, test9
    j Fail_Srai_8

test9:
    li   t0, -919
    srai t2, t0, 2
    li   t3, -230
    beq  t2, t3, test10
    j Fail_Srai_9

test10:
    li   t0, -1085
    srai t2, t0, 4
    li   t3, -68
    beq  t2, t3, pass
    j Fail_Srai_10

    pass:
        j return_srai_test

Fail_Srai_1:
    li   gp, 1001
    j    fail

Fail_Srai_2:
    li   gp, 1002
    j    fail

Fail_Srai_3:
    li   gp, 1003
    j    fail

Fail_Srai_4:
    li   gp, 1004
    j    fail

Fail_Srai_5:
    li   gp, 1005
    j    fail

Fail_Srai_6:
    li   gp, 1006
    j    fail

Fail_Srai_7:
    li   gp, 1007
    j    fail

Fail_Srai_8:
    li   gp, 1008
    j    fail

Fail_Srai_9:
    li   gp, 1009
    j    fail

Fail_Srai_10:
    li   gp, 1010
    j    fail
