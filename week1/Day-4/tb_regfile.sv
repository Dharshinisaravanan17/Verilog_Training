module tb_regfile;

reg clk;
reg wr_en;
reg [2:0] wr_addr;
reg [7:0] wr_data;

reg [2:0] rd_addr1, rd_addr2;
wire [7:0] rd_data1, rd_data2;

regfile_8x8 uut (
    .clk(clk),
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr1(rd_addr1),
    .rd_data1(rd_data1),
    .rd_addr2(rd_addr2),
    .rd_data2(rd_data2)
);

// clock
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0;

    // Write 4 values
    wr_en=1;
    wr_addr=3; wr_data=8'hAA; #10;
    wr_addr=5; wr_data=8'h55; #10;
    wr_addr=1; wr_data=8'hCC; #10;
    wr_addr=7; wr_data=8'h12; #10;

    wr_en=0;

    // Read back
    rd_addr1=3; rd_addr2=5; #10;
    rd_addr1=1; rd_addr2=7; #10;

    $finish;
end

endmodule
