.section .data
number: .word 0xA5A5A5A5 
result: .word 0

.section .text
.global _start

_start:
    la t0, number
    lw t1, 0(t0)
    li t2, 1
    li t3, 32
    li t0, 1

parity:
    andi t4, t1, 1
    xor t2, t2, t4
    srli t1, t1, 1
    addi t3, t3, -1
    bge t3, t0, parity

add a0, t2, x0
ret


#010010100101001