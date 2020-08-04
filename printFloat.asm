.data
    PI: .float 3.14



.text
    # Code to print out float is 2
    li   $v0,  2
    
    # From the Random Accees memory Load from Coproc 1 for float
    # Always put the value into register $f12
    lwc1 $f12, PI
    
    syscall