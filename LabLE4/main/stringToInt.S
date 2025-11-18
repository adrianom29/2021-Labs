# Student Name: Adriano Mancuso
# Student EECS account: am2906
# Student ID number: 221259940
#
# extern unsigned struint(char const *text, bool *ok)
#
# ARGUMENTS:
# a0 char const * text (text to convert)
# a1 pointer to bool
#
# RETURNS:
# a0 unsigned value (when ok is true)
# ok:
# true , conversion successful
# false , conversion failed

.global struint
.text
struint:
    add  t6, x0, a0        # t6 = ptr to test
    addi a0, x0, 0         # Accumulator for uint
    addi t2, x0, 0         # Digit count
    addi t4, x0, '0'
    addi t3, x0, '9'
    addi t1, x0, ' '
    addi t0, x0, 10

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # TODO: Task 6.1
    # Add your code 
loop: 
    lb t5, 0(t6)
    beqz t5, nulbyt         #once end of word is reached (and not failed)
    beq t5, t1, skip        #if char is a space, skip to next char
    blt t5, t4, fail        #char >= 0
    bgt t5, t3, fail        #9 >= char >=0

    addi t2, t2, 1          #Bump digit count
    sub t5, t5, t4          #converts from ascii value to digit value

    #a0 = a0 * 10 + t6 (appends digit to end of a0)
    mul a0, a0, t0          
    add a0, a0, t5          
    #goes to skip   
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

skip:
    addi t6, t6, 1         # ++ text ptr
    j loop

nulbyt:
    beqz t2, fail          # Fail if no digits
    li   t0, 1
    sb   t0, 0(a1)         # ok = true
    ret

fail:
    li   t0, 0
    sb   t0, 0(a1)         # ok = false
    ret