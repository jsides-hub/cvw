// lb test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_lb_test
.extern fail

    .section .text.init
    .globl lb_test
    .type  lb_test, @function

lb_test:
test1:
    addi sp, sp, -4
    li   t0, -1847
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test2
    j Fail_Lb_1

test2:
    addi sp, sp, -4
    li   t0, -539
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test3
    j Fail_Lb_2

test3:
    addi sp, sp, -4
    li   t0, -692
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test4
    j Fail_Lb_3

test4:
    addi sp, sp, -4
    li   t0, -543
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test5
    j Fail_Lb_4

test5:
    addi sp, sp, -4
    li   t0, 1388
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test6
    j Fail_Lb_5

test6:
    addi sp, sp, -4
    li   t0, -94
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test7
    j Fail_Lb_6

test7:
    addi sp, sp, -4
    li   t0, -459
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test8
    j Fail_Lb_7

test8:
    addi sp, sp, -4
    li   t0, 1672
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test9
    j Fail_Lb_8

test9:
    addi sp, sp, -4
    li   t0, -22
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, test10
    j Fail_Lb_9

test10:
    addi sp, sp, -4
    li   t0, -880
    sw   t0, 0(sp)
    lw   t0, 0(sp)
    sll  t0, t0, 24
    sra  t0, t0, 24
    lb t1, 0(sp)
    addi sp, sp, 4
    beq  t0, t1, pass
    j Fail_Lb_10

pass:
        j return_lb_test

Fail_Lb_1:
    li   gp, 1301
    j    fail

Fail_Lb_2:
    li   gp, 1302
    j    fail

Fail_Lb_3:
    li   gp, 1303
    j    fail

Fail_Lb_4:
    li   gp, 1304
    j    fail

Fail_Lb_5:
    li   gp, 1305
    j    fail

Fail_Lb_6:
    li   gp, 1306
    j    fail

Fail_Lb_7:
    li   gp, 1307
    j    fail

Fail_Lb_8:
    li   gp, 1308
    j    fail

Fail_Lb_9:
    li   gp, 1309
    j    fail

Fail_Lb_10:
    li   gp, 1310
    j    fail
