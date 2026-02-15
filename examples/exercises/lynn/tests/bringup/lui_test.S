// lui test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_lui_test
.extern fail

    .section .text.init
    .globl lui_test
    .type  lui_test, @function

lui_test:
test1:
    li   t0, 2712
    slli t0, t0, 12
    lui t1, 2712
    beq  t0, t1, test2
    j Fail_Lui_1

test2:
    li   t0, 1501
    slli t0, t0, 12
    lui t1, 1501
    beq  t0, t1, test3
    j Fail_Lui_2

test3:
    li   t0, 2103
    slli t0, t0, 12
    lui t1, 2103
    beq  t0, t1, test4
    j Fail_Lui_3

test4:
    li   t0, 3346
    slli t0, t0, 12
    lui t1, 3346
    beq  t0, t1, test5
    j Fail_Lui_4

test5:
    li   t0, 1941
    slli t0, t0, 12
    lui t1, 1941
    beq  t0, t1, test6
    j Fail_Lui_5

test6:
    li   t0, 3584
    slli t0, t0, 12
    lui t1, 3584
    beq  t0, t1, test7
    j Fail_Lui_6

test7:
    li   t0, 3969
    slli t0, t0, 12
    lui t1, 3969
    beq  t0, t1, test8
    j Fail_Lui_7

test8:
    li   t0, 4073
    slli t0, t0, 12
    lui t1, 4073
    beq  t0, t1, test9
    j Fail_Lui_8

test9:
    li   t0, 1397
    slli t0, t0, 12
    lui t1, 1397
    beq  t0, t1, test10
    j Fail_Lui_9

test10:
    li   t0, 40
    slli t0, t0, 12
    lui t1, 40
    beq  t0, t1, pass
    j Fail_Lui_10

pass:
        j return_lui_test

Fail_Lui_1:
    li   gp, 2501
    j    fail

Fail_Lui_2:
    li   gp, 2502
    j    fail

Fail_Lui_3:
    li   gp, 2503
    j    fail

Fail_Lui_4:
    li   gp, 2504
    j    fail

Fail_Lui_5:
    li   gp, 2505
    j    fail

Fail_Lui_6:
    li   gp, 2506
    j    fail

Fail_Lui_7:
    li   gp, 2507
    j    fail

Fail_Lui_8:
    li   gp, 2508
    j    fail

Fail_Lui_9:
    li   gp, 2509
    j    fail

Fail_Lui_10:
    li   gp, 2510
    j    fail
