module regfile_8x8(
  input wire clk,
  input wire wr_en,
  input wire[2:0] wr_addr,
  input wire[7:0] wr_data,
  
  input wire[2:0] rd_addr1,
  output wire[7:0] rd_data1,
  
   input  wire[2:0]  rd_addr2,
    output wire[7:0]  rd_data2 
);
  reg[7:0] mem[7:0];
  //Write 
  always @(posedge clk) begin
    if(wr_en)
      mem[wr_addr] <=wr_data;
  end
  //Read(asynchronous)
  assign rd_data1 = mem[rd_data1];
  assign rd_data2 = mem[rd_addr2];
endmodule