32-bit Single-Cycle Processor with RISC-V Architecture
Introduction
This project presents the design, implementation, and verification of a 32-bit single-cycle processor following the RISC-V architecture. The processor is designed using Verilog HDL, and the architecture adheres to the standard Instruction Set Architecture (ISA) principles as described in the book "Digital Design and Computer Architecture" by David Harris and Sarah Harris. The single-cycle processor executes each instruction, including fetching, decoding, and execution, in a single clock cycle.

This design supports 31 instructions classified into six instruction formats. The processor is tested through simulation to ensure it executes instructions correctly.

Supported Instruction Formats and Their Opcodes
This processor supports six instruction formats in the RISC-V architecture. The formats and their respective instructions are as follows:

R-Type Instructions:
OPCode: 000000
Instructions: ADD, SUB, AND, OR, SLT
I-Type Instructions:
Arithmetic Instructions
OPCode: 001000
Instructions: ADDI
Load Instructions
OPCode: 100011
Instructions: LW
S-Type Instructions:
Store Instructions
OPCode: 101011
Instructions: SW
SB-Type Instructions:
Branch Instructions
OPCode: 000100
Instructions: BEQ
U-Type Instructions:
Upper Immediate Instructions
OPCode: 011011
Instructions: LUI
UJ-Type Instructions:
Jump Instructions
OPCode: 000010
Instructions: J
Design Overview
Processor Components
The processor is composed of several key components, each playing a vital role in executing instructions:

ALU (Arithmetic Logic Unit): Performs arithmetic, logic, and comparison operations.
Register File: Stores and retrieves values from registers, supporting two simultaneous reads and one write operation.
Data Memory: Used to read and write data during load/store operations.
Instruction Memory: Holds the program instructions.
Control Unit: Generates control signals based on the opcode and function code of the instruction.
Data Path: Connects all components and handles data flow through the processor.
Key Modules
ALU: Handles operations like addition, subtraction, AND, OR, and Set Less Than (SLT).
Control Unit: Determines the operation of the processor by generating control signals based on the opcode and function code of the instruction.
Data Path: Manages the flow of data between components based on the control signals.
Memory Modules (Instruction and Data): Provide storage and access to instructions and data.
Control Unit
The control unit is the brain of the processor, generating signals that dictate how the data path components operate. The control signals are determined based on the instruction's opcode.

Control Signals
RegWrite: Controls whether a register is written to.
RegDst: Selects the destination register for writing.
ALUSrc: Determines the second ALU operand.
Branch: Enables branching by comparing ALU results.
MemWrite: Enables writing to data memory.
MemtoReg: Selects data from memory to write to a register.
ALUOp: Specifies the operation the ALU should perform.
Jump: Controls jumping to a new address.
The control signals for various instructions are determined through the following truth table:

Instruction	Opcode	RegWrite	RegDst	ALUSrc	Branch	MemWrite	MemtoReg	ALUOp	Jump
R-type	000000	1	1	0	0	0	0	10	0
lw	100011	1	0	1	0	0	1	00	0
sw	101011	0	X	1	0	1	X	00	0
beq	000100	0	X	0	1	0	X	01	0
addi	001000	1	0	1	0	0	0	00	0
j	000010	0	X	X	X	0	X	XX	1
Data Path
The data path connects all the major components of the processor. It handles the flow of data between the ALU, registers, memory, and instruction fetch unit.

Memory Modules
The processor has two main memory modules: Instruction Memory and Data Memory.

Instruction Memory: Stores the program's instructions. The instruction memory is addressed by the program counter (PC).
Data Memory: Stores data that is read from or written to during load/store instructions. The data memory is addressed by the ALU output.
Testbench and Simulation
Testbench Design
The testbench initializes the processor and loads a predefined set of instructions into the instruction memory. It simulates the processor's operation by clocking it and checking the output after each instruction is executed.

Simulation Results
The processor was tested with a variety of programs, including arithmetic operations, memory access (load/store), and branch/jump instructions. The final states of the registers and memory matched the expected outcomes, verifying the processor’s correct operation.

Repository Information
For more details, you can check the full Verilog source code and related files on GitHub:

GitHub Repository: Single-Cycle-RISC-V-Processor
