
# 📘 **DAY-4 — Sequential Logic + Essential RTL Blocks (Interview-Focused)**

**Date:** *Day-4 of VLSI + Embedded Skill Training*
**Goal:** Implement and simulate industry-standard sequential & combinational RTL blocks with clean coding style and testbenches.

---
This day focuses on **four RTL blocks** that frequently appear in:

* VLSI Design Tests
* RTL Design Interviews
* Processor / Datapath design
* Verification assignments

Concepts built:
✔ **2:1 Multiplexer (case style)**
✔ **4-bit Priority Encoder (if-else ladder)**
✔ **Left Barrel Shifter (parameterized)**
✔ **8x8 Mini Register File (2-read, 1-write)**

Each block teaches **core interview concepts**:

* Combinational vs Sequential logic
* case vs if-else usage
* Blocking vs non-blocking assignment
* Synchronous write + asynchronous read
* reg arrays for storage
* Clean TB writing for waveform verification

---

# 🔷 **1️⃣ 2:1 MUX (case-based design)**

### ✔ Why It's Important (Interview Angle)

* Tests basic combinational logic understanding
* Checks if you know **always @(*)** vs assign
* Case statement usage

### ✔ RTL

```verilog
always @(*) begin
    case (sel)
        1'b0: y = a;
        1'b1: y = b;
        default: y = 1'b0;
    endcase
end
```

### ✔ Key Revision Points

* Pure combinational: use `always @(*)`
* No blocking/non-blocking confusion → use `=`

---

# 🔷 **2️⃣ Priority Encoder (4-to-2)**

### ✔ Why It's Important

Interviewers check:

* Use of **if-else ladder**
* Priority ordering (MSB wins)
* Avoiding `casez` unless explicitly asked

### ✔ RTL

```verilog
always @(*) begin
    if      (in[3]) out = 2'b11;
    else if (in[2]) out = 2'b10;
    else if (in[1]) out = 2'b01;
    else if (in[0]) out = 2'b00;
    else            out = 2'b00;
end
```

### ✔ Revision Points

* MSB = higher priority
* Perfect example of "priority if-else" needed in CPUs, arbiters
* No clock, pure combinational logic

---

# 🔷 **3️⃣ Barrel Shifter (Left Shift, Parameterized)**

### ✔ Why It’s Important

* Common ALU component in processors
* Teaches multi-stage shifting
* Checks understanding of bit-width parameterization
* Appears in ARM/Intel interview questions

### ✔ RTL (Shift Stages Pattern)

```verilog
always @(*) begin
    temp = in;
    if (shamt[0]) temp = temp << 1;
    if (shamt[1]) temp = temp << 2;
    if (shamt[2]) temp = temp << 4;
    out = temp;
end
```

### ✔ Revision Points

* No clock → pure combinational
* Each shamt bit = power-of-two shift
* Can extend to both left & right in interviews

---

# 🔷 **4️⃣ Mini Register File (8 Registers × 8 Bits)**

**(The most important block of Day-4)**

### ✔ Why Interviewers Love This

* Tests your understanding of **synchronous write**
* Tests combinational read
* Checks if you know **reg array implementation**
* Appears in:

  * CPU design rounds
  * RISC-V/ARM coding tests
  * Verification problem statements

### ✔ Architecture

```
                 +-------------+
  wr_en -------->|             |
  wr_addr ------>| REGISTER    |
  wr_data ------>|    FILE     |----> rd_data1
  clk ---------->|             |----> rd_data2
 rd_addr1 ------>|             |
 rd_addr2 ------>|             |
                 +-------------+
```

### ✔ RTL

```verilog
reg [7:0] mem [7:0];   // 8 registers of 8 bits

// WRITE — sequential
always @(posedge clk) begin
    if (wr_en)
        mem[wr_addr] <= wr_data;   // non-blocking
end

// READ — combinational
assign rd_data1 = mem[rd_addr1];
assign rd_data2 = mem[rd_addr2];
```

### ✔ Revision Points

* **Use `<=` (non-blocking)** inside clocked block
* Reads must be purely combinational
* Synchronous write avoids glitches
* Very similar to small CPU register files

---

# 🔧 **Testbenches (General Pattern Used Today)**

Each TB included:

✔ Clock generation
✔ Initial stimuli block
✔ `$monitor` to verify outputs
✔ Delay-based input changes
✔ `$finish` after full tests

This strengthens your **simulation debugging skills**.

---

# 📝 **What You Achieved Today**

### ✔ Built 4 industry-level RTL modules

### ✔ Wrote clean synthesizable code

### ✔ Practiced case / if-else / blocking vs non-blocking

### ✔ Implemented a real mini register file

### ✔ Validated everything with simulation

### ✔ Structured code for GitHub + portfolio

