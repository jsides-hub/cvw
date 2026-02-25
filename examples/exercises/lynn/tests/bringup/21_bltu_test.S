// bltu test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_bltu_test
.extern fail

    .section .text.init
    .globl bltu_test
    .type  bltu_test, @function

bltu_test:
test1:
    li   t0, 284
    li   t1, 383
    bltu  t0, t1, test2
    j Fail_Bltu_1

test2:
    li   t0, 1856
    li   t1, 1863
    bltu  t0, t1, test3
    j Fail_Bltu_2

test3:
    li   t0, 310
    li   t1, 1454
    bltu  t0, t1, test4
    j Fail_Bltu_3

test4:
    li   t0, 606
    li   t1, 646
    bltu  t0, t1, test5
    j Fail_Bltu_4

test5:
    li   t0, 1673
    li   t1, 1899
    bltu  t0, t1, test6
    j Fail_Bltu_5

test6:
    li   t0, 1307
    li   t1, 1841
    bltu  t0, t1, test7
    j Fail_Bltu_6

test7:
    li   t0, 1252
    li   t1, 2030
    bltu  t0, t1, test8
    j Fail_Bltu_7

test8:
    li   t0, 239
    li   t1, 1208
    bltu  t0, t1, test9
    j Fail_Bltu_8

test9:
    li   t0, 1993
    li   t1, 1996
    bltu  t0, t1, test10
    j Fail_Bltu_9

test10:
    li   t0, 211
    li   t1, 1626
    bltu  t0, t1, pass
    j Fail_Bltu_10

pass:
    j return_bltu_test

Fail_Bltu_1:
    li   gp, 2101
    j    fail

Fail_Bltu_2:
    li   gp, 2102
    j    fail

Fail_Bltu_3:
    li   gp, 2103
    j    fail

Fail_Bltu_4:
    li   gp, 2104
    j    fail

Fail_Bltu_5:
    li   gp, 2105
    j    fail

Fail_Bltu_6:
    li   gp, 2106
    j    fail

Fail_Bltu_7:
    li   gp, 2107
    j    fail

Fail_Bltu_8:
    li   gp, 2108
    j    fail

Fail_Bltu_9:
    li   gp, 2109
    j    fail

Fail_Bltu_10:
    li   gp, 2110
    j    fail
