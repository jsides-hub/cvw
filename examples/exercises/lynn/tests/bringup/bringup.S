// C Runtime entry point
// James Kaden Cassidy
// kacassidy@hmc.edu
// 1/21/2026

.extern add_test
.extern or_test
.extern and_test
.extern sub_test
.extern sll_test
.extern slli_test
.extern srl_test
.extern srli_test
.extern sra_test
.extern srai_test
.extern sltu_test
.extern sltiu_test
.extern bne_test
.extern blt_test
.extern bltu_test
.extern bge_test
.extern bgeu_test

    .section .text.init
    .globl main
    .globl return_add_test
    .globl return_or_test
    .globl return_and_test
    .globl return_sub_test
    .globl return_sll_test
    .globl return_slli_test
    .globl return_srl_test
    .globl return_srli_test
    .globl return_sra_test
    .globl return_srai_test
    .globl return_sltu_test
    .globl return_sltiu_test
    .globl return_bne_test
    .globl return_blt_test
    .globl return_bltu_test
    .globl return_bge_test
    .globl return_bgeu_test
    .type  main, @function

main:
    j add_test

return_add_test:
    j or_test

return_or_test:
    j and_test

return_and_test:
    j sub_test

return_sub_test:
    j sll_test

return_sll_test:
    j slli_test

return_slli_test:
    j srl_test

return_srl_test:
    j srli_test

return_srli_test:
    j sra_test

return_sra_test:
    j srai_test

return_srai_test:
    j sltu_test

return_sltu_test:
    j sltiu_test

return_sltiu_test:
    j bne_test

return_bne_test:
    j blt_test

return_blt_test:
    j bltu_test

return_bltu_test:
    j bge_test

return_bge_test:
    j bgeu_test

return_bgeu_test:
    j pass
