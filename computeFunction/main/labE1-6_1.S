.section .data 
x: .word 4
y: .word 3
result: .word 0

.section .text
.globl _start

_start:
    la t0, x
    lw t1, 0(t0)

    la t0, y
    lw t2, 0(t0)
    
    mul t1, t1, t1
    mul t2, t2, t2
    add a0, t1, t2
    ret

