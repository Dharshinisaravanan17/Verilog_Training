module mod10_tb;

reg clk, rst;
wire [3:0] count;

mod10_counter uut (.clk(clk), .rst(rst), .count(count));

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    clk = 0; rst = 1;
    #10 rst = 0;

    repeat(25) #10;
    $finish;
end

always #5 clk = ~clk;

endmodule
