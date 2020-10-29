# Lab 4 CS10 w4shift.asm 
# Short program to demonstrate shift instructions
#
	.text
main:
	li	$t0, 3       # Load 3 into $t0
	sll	$a0, $t0, 1  # Shift $t0 left by 1 column
                     # Ask the system to print an integer
	li	$v0, 1       # 1 means the print_int syscall
	syscall
                     # Now tell the system to stop
	li	$v0, 10      # 10 means the exit syscall
	syscall
