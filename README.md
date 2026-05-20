# RV32I SoC

A 32-bit **RISC-V (RV32I) System-on-Chip** implemented in **SystemVerilog**, designed using a clean RTL methodology with verification through simulation and waveform analysis.

This project aims to build a **single-cycle RV32I processor**, integrate peripherals, validate functionality on FPGA using **Vivado**, and eventually move toward an **ASIC/tapeout-oriented flow**.

---

## Project Goals

- Build a synthesizable **RV32I CPU**
- Verify functionality using **Icarus Verilog + GTKWave**
- Implement and validate on **FPGA using Vivado**
- Follow **ASIC/tapeout-conscious RTL design practices**
- Develop a modular and reusable SoC architecture

---

## Planned Architecture

### CPU Core
- RV32I single-cycle processor
- Arithmetic Logic Unit (ALU)
- Register File
- Program Counter (PC)
- Immediate Generator
- Control Unit
- Instruction Memory
- Data Memory

### Peripherals
- UART (memory-mapped)
- GPIO

### Future Scope
- FPGA deployment using Vivado
- Pipelined CPU version
- ASIC flow exploration
- Tapeout-oriented design methodology

---

## Project Structure

```text
rv32i-soc/
├── rtl/            # RTL/SystemVerilog design files
├── tb/             # Testbenches
├── sim/            # Simulation outputs/scripts
├── vivado/         # Vivado project files
├── constraints/    # FPGA constraint files (.xdc)
├── docs/           # Documentation, diagrams, waveforms
├── README.md
└── .gitignore
