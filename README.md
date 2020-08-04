Registers are very small memory in the CPU that store information and are
the fastest memory because they are inside the CPU.

Since there are not many registers, we need:
- Cache Memory
- Random Access Memory
- Secondary Memory

Registers are the fastest memory in a computer.
Because some the registers are reserved they are not accesible

Registers are like variables which storing information in random access memory. Unlike variables, registers store information in processor itself.

Assembly give a lot more control than any other high level programming language
because it is a lower level programming language. But there are more complexity to deal with besides having a lot of power.

$zero - just a number zero can be used as a constant

$at - assembler temporary that is reserved and being used by the assembler - no permission to use this one.

$v0 $v1 - are for returning arguments. These registers allow us to return information to give information back

$a0 $a1 $a2 $a3 - A registers stand for arguments. Whenever we need to pass an argument to a function, we can use these registers.

$t0 ... $t9 - T registers used to store any type of information, but these registers follow up a convention meaning that these registers can be modified by the function. The function can actually modify the values in these registers.

$s0 ... $s7 - s registers are similar to the t registers, but they allow you to save the value of the color. We still need to follow the convention. If we use this register inside a function, we are supposed to save them to a special place in memory called stack.

$k0 $k1 - k registers are reserved for the kernel

$gp - Pointer to the global area in memory

$sp - Stack pointer 

There are also special registars for decimal values and decimal numbers


