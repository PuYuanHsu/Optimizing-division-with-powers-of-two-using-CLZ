.data
str1:     .string "result = "
str2:     .string "\nremainder = "

.text
divisor:
    .word 4

number:
    .word 16

    .globl main
main:
    # Load data
    lw    a0, divisor     # Load divisor into a0
    lw    t0, number      # Load number into t3

    # Call count_leading_zeros function
    call  count_leading_zeros
    
    # Calculate move_right
    li    t2, 31          # Adjusted to 31 for 32-bit
    sub   a0, t2, a0      # move_right = 31 - clz(divisor)
    
    # Shift the number
    srl  a2, t0, a0      # a2 = result
    
    #calculate remainder
    lw   a0, divisor
    li   t1 1
    sub  t1, a0, t1        
    and  a3, t0, t1       # a3 = remainder
    
    #print result
    li a7, 4
    la a0, str1
    ecall
    li a7, 1       
    mv a0, a2    
    ecall  
    li a7, 4
    la a0, str2
    ecall
    li a7, 1
    mv a0, a3
    ecall
    li a7, 10
    ecall
               
    
count_leading_zeros:
    # Load immediate values
    li t1, 17
    li t2, 1           # Start shift value

shift_or_loop:
    srl t3, a0, t2     # Use t3 for intermediate shifts
    or a0, a0, t3
    slli t2, t2, 1    # Double the shift value
    blt t2, t1, shift_or_loop  # If shift value is less than 17, continue loop

    # x -= ((x >> 1) & 0x55555555)
    li t1, 0x55555555
    srli t2, a0, 1    
    and t2, t2, t1
    sub a0, a0, t2

    # x = ((x >> 2) & 0x33333333) + (x & 0x33333333)
    li t1, 0x33333333
    srli t2, a0, 2     
    and t2, t2, t1
    and t3, a0, t1     
    add a0, t2, t3

    # x = ((x >> 4) + x) & 0x0f0f0f0f
    li t1, 0x0f0f0f0f
    srli t2, a0, 4     
    add a0, t2, a0
    and a0, a0, t1

    # x += (x >> 8)
    srli t2, a0, 8
    add a0, a0, t2

    # x += (x >> 16)
    srli t2, a0, 16
    add a0, a0, t2

    # 32 - (x & 0x3f)
    andi a0, a0, 0x3f  
    li t1, 32          
    sub a0, t1, a0

    # Return
    ret
