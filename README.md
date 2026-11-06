# RV32I Processor

This repository holds the design files for a single cycle processor implementing a subset of [RV32I](https://docs.riscv.org/reference/isa/v20240411/unpriv/rv32.html ) architecture. The microarchitecture was implemented following the specifications in ["Digital Design and Computer Architecture: Risc-V Edition"]( https://pages.hmc.edu/harris/ddca/ddcarv.html ). This design is for hobby and educational purposes. Currently, there's no way to load constants but that will soon change with the implementation of the `addi` instruction.

## Architecture
The processor has 32 regsisters each referred to by a number between 0 and 31. It also takes four instruction types: __I__, __S__, __B__ , and __R__. 

### I-Type Instructions
I-type instructions have three operands. One source register specified by bits 19:15, one destination register from bits 11:7, and one 12 bit constant from 31:20. 

### S/B-Type Instructions
S and B-type instructions both take two source registers and one 12 bit constant. Source one from 19:15 and source two from 24:20. The difference between them lies in how the bits are swizzled into 31:25 and 11:7. 

### R-Type Instructions 
R-type instructions take two source registers and one destination register. Source one and source two are the same as in S/B-type instructions. The destination is stored in bits 11:7.

### All Implemented Instructions

| Instruction | Type | Opcode | funct3 | funct7 | Description |
|:-----------:|:----:|:------:|:------:|:------:|:-----------:|
| `lw` | I | The 12 bit constant is added to the base address stored in the source register. The data memory is addressed by the sum and the value stored there is loaded into the destination register. |
| `sw` | S | The memory address is the sum of the base address stored in the source register and the 12 bit constant. `sw` writes the contents of the destination register to that location. | 
| `add` | R | The sum of the values in the two source registers is stored in the destination register. |
| `sub` | R | The difference of the values in the two source registers is stored in the destination register. |
|`or` | R | The bitwise or of the two source registers is stored in the destination register. |
| `and`| R | The bitwise and of the two source registers is stored in the destination register. |
| `slt` | R | If the value in source one is less than the value in source two, `1` is written to the destination register. Otherwise `0` is written.|
