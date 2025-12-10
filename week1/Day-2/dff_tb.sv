module dff_tb;
  reg clk, rst, d;
  wire q;

  dff_async uut( .clk(clk), .rst(rst), .d(d), .q(q));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    clk = 0;
    rst = 1;
    d = 0;
    
    #5 rst = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    
    #50 $finish;
  end
  always #5 clk = ~clk;
endmodule
    