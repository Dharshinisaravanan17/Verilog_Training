module traffic_tb;
    reg clk, rst;
    wire [1:0] light;

    traffic_light uut (.clk(clk), .rst(rst), .light(light));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        clk = 0;
        rst = 1;
        #10 rst = 0;

        #200 $finish;
    end

    always #5 clk = ~clk;
endmodule
