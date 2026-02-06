# SIMD Mini GPU – RTL Simulation (Quartus + ModelSim)

## Project Overview
This project demonstrates a **GPU-inspired SIMD (Single Instruction, Multiple Data) architecture** using **Verilog HDL**.  
A single opcode controls multiple processing elements (PEs), allowing **parallel execution** on different data values.

The design is verified using **RTL simulation in ModelSim (Intel FPGA Starter Edition)**.  
No physical FPGA board is required.

---

## Design Description
- **SIMD Core** with 4 Processing Elements (PEs)
- Each PE is an ALU supporting:
  - ADD
  - SUB
  - MUL
- One shared **opcode**
- Different inputs processed **simultaneously**

This design mimics **GPU warp-style execution**.

---

## Tools Used
- Quartus Prime (Design & Compilation)
- ModelSim – Intel FPGA Starter Edition 2020.1 (Simulation)
- Verilog HDL

---

## Project Files
SIMD_Mini_GPU/
├── pe.v // Processing Element (ALU)
├── simd_core.v // SIMD core (4 parallel PEs)
├── simd_tb.v // Testbench
└── README.md

---

## Opcode Table

| Opcode | Operation |
|------|-----------|
| 00   | ADD       |
| 01   | SUB       |
| 10   | MUL       |

---

## How to Run Simulation (RTL)

Open **ModelSim** and run the following commands in the Transcript window:

vlib work
vmap work work
vlog pe.v simd_core.v simd_tb.v
vsim work.simd_tb
add wave -r *
run 100ns

---

## How to See SIMD Behavior (IMPORTANT)

In the **Wave** window, observe the following signals:

### Inputs
- `opcode`
- `a0, a1, a2, a3`
- `b0, b1, b2, b3`

### Outputs
- `r0`
- `r1`
- `r2`
- `r3`

---

## How to Understand the Waveform

1. **Single shared instruction**
   - One `opcode` controls all processing elements

2. **Different input data**
   - Each PE receives different `(a, b)` values

3. **Parallel output update**
   - `r0`, `r1`, `r2`, `r3` change at the **same simulation time**
   - This confirms **SIMD parallel execution**

> Vertical alignment of output transitions is the key proof of SIMD behavior.

---

## Example from Simulation

**Inputs**
opcode = 01 (SUB)
a0 = 5 b0 = 2
a1 = 10 b1 = 3
a2 = 7 b2 = 1
a3 = 8 b3 = 4

**Outputs**
r0 = 3
r1 = 7
r2 = 6
r3 = 4

All outputs appear **simultaneously**.

---

## Results
- Correct arithmetic outputs
- Clean RTL simulation (no X or Z states)
- Verified SIMD parallel execution

---

## Key Learning Outcomes
- GPU-style SIMD architecture
- Parallel hardware design using Verilog
- RTL simulation and waveform analysis
- Understanding throughput vs sequential execution

---

## Applications
- GPU architecture fundamentals
- FPGA-based accelerators
- Computer Architecture laboratories
- Parallel processing systems

---

## Conclusion
The simulation confirms that the designed SIMD core executes multiple operations in parallel under a single instruction, demonstrating GPU-like behavior and improved throughput compared to sequential designs.
