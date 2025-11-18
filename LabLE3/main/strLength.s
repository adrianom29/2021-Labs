# Student Name: Adriano Mancuso
# Student EECS account: am2906
# Student ID number: 221259940
#
# extern int strlen ( char const * s )
#
# ARGUMENTS:
# a0 Pointer to string
#
# RETURNS:
# a0 ( int ) string length

    .global strlen32
    .text

strlen32:
    add     t0, x0, a0        # t0 = char const *ptr
    addi    a0, x0, 0         # Zero strlen

loop:
    lb      t1, 0(t0)         # t1 = *ptr
    beqz    t1, end           # Branch if Null byte
#--------------------------------------------------------
    # TODO: Task 5.1
    # Add your code here
    # Increment strlen
    addi    a0, a0, 1         #Increments length counter
#--------------------------------------------------------
    
    addi    t0, t0, 1         # ++ptr
    j       loop

end:
    ret