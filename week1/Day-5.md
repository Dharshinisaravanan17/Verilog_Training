Good.
Now **calm, structured, REAL Day-5** — no rushing, no randomness.

You are officially entering **verification mindset**, which is where *most students fail*.

---

# 🔥 **DAY-5 — RTL VERIFICATION FUNDAMENTALS (CORE SKILL)**

> *“If you can’t verify it, you don’t own the design.”*

### 🎯 **End-of-Day Outcome**

By the end of Day-5, you must be able to **confidently answer in an interview**:

> “How did you verify your design?”

---

## 🧠 **Before Touching Code (15 min – Read Only)**

### Understand this clearly:

* RTL design = *what the hardware does*
* Testbench = *how you prove it works*
* **Testbench is NOT synthesizable**
* Verification is **50–60% of real VLSI jobs**

---

## 🧩 **What Exactly Is a Testbench? (Core Concept)**

A testbench:
✔ Generates inputs
✔ Applies clock & reset
✔ Observes outputs
✔ Checks correctness
✔ Reports PASS / FAIL

**RTL without TB = useless in industry**

---

## 🛠️ **DAY-5 HANDS-ON TASKS (CLEAN FLOW)**

We will **NOT write new RTL today**.
We will **verify what you already built**.

---

## 1️⃣ Pick ONE Old Design (Mandatory)

Choose **one**:

* 4:1 MUX
* 8-bit ALU
* Register File (**best choice**)

👉 Use the same RTL — *do not modify it*.

---

## 2️⃣ Rewrite Testbench — Proper Structure

Your TB **must have these blocks**:

### ✔ Clock Generator

```verilog
always #5 clk = ~clk;
```

### ✔ Reset Task (if applicable)

```verilog
task apply_reset;
begin
  rst = 1;
  #10;
  rst = 0;
end
endtask
```

### ✔ Stimulus Block

```verilog
initial begin
  // apply inputs
end
```

---

## 3️⃣ Convert TB to **Self-Checking** (IMPORTANT)

Instead of only `$monitor`, add logic like:

```verilog
if (result !== expected)
    $display("FAIL: A=%0d B=%0d opcode=%b", A, B, opcode);
else
    $display("PASS");
```

### Interview gold line:

> “I used self-checking testbenches to automatically validate outputs.”

---

## 4️⃣ Add Corner-Case Tests

Depending on design:

### For ALU:

✔ A = 0
✔ B = 0
✔ Max value (255)
✔ Overflow case

### For Register File:

✔ Write → Read same cycle
✔ Read before write
✔ Write disabled case

---

## 5️⃣ Understand These (REVISION NOTES)

You must be able to explain:

### `$display` vs `$monitor`

| $display           | $monitor                |
| ------------------ | ----------------------- |
| Prints once        | Prints on every change  |
| Used for pass/fail | Used for waveform debug |

### Blocking vs Non-Blocking in TB

* TB → blocking `=` is fine
* RTL sequential → non-blocking `<=` only

---

## 6️⃣ Generate Waveforms (Mandatory)

✔ Add:

```verilog
$dumpfile("dump.vcd");
$dumpvars;
```

✔ View waveform
✔ Correlate signal changes with clock edges

---

## 7️⃣ Git Commit (Very Important)

**Commit message:**

```
Day-5: self-checking testbench and verification
```

---

# 📌 **What You Submit to Me**

Send **ONLY this**:
1️⃣ “Day-5 completed”
2️⃣ Which design you verified
3️⃣ Paste **one self-checking TB snippet**

I’ll review like an **interviewer**.

---

