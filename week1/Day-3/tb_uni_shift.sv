module tb_uni_shift;

    reg clk, reset;
    reg [1:0] mode;
    reg [3:0] D;
    wire [3:0] Q;

    uni_shift_reg uut(clk, reset, mode, D, Q);

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_uni_shift);

        reset = 1; #10;
        reset = 0;

        // Parallel Load 1010
        mode = 2'b11; D = 4'b1010; #10;

        // Hold
        mode = 2'b00; #10;

        // Shift Right 2 cycles
        mode = 2'b01; #20;

        // Shift Left 2 cycles
        mode = 2'b10; #20;

        $finish;
    end

endmodule
