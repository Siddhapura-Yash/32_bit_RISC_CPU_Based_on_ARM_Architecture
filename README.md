# 32-bit RISC CPU Based on ARM Architecture

This project showcases the **design and implementation of a 32-bit RISC CPU inspired by the ARM architecture**, using Verilog Hardware Description Language (HDL). The processor supports a custom ARM-like instruction set, follows RISC principles, and includes a modular design with separate datapath and controller units.

It is developed for educational purposes to demonstrate the fundamental principles of CPU architecture, digital design, and RTL implementation.

---

## 🔧 Key Features

- ✅ 32-bit wide datapath
- ✅ ARM-style RISC instruction set (custom subset)
- ✅ Register file with 16 general-purpose registers
- ✅ ALU supporting arithmetic, logic, and shift operations
- ✅ Condition flags: Zero, Carry, Negative, Overflow
- ✅ Simple branching (B, BEQ, BNE)
- ✅ Modular design: ALU, control unit, datapath, instruction decoder
- ✅ Synthesizable and simulation-ready
- ✅ Optional memory and testbench support

---

## 🧠 Architecture Overview

The processor is based on a simplified ARMv4-like RISC architecture with a single-cycle or multi-stage datapath (non-pipelined in this version for clarity).

### ✅ Major Modules

- **ALU** – Performs arithmetic and logic operations
- **Register File** – 16 registers with synchronous write
- **Instruction Decoder** – Extracts control signals from opcode
- **Control Unit** – Generates control signals for data movement
- **Datapath** – Integrates all units for execution
- **Condition Logic** – Evaluates flags for conditional branching
- **Program Counter** – Holds the current instruction address
- **Instruction Memory** – ROM to hold instructions
- **Data Memory** – RAM for LDR/STR operations

---

## 📂 Directory Structure

.
├── src/ # Verilog source files
│ ├── alu.v
│ ├── control_unit.v
│ ├── datapath.v
│ ├── register_file.v
│ ├── instruction_decoder.v
│ ├── condition_logic.v
│ ├── memory.v
│ ├── program_counter.v
│ └── top.v
├── testbench/ # Testbenches for verification
│ ├── top_tb.v
│ └── alu_tb.v
├── docs/ # Documentation & diagrams
│ ├── architecture_diagram.png
│ └── instruction_set.md
├── README.md # This file
└── LICENSE # License file

pgsql
Copy
Edit

---

## ⚙️ Implemented Instructions

| Instruction | Type     | Description                      |
|-------------|----------|----------------------------------|
| `ADD`       | R-type   | Add two registers                |
| `SUB`       | R-type   | Subtract                        |
| `AND`       | R-type   | Bitwise AND                     |
| `ORR`       | R-type   | Bitwise OR                      |
| `MOV`       | I-type   | Move immediate                  |
| `CMP`       | R-type   | Compare and set flags           |
| `B`         | B-type   | Unconditional branch            |
| `BEQ`       | B-type   | Branch if zero flag is set      |
| `BNE`       | B-type   | Branch if zero flag is not set  |
| `LDR`       | I-type   | Load from memory                |
| `STR`       | I-type   | Store to memory                 |

You can expand this to include more advanced instructions if desired.
