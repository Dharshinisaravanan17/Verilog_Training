# Day 3 – Real RTL System Design

This repository contains **Day 3 RTL projects** covering combinational and sequential logic. All code follows **industry-standard RTL style** suitable for interviews.

## Projects

### 1. 8-bit ALU
- Supports 8 operations: ADD, SUB, AND, OR, XOR, NOT, Shift Left, Shift Right
- Outputs: `result` (8-bit), `zero`, `carry`, `overflow` flags
- Combinational logic using `always @(*)`
- Testbench covers all opcodes with waveform generation

### 2. 4-bit Universal Shift Register
- 4 modes: Hold, Shift Right, Shift Left, Parallel Load
- Sequential logic using `always @(posedge clk or posedge reset)`
- Non-blocking assignments for proper hardware behavior
- Testbench demonstrates all modes with clock and reset

## Key Takeaways
- **Blocking vs Non-blocking:** Non-blocking (`<=`) for sequential blocks, blocking (`=`) for combinational
- **Reset Usage:** Always include reset for deterministic behavior
- **Case Statements:** Use for multi-mode control
- **Testbench Best Practices:** Clock generation, reset pulse, waveform dump for verification
- **Waveform Verification:** Always check waveform to catch logic errors
