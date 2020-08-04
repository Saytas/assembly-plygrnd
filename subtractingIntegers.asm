.data
    number1: .word 20 
    number2: .word 8



.text
    # Loading the numbers to registers
    # $s registers cannot be modified by functions
    lw $s0, number1($zero)   # $s0 = 20
    lw $s1, number2($zero)   # $s1 = 8
    
    # $t0 = $s0 - $s1
    sub $t0, $s0, $s1
    
    # To print integer
    li $v0, 1
    
    # Sudo instruction
    # Moving value $t0 to $a0
    # Whenever to tell the system what
    # we want to print out
    move $a0, $t0
    
    syscall