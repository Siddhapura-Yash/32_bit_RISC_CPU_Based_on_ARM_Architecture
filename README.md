# 32-bit RISC CPU Based on ARM Architecture

This project is a simplified **32-bit RISC processor** implemented in **Verilog**, inspired by the **ARM architecture**. It is designed to help students understand CPU internals using a clean controller-datapath model.

## 🛠️ Features
- 32-bit datapath with 16 general-purpose registers
- ARM-style instruction formats (non-pipelined)
- FSM-based control unit
- ALU with condition flag support (N, Z, C, V)
- Separate instruction and data memory

## ✅ Supported Instructions
- **Data Processing**: `ADD`, `SUB`, `AND`, `ORR`
- **Memory Access**: `LDR`, `STR`
- **Branching**: `B`

## 📦 Tools
- Verilog HDL, Icarus Verilog / ModelSim
- Optional FPGA synthesis in Vivado

## 📘 Report
Detailed report included (`doc.pdf`) with diagrams, formats, and explanation of each module.

## 👨‍🎓 Author
**Siddhapura Yash M**  
B.E. Electronics & Communication,  
L.D. College of Engineering, Ahmedabad

## ⚖️ License
This project is open-sourced under the [MIT License](LICENSE).
