// lhu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_lhu_test
.extern fail

    .section .text.init
    .globl lhu_test
    .type  lhu_test, @function

lhu_test:
test1:
    addi sp, sp, -4
    li   t0, 1736
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test2
    j Fail_Lhu_1

test2:
    addi sp, sp, -4
    li   t0, 1523
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test3
    j Fail_Lhu_2

test3:
    addi sp, sp, -4
    li   t0, -149
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test4
    j Fail_Lhu_3

test4:
    addi sp, sp, -4
    li   t0, -487
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test5
    j Fail_Lhu_4

test5:
    addi sp, sp, -4
    li   t0, -263
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test6
    j Fail_Lhu_5

test6:
    addi sp, sp, -4
    li   t0, 295
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test7
    j Fail_Lhu_6

test7:
    addi sp, sp, -4
    li   t0, 1675
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test8
    j Fail_Lhu_7

test8:
    addi sp, sp, -4
    li   t0, 976
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test9
    j Fail_Lhu_8

test9:
    addi sp, sp, -4
    li   t0, -1943
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test10
    j Fail_Lhu_9

test10:
    addi sp, sp, -4
    li   t0, -870
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 16
    srl  t0, t0, 16
    lhu t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, pass
    j Fail_Lhu_10

pass:
        j return_lhu_test

Fail_Lhu_1:
    li   gp, 1601
    j    fail

Fail_Lhu_2:
    li   gp, 1602
    j    fail

Fail_Lhu_3:
    li   gp, 1603
    j    fail

Fail_Lhu_4:
    li   gp, 1604
    j    fail

Fail_Lhu_5:
    li   gp, 1605
    j    fail

Fail_Lhu_6:
    li   gp, 1606
    j    fail

Fail_Lhu_7:
    li   gp, 1607
    j    fail

Fail_Lhu_8:
    li   gp, 1608
    j    fail

Fail_Lhu_9:
    li   gp, 1609
    j    fail

Fail_Lhu_10:
    li   gp, 1610
    j    fail
