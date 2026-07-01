# Dual Port RAM Design and Simulation Using Verilog

## Abstract

This project presents the design and simulation of a True Dual Port Random Access Memory (RAM) using Verilog Hardware Description Language. Dual Port RAM allows simultaneous access to memory through two independent ports, enabling parallel read and write operations on the same memory array. The design is implemented using synchronous logic and verified using Icarus Verilog and GTKWave.

## Introduction

Memory plays a critical role in digital systems. In many digital applications, it is necessary to access memory from multiple sources simultaneously. Dual Port RAM provides two independent ports that can read from or write to the same memory array at the same time. This capability improves system throughput and allows parallel processing of data.

In this project, a True Dual Port RAM is designed using Verilog HDL. The design contains two ports (Port A and Port B), each with its own address, data input, data output, and write enable signals.

## Objectives

- Design a True Dual Port RAM using Verilog HDL
- Implement synchronous read and write operations
- Verify functionality using a Verilog testbench
- Observe memory behavior using GTKWave waveform viewer

## System Specifications

- Memory Depth: 16 locations
- Data Width: 8 bits
- Address Width: 4 bits
- Number of Ports: 2 (Port A and Port B)
- Clock: Single synchronous clock

Memory Size:

16 locations × 8 bits = 128 bits

## Block Diagram

The block diagram of the Dual Port RAM consists of a shared memory array that can be accessed by two independent ports. Each port has its own address lines, data input, data output, and write enable control.

---

Dual Port RAM Block Diagram

## Verilog RTL Design

```vhdl
module dual_port_ram(
    input clk,

    input [3:0] addr_a,
    input [7:0] din_a,
    input we_a,
    output reg [7:0] dout_a,

    input [3:0] addr_b,
    input [7:0] din_b,
    input we_b,
    output reg [7:0] dout_b
);

reg [7:0] mem [15:0];

always @(posedge clk)
begin

    if(we_a)
        mem[addr_a] <= din_a;

    dout_a <= mem[addr_a];

    if(we_b)
        mem[addr_b] <= din_b;

    dout_b <= mem[addr_b];

end

endmodule

```

## Testbench Design

The testbench generates stimulus signals to test different memory operations such as read, write, and simultaneous access using both ports.

```vhdl
module tb_dual_port_ram;

reg clk;

reg [3:0] addr_a, addr_b;
reg [7:0] din_a, din_b;
reg we_a, we_b;

wire [7:0] dout_a, dout_b;

dual_port_ram dut(
.clk(clk),
.addr_a(addr_a),
.din_a(din_a),
.we_a(we_a),
.dout_a(dout_a),
.addr_b(addr_b),
.din_b(din_b),
.we_b(we_b),
.dout_b(dout_b)
);

always #5 clk = ~clk;

initial
begin

$dumpfile("dual_ram.vcd");
$dumpvars(0, tb_dual_port_ram);

clk = 0;

// Scenario 1
we_a = 1; addr_a = 4; din_a = 8'h55;
we_b = 0;
#10;

// Scenario 2
we_a = 0; addr_a = 4;
#10;

// Scenario 3
we_b = 1; addr_b = 6; din_b = 8'hAA;
#10;

// Scenario 4
we_b = 0; addr_b = 6;
#10;

// Scenario 5
we_a = 1; addr_a = 2; din_a = 8'h33;
we_b = 0; addr_b = 4;
#10;

// Scenario 6
we_a = 1; addr_a = 8; din_a = 8'h11;
we_b = 1; addr_b = 9; din_b = 8'h22;
#10;

// Scenario 7
we_a = 0; addr_a = 8;
we_b = 0; addr_b = 9;
#10;

// Scenario 8
we_a = 0; addr_a = 2;
we_b = 0; addr_b = 2;
#10;

$finish;

end

endmodule

```

## Waveform Output

The simulation waveform generated using GTKWave verifies the correct operation of the Dual Port RAM. The waveform shows clock transitions, address selection, data input, write enable signals, and the corresponding outputs from both ports.

## Conclusion

The Dual Port RAM was successfully designed and simulated using Verilog HDL. The design allows two independent ports to access the same memory array simultaneously. Simulation using Icarus Verilog and GTKWave confirms that the memory performs correct read and write operations for both ports. The project demonstrates how dual port memory architecture enables parallel access and efficient memory utilization in digital systems.
