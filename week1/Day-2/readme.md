# 📘 **Day 2 – Sequential Logic & FSM Design (VLSI Foundations)**

This day focuses on building essential **sequential circuits** and **finite state machines**, which form the core of RTL and digital design interviews at companies like Intel, Qualcomm, Nvidia, Synopsys, and Samsung.

---

# 🎯 **Topics Covered**

* Sequential logic fundamentals
* Flip-flops
* Synchronous counters
* Finite State Machines (FSMs)
* Writing SystemVerilog RTL
* Writing testbenches
* Simulating in EDA Playground
* Waveform analysis

---

# 🧩 **Projects Completed**

---

## ✅ **1. D Flip-Flop with Asynchronous Reset**

### **Features**

* Positive-edge triggered
* Asynchronous reset (active high)
* Output `q` follows input `d` on clock edges

### **Files**

* `dff_async.sv`
* `dff_tb.sv`
* `waveform.png`

### **Output**

* Reset forces Q = 0
* Q updates at positive clock edges

---

## ✅ **2. MOD-10 Counter**

### **Features**

* Synchronous reset
* Counts 0 → 9 then wraps to 0
* 4-bit output

### **Files**

* `mod10_counter.sv`
* `mod10_tb.sv`
* `waveform_mod10.png`

### **Output**

* Correct repeating sequence: 0-1-2-3…9-0-1…

---

## ✅ **3. Traffic Light Controller (FSM)**

### **States**

* **Red** → 5 cycles
* **Green** → 5 cycles
* **Yellow** → 2 cycles

### **FSM Type**

* Moore Machine
* Encoded states:

  * 00 = Red
  * 01 = Green
  * 10 = Yellow

### **Files**

* `traffic_light.sv`
* `traffic_tb.sv`
* `waveform_traffic.png`

### **Output**

Waveform shows smooth transitions:
**Red → Green → Yellow → Red → …**

---

# 🔧 **Tools Used**

* **EDA Playground (Icarus Verilog/SystemVerilog)**
* Waveform viewer (EPWave)
* GitHub for version control

---
