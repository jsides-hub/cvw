// lbu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_lbu_test
.extern fail

    .section .text.init
    .globl lbu_test
    .type  lbu_test, @function

lbu_test:
test1:
    addi sp, sp, -4
    li   t0, 1328
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test2
    j Fail_Lbu_1

test2:
    addi sp, sp, -4
    li   t0, 844
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test3
    j Fail_Lbu_2

test3:
    addi sp, sp, -4
    li   t0, -673
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test4
    j Fail_Lbu_3

test4:
    addi sp, sp, -4
    li   t0, 1228
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test5
    j Fail_Lbu_4

test5:
    addi sp, sp, -4
    li   t0, -743
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test6
    j Fail_Lbu_5

test6:
    addi sp, sp, -4
    li   t0, 99
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test7
    j Fail_Lbu_6

test7:
    addi sp, sp, -4
    li   t0, 646
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test8
    j Fail_Lbu_7

test8:
    addi sp, sp, -4
    li   t0, 1168
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test9
    j Fail_Lbu_8

test9:
    addi sp, sp, -4
    li   t0, 1090
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test10
    j Fail_Lbu_9

test10:
    addi sp, sp, -4
    li   t0, -115
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    srl  t0, t0, 24
    lbu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, pass
    j Fail_Lbu_10

pass:
        j return_lbu_test

Fail_Lbu_1:
    li   gp, 1401
    j    fail

Fail_Lbu_2:
    li   gp, 1402
    j    fail

Fail_Lbu_3:
    li   gp, 1403
    j    fail

Fail_Lbu_4:
    li   gp, 1404
    j    fail

Fail_Lbu_5:
    li   gp, 1405
    j    fail

Fail_Lbu_6:
    li   gp, 1406
    j    fail

Fail_Lbu_7:
    li   gp, 1407
    j    fail

Fail_Lbu_8:
    li   gp, 1408
    j    fail

Fail_Lbu_9:
    li   gp, 1409
    j    fail

Fail_Lbu_10:
    li   gp, 1410
    j    fail
