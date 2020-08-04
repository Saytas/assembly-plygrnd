.data
    name: .asciiz "My name is XYZ.\n"
    name02: .asciiz "My name is XYZ02.\n"



.text
main:
    # li $v0, 4
    # Loading address of name into $a0
    la $a0, name
    la $t0, name02
    
    # syscall 4 prints out strings or characters
    li $v0, 4
    syscall
    
    move $a0, $t0
    li $v0, 4
    syscall
    
    #
    li $v0, 10
    syscall