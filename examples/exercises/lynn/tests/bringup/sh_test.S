// sh test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_sh_test
.extern fail

    .section .text.init
    .globl sh_test
    .type  sh_test, @function

sh_test:
    test1:
        addi sp, sp, -4
        li   t0, -236
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test2
        j Fail_Sh_1

    test2:
        addi sp, sp, -4
        li   t0, 1915
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test3
        j Fail_Sh_2

    test3:
        addi sp, sp, -4
        li   t0, -507
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test4
        j Fail_Sh_3

    test4:
        addi sp, sp, -4
        li   t0, 1548
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test5
        j Fail_Sh_4

    test5:
        addi sp, sp, -4
        li   t0, 350
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test6
        j Fail_Sh_5

    test6:
        addi sp, sp, -4
        li   t0, -1548
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test7
        j Fail_Sh_6

    test7:
        addi sp, sp, -4
        li   t0, 809
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test8
        j Fail_Sh_7

    test8:
        addi sp, sp, -4
        li   t0, -596
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test9
        j Fail_Sh_8

    test9:
        addi sp, sp, -4
        li   t0, -547
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, test10
        j Fail_Sh_9

    test10:
        addi sp, sp, -4
        li   t0, 1188
        sll  t0, t0, 16
        srl  t0, t0, 16
        sh t0, 0(sp)
        lw t1, 0(sp)
        sll  t1, t1, 16
        srl  t1, t1, 16
        addi sp, sp, 4
        beq  t0, t1, pass
        j Fail_Sh_10

pass:
        j return_sh_test

Fail_Sh_1:
    li   gp, 1801
    j    fail

Fail_Sh_2:
    li   gp, 1802
    j    fail

Fail_Sh_3:
    li   gp, 1803
    j    fail

Fail_Sh_4:
    li   gp, 1804
    j    fail

Fail_Sh_5:
    li   gp, 1805
    j    fail

Fail_Sh_6:
    li   gp, 1806
    j    fail

Fail_Sh_7:
    li   gp, 1807
    j    fail

Fail_Sh_8:
    li   gp, 1808
    j    fail

Fail_Sh_9:
    li   gp, 1809
    j    fail

Fail_Sh_10:
    li   gp, 1810
    j    fail
