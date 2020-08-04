.data
    # Declare 2 variables in RAM
    number1: .word 5 
    number2: .word 10



.text
    # Load the variables inside the processer
    # to the registers
    # Moving the values from memory to registers
    lw $t0, number1($zero)
    lw $t1, number2($zero)
    
    # Now perform addition
    # $t2 = $t0 + $t1
    add $t2, $t0, $t1
    
    # To print an integer
    li $v0, 1
    
    # Integer we want to print out is the value in $t2
    # We have to move the value $t2 to $a0
    add $a0, $zero, $t2
    
    syscall