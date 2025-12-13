
Day-7 is **INTEGRATION coding**, not *new concept* coding.

You already wrote the **pieces**.
Now we **wire them together like real silicon**.

Below is a **clean mini-project** using **already-written Verilog blocks** (no new theory).

---
# 📘 Day-7 — Mini RTL Datapath Project (CPU-Style)

## 📌 Project Overview
This mini project implements a **simple processor-style datapath** using
previously designed RTL blocks:
- Register File
- ALU
- Multiplexer (Writeback)
- Top-level datapath integration

The goal is to demonstrate **end-to-end RTL design + verification**, not just isolated modules.

---

## 🧠 Architecture Description

The datapath consists of:

- **Register File**
  - 8 registers × 8 bits
  - Synchronous write
  - Combinational read

- **ALU**
  - Supports ADD, SUB, AND, OR, XOR
  - Controlled by opcode

- **Writeback MUX**
  - Selects between ALU result and immediate data

- **Top Module**
  - Connects all blocks together
  - Models a simplified CPU datapath


---

## 🔧 RTL Modules Used

- `regfile` — 8x8 register storage
- `alu_8bit` — arithmetic and logic unit
- `wb_mux` — writeback selection
- `simple_datapath` — top-level integration

All RTL is written in **synthesizable Verilog**.

---

---

## 🧩 BLOCKS USED (Already Known)

You already learned all of these:

| Block            | Type          |
| ---------------- | ------------- |
| Register File    | Sequential    |
| ALU              | Combinational |
| Multiplexer      | Combinational |
| Control (opcode) | Combinational |

---

## 🏗️ Top-Level Architecture

```
         ┌────────────┐
         │ Register   │
 rs1 ───▶│ File       │─── opA
 rs2 ───▶│ (8×8)      │─── opB
         └─────┬──────┘
               │
               ▼
            ┌──────┐
            │ ALU  │◀── opcode
            └──┬───┘
               │ result
               ▼
         ┌────────────┐
         │ Writeback  │
         │ (MUX)      │
         └─────┬──────┘
               │
               ▼
         Register File
```
---

## 🎯 How to Explain This in Interview (MEMORIZE)

> “I designed a simple RTL datapath consisting of a register file, ALU, and writeback multiplexer.
> The register file supports synchronous write and combinational read.
> Operands are processed by an ALU based on opcode, and the result is written back.
> I verified the design using a testbench and waveform analysis.”

This is **EXACTLY** what interviewers want.

---

## 🧪 Verification Strategy

- A dedicated testbench was written to:
  - Generate clock
  - Write immediate values into registers
  - Perform ALU operation
  - Write back result
  - Observe waveforms

- Waveforms were generated using:

- Simulation was performed using **EDA Playground / Icarus Verilog**.

---

## 🎯 Key Learning Outcomes

- Integration of multiple RTL blocks
- Difference between combinational and sequential logic
- Proper usage of blocking vs non-blocking assignments
- Datapath-level verification
- Interview-ready explanation of RTL design

---

## 🗣️ Interview Explanation (Ready-to-Say)

> “I designed a simple RTL datapath consisting of a register file, ALU, and writeback multiplexer.  
> The register file supports synchronous writes and combinational reads.  
> Operands are processed by the ALU based on opcode and results are written back through a MUX.  
> The design was verified using a self-checking testbench and waveform analysis.”

---

## ✅ Status
✔ RTL Complete  
✔ Testbench Complete  
✔ Simulation Verified  
✔ Ready for Interview Discussion
