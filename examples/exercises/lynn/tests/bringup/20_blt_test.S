// blt test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_blt_test
.extern fail

    .section .text.init
    .globl blt_test
    .type  blt_test, @function

blt_test:
test1:
    li   t0, -326
    li   t1, 179
    blt  t0, t1, test2
    j Fail_Blt_1

test2:
    li   t0, -565
    li   t1, 990
    blt  t0, t1, test3
    j Fail_Blt_2

test3:
    li   t0, -609
    li   t1, 224
    blt  t0, t1, test4
    j Fail_Blt_3

test4:
    li   t0, -260
    li   t1, 4
    blt  t0, t1, test5
    j Fail_Blt_4

test5:
    li   t0, -1011
    li   t1, 8
    blt  t0, t1, test6
    j Fail_Blt_5

test6:
    li   t0, 94
    li   t1, 439
    blt  t0, t1, test7
    j Fail_Blt_6

test7:
    li   t0, 442
    li   t1, 1000
    blt  t0, t1, test8
    j Fail_Blt_7

test8:
    li   t0, -960
    li   t1, -282
    blt  t0, t1, test9
    j Fail_Blt_8

test9:
    li   t0, -121
    li   t1, 264
    blt  t0, t1, test10
    j Fail_Blt_9

test10:
    li   t0, -1006
    li   t1, 673
    blt  t0, t1, pass
    j Fail_Blt_10

pass:
    j return_blt_test

Fail_Blt_1:
    li   gp, 2001
    j    fail

Fail_Blt_2:
    li   gp, 2002
    j    fail

Fail_Blt_3:
    li   gp, 2003
    j    fail

Fail_Blt_4:
    li   gp, 2004
    j    fail

Fail_Blt_5:
    li   gp, 2005
    j    fail

Fail_Blt_6:
    li   gp, 2006
    j    fail

Fail_Blt_7:
    li   gp, 2007
    j    fail

Fail_Blt_8:
    li   gp, 2008
    j    fail

Fail_Blt_9:
    li   gp, 2009
    j    fail

Fail_Blt_10:
    li   gp, 2010
    j    fail
