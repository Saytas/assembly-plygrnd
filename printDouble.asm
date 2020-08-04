.data
    # The value is in RAM
    myDouble: .double 7.333
    zeroDouble: .double 0.0



.text
    # We need to move the value from RAM
    # to Coproc 1
    # ldc1 gets a double from RAM and places
    # in a pair of registers
    # Since a double is 64 bits, we need
    # 2 registers to hold it
    # myDouble will be stored in $f2 and $f3 registers
    # It takes 2 registers for double, so specify 2 pairs
    # Always use even register numbers
    ldc1 $f2, myDouble
    ldc1 $f0, zeroDouble
    
    # Code 3 to print double
    li $v0, 3
   
    # We want to pass the value as an argument
    # Adds $f0 to $f2 and $f12 stores the value
    add.d $f12, $f2, $f0
    syscall