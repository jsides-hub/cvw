// sb test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sb_test
.extern fail

    .section .text.init
    .globl sb_test
    .type  sb_test, @function

sb_test:
test1:
    addi sp, sp, -4
    li   t0, 83
    lw t1, 4(sp)
    sb t0, 4(sp)
    lw t1, 4(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test2
    j Fail_Sb_1

test2:
    addi sp, sp, -4
    li   t0, 56
    sb t0, 5(sp)
    lw t1, 4(sp)
    sll  t1, t1, 16
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test3
    j Fail_Sb_2

test3:
    addi sp, sp, -4
    li   t0, 26
    sb t0, 6(sp)
    lw t1, 4(sp)
    sll  t1, t1, 8
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test4
    j Fail_Sb_3

test4:
    addi sp, sp, -4
    li   t0, 102
    sb t0, 7(sp)
    lw t1, 4(sp)
    srli  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test5
    j Fail_Sb_4

test5:
    addi sp, sp, -4
    li   t0, 461
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test6
    j Fail_Sb_5

test6:
    addi sp, sp, -4
    li   t0, -1913
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test7
    j Fail_Sb_6

test7:
    addi sp, sp, -4
    li   t0, -1120
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test8
    j Fail_Sb_7

test8:
    addi sp, sp, -4
    li   t0, 669
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test9
    j Fail_Sb_8

test9:
    addi sp, sp, -4
    li   t0, -673
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, test10
    j Fail_Sb_9

test10:
    addi sp, sp, -4
    li   t0, 1957
    sll  t0, t0, 24
    srl  t0, t0, 24
    sb t0, 0(sp)
    lw t1, 0(sp)
    sll  t1, t1, 24
    srl  t1, t1, 24
    addi sp, sp, 4
    beq  t0, t1, pass
    j Fail_Sb_10

pass:
        j return_sb_test

Fail_Sb_1:
    li   gp, 1701
    j    fail

Fail_Sb_2:
    li   gp, 1702
    j    fail

Fail_Sb_3:
    li   gp, 1703
    j    fail

Fail_Sb_4:
    li   gp, 1704
    j    fail

Fail_Sb_5:
    li   gp, 1705
    j    fail

Fail_Sb_6:
    li   gp, 1706
    j    fail

Fail_Sb_7:
    li   gp, 1707
    j    fail

Fail_Sb_8:
    li   gp, 1708
    j    fail

Fail_Sb_9:
    li   gp, 1709
    j    fail

Fail_Sb_10:
    li   gp, 1710
    j    fail
