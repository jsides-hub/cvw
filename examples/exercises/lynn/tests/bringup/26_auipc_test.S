// auipc test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_auipc_test
.extern fail

    .section .text.init
    .globl auipc_test
    .type  auipc_test, @function

auipc_test:
    test1:
        li   t0, 885
        slli t0, t0, 12
        jal  t1, mid1
        mid1:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 885
        beq  t1, t2, test2
        j Fail_Auipc_1

    test2:
        li   t0, 614
        slli t0, t0, 12
        jal  t1, mid2
        mid2:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 614
        beq  t1, t2, test3
        j Fail_Auipc_2

    test3:
        li   t0, 1954
        slli t0, t0, 12
        jal  t1, mid3
        mid3:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 1954
        beq  t1, t2, test4
        j Fail_Auipc_3

    test4:
        li   t0, 1473
        slli t0, t0, 12
        jal  t1, mid4
        mid4:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 1473
        beq  t1, t2, test5
        j Fail_Auipc_4

    test5:
        li   t0, 3006
        slli t0, t0, 12
        jal  t1, mid5
        mid5:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 3006
        beq  t1, t2, test6
        j Fail_Auipc_5

    test6:
        li   t0, 2930
        slli t0, t0, 12
        jal  t1, mid6
        mid6:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 2930
        beq  t1, t2, test7
        j Fail_Auipc_6

    test7:
        li   t0, 1916
        slli t0, t0, 12
        jal  t1, mid7
        mid7:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 1916
        beq  t1, t2, test8
        j Fail_Auipc_7

    test8:
        li   t0, 3148
        slli t0, t0, 12
        jal  t1, mid8
        mid8:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 3148
        beq  t1, t2, test9
        j Fail_Auipc_8

    test9:
        li   t0, 3447
        slli t0, t0, 12
        jal  t1, mid9
        mid9:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 3447
        beq  t1, t2, test10
        j Fail_Auipc_9

    test10:
        li   t0, 557
        slli t0, t0, 12
        jal  t1, mid10
        mid10:
        add t1, t0, t1
        addi t1, t1, 8
        auipc t2, 557
        beq  t1, t2, pass
        j Fail_Auipc_10

    pass:
        j return_auipc_test

Fail_Auipc_1:
    li   gp, 2601
    j    fail

Fail_Auipc_2:
    li   gp, 2602
    j    fail

Fail_Auipc_3:
    li   gp, 2603
    j    fail

Fail_Auipc_4:
    li   gp, 2604
    j    fail

Fail_Auipc_5:
    li   gp, 2605
    j    fail

Fail_Auipc_6:
    li   gp, 2606
    j    fail

Fail_Auipc_7:
    li   gp, 2607
    j    fail

Fail_Auipc_8:
    li   gp, 2608
    j    fail

Fail_Auipc_9:
    li   gp, 2609
    j    fail

Fail_Auipc_10:
    li   gp, 2610
    j    fail
