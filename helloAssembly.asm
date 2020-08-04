# Every MIPS program have 2 sections:
# .data
# .text

# .data has all the data of program such as variables
.data
    # Declare a message, declare the data type, and place it in Random Access Memory
    myMessage: .asciiz "Hello Assembly! \n"



# .text has all the instructions a program needs
.text
    # Whenever to tell the system to print out a message - text (register in $v0)
    # li: Load immediate
    # System knows we want to print a value to the screen
    li $v0, 4
    
    # Put the value in a register to print it out
    # By convention use $a register
    # Load the address of the variable which is in Random Access Memory
    # Load it into the register - processor $a0 (Always put it in $a0)
    # la: Load address
    # Pulling the message from Random Access Memory and put it in register $a0
    la $a0, myMessage
    
    # To execute it now
    syscall