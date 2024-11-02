# 32-bit Single-Cycle Processor with MIPS Architecture
## Introduction
This project presents the design, implementation, and verification of a 32-bit single-cycle processor following the MIPS architecture. The processor is designed using Verilog HDL, and the architecture adheres to the standard Instruction Set Architecture (ISA) principles as described in the book "Digital Design and Computer Architecture" by David Harris and Sarah Harris. The single-cycle processor executes each instruction, including fetching, decoding, and execution, in a single clock cycle.

This design supports so many instructions classified into instruction formats. The processor is tested through simulation to ensure it executes instructions correctly.

### Supported Instruction Formats and Their Opcodes
The formats and their respective instructions are as follows:

#### R-Type Instructions:
Register type instructions
- OPCode: 000000
- Instructions: ADD, SUB, AND, OR, SLT
#### I-Type Instructions:
Arithmetic Instructions
- OPCode: 001000
- Instructions: LW, ADDI , SW
#### J-Type Instructions:
Jump Instructions
- OPCode: 000010
- Instructions: J , BEQ

## Design Overview
### Processor Components
The processor is composed of several key components, each playing a vital role in executing instructions:

- ALU (Arithmetic Logic Unit): Performs arithmetic, logic, and comparison operations.
- Register File: Stores and retrieves values from registers, supporting two simultaneous reads and one write operation.
- Data Memory: Used to read and write data during load/store operations.
- Instruction Memory: Holds the program instructions.
- Control Unit: Generates control signals based on the opcode and function code of the instruction.
- Data Path: Connects all components and handles data flow through the processor.

### Key Modules
- ALU: Handles operations like addition, subtraction, AND, OR, and Set Less Than (SLT).
- Control Unit: Determines the operation of the processor by generating control signals based on the opcode and function code of the instruction.
- Data Path: Manages the flow of data between components based on the control signals.
- Memory Modules (Instruction and Data): Provide storage and access to instructions and data.

### Control Unit
The control unit is the brain of the processor, generating signals that dictate how the data path components operate. The control signals are determined based on the instruction's opcode.
#### Control Signals:
- RegWrite: Controls whether a register is written to.
- RegDst: Selects the destination register for writing.
- ALUSrc: Determines the second ALU operand.
- Branch: Enables branching by comparing ALU results.
- MemWrite: Enables writing to data memory.
- MemtoReg: Selects data from memory to write to a register.
- ALUOp: Specifies the operation the ALU should perform.
- Jump: Controls jumping to a new address.

The control signals for various instructions are determined through the following truth table:
![image](https://github.com/user-attachments/assets/ae530102-c569-4b56-a336-397e745aff23)

### Data Path
The data path connects all the major components of the processor. It handles the flow of data between the ALU, registers, memory, and instruction fetch unit.

### Memory Modules
The processor has two main memory modules: Instruction Memory and Data Memory.
#### Instruction Memory: Stores the program's instructions. The instruction memory is addressed by the program counter (PC).
#### Data Memory: Stores data that is read from or written to during load/store instructions. The data memory is addressed by the ALU output.

### Full MIPS Architecture schematic using Vivado XLINIX 2018:
![Screenshot 2024-08-19 234317](https://github.com/user-attachments/assets/4b0ce9d9-725b-40d0-a171-2f00d5cad78b)

### Testbench and Simulation
#### Testbench Design
The testbench initializes the processor and loads a predefined set of instructions into the instruction memory. It simulates the processor's operation by clocking it and checking the output after each instruction is executed.

### Simulation Results
The processor was tested with a variety of programs, including arithmetic operations, memory access (load/store), and branch/jump instructions. The final states of the registers and memory matched the expected outcomes, verifying the processor’s correct operation.

### Repository Information
For more details, you can check the full Verilog source code and related files on GitHub:

### GitHub Repository: [Single-Cycle-MIPS-Processor](https://github.com/kkhaledhamed/Single-Cycle-MIPS-Processor)
