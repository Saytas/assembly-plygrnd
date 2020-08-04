.data



.text
    #mult
    #sll
    # Getting values into registers without using RAM
    # $s0 = 10 + 0
    addi $s0, $zero, 10
    # $s1 = 4 + 0
    addi $s1, $zero, 4
    
    # Only 2 numbers can be multipled
    # 16 bits
    mul $t0, $s0, $s1
    
    # Display output of product
    li $v0, 1
    add $a0, $zero, $t0
    syscall