// jalr test
// Jaden Sides
// jsides@hmc.edu
// 2/9/2026

.extern return_jalr_test
.extern fail

    .section .text.init
    .globl jalr_test
    .type  jalr_test, @function

jalr_test:
    test1a:
        jal t0, test1b
        j test2a

    test4b:
        jalr t0, t0, 0
        j fail

    test1b:
        jalr t0, t0, 0
        j fail

    test9a:
        jal t0, test9b
        j test10a

    test2a:
        jal t0, test2b
        j test3a


    test3a:
        jal t0, test3b
        j test4a

    test2b:
        jalr t0, t0, 0
        j fail

    test3b:
        jalr t0, t0, 0
        j fail

    test7a:
        jal t0, test7b
        j test8a

    test4a:
        jal t0, test4b
        j test5a

    test5a:
        jal t0, test5b
        j test6a

    test5b:
        jalr t0, t0, 0
        j fail

    test6a:
        jal t0, test6b
        j test7a

    test6b:
        jalr t0, t0, 0
        j fail


    test7b:
        jalr t0, t0, 0
        j fail

    test8a:
        jal t0, test8b
        j test9a

    test10b:
        jalr t0, t0, 0
        j fail

    test8b:
        jalr t0, t0, 0
        j fail


    test9b:
        jalr t0, t0, 0
        j fail

    test10a:
        jal t0, test10b
        j pass

pass:
        j return_jalr_test

Fail_Jalr_1:
    li   gp, 2401
    j    fail

Fail_Jalr_2:
    li   gp, 2402
    j    fail

Fail_Jalr_3:
    li   gp, 2403
    j    fail

Fail_Jalr_4:
    li   gp, 2404
    j    fail

Fail_Jalr_5:
    li   gp, 2405
    j    fail

Fail_Jalr_6:
    li   gp, 2406
    j    fail

Fail_Jalr_7:
    li   gp, 2407
    j    fail

Fail_Jalr_8:
    li   gp, 2408
    j    fail

Fail_Jalr_9:
    li   gp, 2409
    j    fail

Fail_Jalr_10:
    li   gp, 2410
    j    fail
