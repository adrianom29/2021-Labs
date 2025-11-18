    .global _start

_start:
    lui x5, 0x12346
    addi x5, x5, -1928

    lui x6, 0x11223
    addi x6, x6, 0x334

    addi a0, x6, 0
    addi a1, x5, 0
    ret