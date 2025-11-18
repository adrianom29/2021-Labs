# Student Name: Adriano Mancuso
# Student EECS account: am2906
# Student ID number: 221259940
#
# extern int bigcall (
#   int32_t one,
#   int64_t two,
#   int32_t three,
#   int64_t four,
#   int32_t five,
#   int64_t six,
#   int32_t seven,
#   int64_t eight,
#   int32_t nine
# );
#
# ARGUMENTS:
# a0 stores the argument 1 value
# a1 stores the low order value of argument 2 (int64)
# a2 stores the high order value of argument 2 (int64)
# a3 stores the argument 3 value
# a4 stores the low order value of argument 4 (int64)
# a5 stores the high order value of argument 4 (int64)
# a6 stores the argument 5 value
# a7 stores the low order value of argument 6 (int64)
# RETURNS:
# a0 the sum of all arguments

    .global bigcall

    .struct 0
svfp: .space 4 # Save register fp / s0
svra: .space 4 # Save register ra
    .balign 8 # Make sz mod 8
sz  =   .-svfp

    .text
bigcall:
    addi sp, sp, -sz # Set sp for stack frame
    sw fp, svfp(sp) # Save fp / s0
    sw ra, svra(sp) # Save ra
    addi fp, sp,+ sz # Set fp = original sp

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # TODO: Task 4.1
    # Add your code here

    add t0, a0, a1      #t0 = arg 1 + arg 2 low bits
    add t0, t0, a2      #t0 += arg 2 high bits
    add t0, t0, a3      #t0 += arg 3
    add t0, t0, a4      #t0 += arg 4 low bits
    add t0, t0, a5      #t0 += arg 4 high bits
    add t0, t0, a6      #t0 += arg 5 
    add t0, t0, a7      #t0 += arg 6 low bits

    lw t1, 0(fp)        #load arg 6 high bits from memory
    add t0, t0, t1      #t0 += arg 6 high bits

    lw t1, 4(fp)        #load arg 7 from memory
    add t0, t0, t1      #t0 += arg 7

    lw t1, 8(fp)        #load arg 8 low bits from memory
    add t0, t0, t1      #t0 += arg 8 low bits

    lw t1, 12(fp)       #load arg 8 high bits from memory
    add t0, t0, t1      #t0 += arg 8 high bits

    lw t1, 16(fp)       #load arg 9 from memory
    add t0, t0, t1      #t0 += arg 9

    add a0, x0, t0     #store result in return regiter

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    lw ra, svra (sp) # Restore ra
    lw fp, svfp(sp) # Restore fp / s0
    addi sp, sp,+ sz # Restore sp
    ret