# 32-bit RISC CPU Based on ARM Architecture

This project presents the **design and implementation of a 32-bit RISC CPU inspired by the ARM architecture**, using Verilog HDL. The processor is non-pipelined and uses a simplified ARM-like instruction set, making it ideal for understanding the fundamental concepts of processor architecture, datapath control, and instruction execution.

---

## 🎯 Project Objective

The goal is to build a custom 32-bit ARM-style RISC processor with:

- A minimal yet powerful instruction set
- Clear separation of controller and datapath
- Modular design using RTL (Register Transfer Level) Verilog
- Simulation-ready and synthesizable design
- Educational clarity and simplicity for VLSI learners

---

## 🧠 Key Features

- 32-bit data path width
- Controller-datapath architecture using FSM control
- 16 general-purpose registers (R0–R15)
- ALU supporting core arithmetic and logic operations
- Support for condition flags: Zero (Z), Negative (N), Carry (C), Overflow (V)
- Instruction formats modeled on ARM instruction styles
- Memory-mapped I/O support for LDR and STR
- Verified using Verilog testbenches

---

## 🔁 Supported Instruction Set

The following subset of ARM instructions is implemented:

### 🧮 Data Processing
- `ADD` – Add
- `SUB` – Subtract
- `AND` – Bitwise AND
- `ORR` – Bitwise OR

### 📦 Memory Operations
- `LDR` – Load from memory
- `STR` – Store to memory

### 🧭 Branch
- `B` – Unconditional branch

These instructions follow ARM’s RISC philosophy — fixed-length 32-bit instructions, register-to-register computation, and a load/store memory model.

---

## 🛠️ Tools & Technologies

- **HDL**: Verilog
- **Simulation**: ModelSim / Icarus Verilog
- **Optional Synthesis**: Xilinx Vivado (for FPGA mapping)
- **Target Audience**: Undergraduate VLSI & digital design students

---

## 🔍 How It Works (Simplified Flow)

1. **Instruction Fetch** from Instruction Memory
2. **Decode & Control Signal Generation**
3. **Execute using ALU or Branch Logic**
4. **Memory Access (only for LDR/STR)**
5. **Write Back to Register File**

All stages are coordinated using an FSM-based control unit.

---

## ✅ Learning Outcomes

- RTL-level understanding of a custom CPU
- Verilog modeling of datapath components
- Instruction decoding and control signal routing
- ALU operation and flag logic implementation
- ARM-like instruction encoding and execution
- Testbench-driven functional verification

---

## 📄 Project Report

A detailed project report (`Report.pdf`) is included in this repository, covering:

- Architectural diagrams  
- Instruction formats  
- Module-wise implementation  
- Control signal derivation  
- Verilog code explanation  
- Simulation output and waveforms  
- Future improvement scope  

---

## 🚀 Future Enhancements

- Add pipelining (5-stage)
- Add more instructions: CMP, MOV, branching with conditions
- Interrupt and exception handling
- Multiply/divide and barrel shifter units
- VGA/Serial I/O integration for FPGA demo

---

## ✍️ Author

**Siddhapura Yash M**  
Bachelor of Engineering – Electronics & Communication  
L.D. College of Engineering, Ahmedabad  
Gujarat Technological University  

---

## 📜 License

This project is open-sourced under the [MIT License](LICENSE).

> ⚠️ This CPU is intended for educational and research purposes only. It is a simplified model and not optimized for production use.
