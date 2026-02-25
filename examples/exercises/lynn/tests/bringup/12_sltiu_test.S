// sltiu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sltiu_test
.extern fail

    .section .text.init
    .globl sltiu_test
    .type  sltiu_test, @function

sltiu_test:
test1:
    li   t0, 155
    sltiu t2, t0, 942
    li   t3, 1
    beq  t2, t3, test2
    j Fail_Sltiu_1

test2:
    li   t0, 81
    sltiu t2, t0, 626
    li   t3, 1
    beq  t2, t3, test3
    j Fail_Sltiu_2

test3:
    li   t0, 1344
    sltiu t2, t0, 1932
    li   t3, 1
    beq  t2, t3, test4
    j Fail_Sltiu_3

test4:
    li   t0, 1199
    sltiu t2, t0, 512
    li   t3, 0
    beq  t2, t3, test5
    j Fail_Sltiu_4

test5:
    li   t0, 1468
    sltiu t2, t0, 436
    li   t3, 0
    beq  t2, t3, test6
    j Fail_Sltiu_5

test6:
    li   t0, 1369
    sltiu t2, t0, 816
    li   t3, 0
    beq  t2, t3, test7
    j Fail_Sltiu_6

test7:
    li   t0, 361
    sltiu t2, t0, 1346
    li   t3, 1
    beq  t2, t3, test8
    j Fail_Sltiu_7

test8:
    li   t0, 428
    sltiu t2, t0, 569
    li   t3, 1
    beq  t2, t3, test9
    j Fail_Sltiu_8

test9:
    li   t0, 659
    sltiu t2, t0, 1798
    li   t3, 1
    beq  t2, t3, test10
    j Fail_Sltiu_9

test10:
    li   t0, 505
    sltiu t2, t0, 171
    li   t3, 0
    beq  t2, t3, pass
    j Fail_Sltiu_10

    pass:
        j return_sltiu_test

Fail_Sltiu_1:
    li   gp, 1201
    j    fail

Fail_Sltiu_2:
    li   gp, 1202
    j    fail

Fail_Sltiu_3:
    li   gp, 1203
    j    fail

Fail_Sltiu_4:
    li   gp, 1204
    j    fail

Fail_Sltiu_5:
    li   gp, 1205
    j    fail

Fail_Sltiu_6:
    li   gp, 1206
    j    fail

Fail_Sltiu_7:
    li   gp, 1207
    j    fail

Fail_Sltiu_8:
    li   gp, 1208
    j    fail

Fail_Sltiu_9:
    li   gp, 1209
    j    fail

Fail_Sltiu_10:
    li   gp, 1210
    j    fail
