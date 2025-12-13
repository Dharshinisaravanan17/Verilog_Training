`timescale 1ns/1ps

module tb_simple_datapath;

  reg clk;
  reg we;
  reg [2:0] rs1, rs2, rd;
  reg [2:0] opcode;
  reg wb_sel;
  reg [7:0] imm_data;

  // DUT
  simple_datapath dut (
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .opcode(opcode),
    .wb_sel(wb_sel),
    .imm_data(imm_data)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Dump waveform
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_simple_datapath);

    // Init
    clk = 0;
    we  = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    opcode = 0;
    wb_sel = 0;
    imm_data = 0;

    // -------------------------
    // WRITE R1 = 10
    // -------------------------
    #10;
    we = 1;
    rd = 3'd1;
    wb_sel = 1;        // select immediate
    imm_data = 8'd10;

    #10;   // clock edge writes

    // -------------------------
    // WRITE R2 = 5
    // -------------------------
    rd = 3'd2;
    imm_data = 8'd5;

    #10;

    // -------------------------
    // ADD R1 + R2 → R3
    // -------------------------
    we = 1;
    rs1 = 3'd1;
    rs2 = 3'd2;
    rd  = 3'd3;
    opcode = 3'b000;   // ADD
    wb_sel = 0;        // select ALU

    #10;

    // -------------------------
    // SUB R1 - R2 → R4
    // -------------------------
    rd = 3'd4;
    opcode = 3'b001;   // SUB

    #10;

    // -------------------------
    // Finish
    // -------------------------
    we = 0;
    #20;
    $finish;
  end

endmodule
