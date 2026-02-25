// lh test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_lh_test
.extern fail

    .section .text.init
    .globl lh_test
    .type  lh_test, @function

lh_test:
test1:
    addi sp, sp, -4
    li   t0, -1042
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test2
    j Fail_Lh_1

test2:
    addi sp, sp, -4
    li   t0, 1455
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test3
    j Fail_Lh_2

test3:
    addi sp, sp, -4
    li   t0, -157
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test4
    j Fail_Lh_3

test4:
    addi sp, sp, -4
    li   t0, 1088
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test5
    j Fail_Lh_4

test5:
    addi sp, sp, -4
    li   t0, -1138
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test6
    j Fail_Lh_5

test6:
    addi sp, sp, -4
    li   t0, -640
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test7
    j Fail_Lh_6

test7:
    addi sp, sp, -4
    li   t0, -1381
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test8
    j Fail_Lh_7

test8:
    addi sp, sp, -4
    li   t0, 1521
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test9
    j Fail_Lh_8

test9:
    addi sp, sp, -4
    li   t0, 1159
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test10
    j Fail_Lh_9

test10:
    addi sp, sp, -4
    li   t0, 876
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    sra  t0, t0, 16
    lh t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, pass
    j Fail_Lh_10

pass:
        j return_lh_test

Fail_Lh_1:
    li   gp, 1501
    j    fail

Fail_Lh_2:
    li   gp, 1502
    j    fail

Fail_Lh_3:
    li   gp, 1503
    j    fail

Fail_Lh_4:
    li   gp, 1504
    j    fail

Fail_Lh_5:
    li   gp, 1505
    j    fail

Fail_Lh_6:
    li   gp, 1506
    j    fail

Fail_Lh_7:
    li   gp, 1507
    j    fail

Fail_Lh_8:
    li   gp, 1508
    j    fail

Fail_Lh_9:
    li   gp, 1509
    j    fail

Fail_Lh_10:
    li   gp, 1510
    j    fail
