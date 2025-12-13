module regfile (
  input wire clk,
  input wire we,
  input wire [2:0] wr_addr,
  input wire [7:0] wr_data,
  input wire [2:0] rd_addr1,
  input wire [2:0] rd_addr2,
  output wire [7:0] rd_data1,
  output wire [7:0] rd_data2
);

  reg [7:0] mem [7:0];

  always @(posedge clk) begin
    if (we)
      mem[wr_addr] <= wr_data;
  end

  assign rd_data1 = mem[rd_addr1];
  assign rd_data2 = mem[rd_addr2];

endmodule
module alu_8bit (
  input wire [7:0] A, B,
  input wire [2:0] opcode,
  output reg [7:0] result
);

  always @(*) begin
    case (opcode)
      3'b000: result = A + B;
      3'b001: result = A - B;
      3'b010: result = A & B;
      3'b011: result = A | B;
      3'b100: result = A ^ B;
      default: result = 8'b0;
    endcase
  end

endmodule
module wb_mux (
  input wire sel,
  input wire [7:0] alu_out,
  input wire [7:0] imm_data,
  output wire [7:0] wb_data
);

  assign wb_data = sel ? imm_data : alu_out;

endmodule
module simple_datapath (
  input wire clk,
  input wire we,
  input wire [2:0] rs1,
  input wire [2:0] rs2,
  input wire [2:0] rd,
  input wire [2:0] opcode,
  input wire wb_sel,
  input wire [7:0] imm_data
);

  wire [7:0] opA, opB;
  wire [7:0] alu_out;
  wire [7:0] wb_data;

  regfile RF (
    .clk(clk),
    .we(we),
    .wr_addr(rd),
    .wr_data(wb_data),
    .rd_addr1(rs1),
    .rd_addr2(rs2),
    .rd_data1(opA),
    .rd_data2(opB)
  );

  alu_8bit ALU (
    .A(opA),
    .B(opB),
    .opcode(opcode),
    .result(alu_out)
  );

  wb_mux MUX (
    .sel(wb_sel),
    .alu_out(alu_out),
    .imm_data(imm_data),
    .wb_data(wb_data)
  );

endmodule
