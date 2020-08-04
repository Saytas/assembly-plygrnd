.data
    # .word is 32 bits or 4 bytes
    age: .word 77



.text
    # Code 4 is for printing strings and characters
    # Code 1 is for printing integers
    li $v0, 1
    
    # Because we dont have strings or characters, but text
    # lw: Load word - because an integer just a word
    # Load it to the argument register $a0
    lw $a0, age
    syscall