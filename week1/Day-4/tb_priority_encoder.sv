module tb_priority_encoder;
reg [3:0] in;
wire [1:0] out;

priority_encoder_4 uut (.in(in), .out(out));

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    in=4'b0000; #10;
    in=4'b0001; #10;
    in=4'b0010; #10;
    in=4'b0100; #10;
    in=4'b1000; #10;
    in=4'b1010; #10;  // msb=1 so output = 3

    $finish;
end
endmodule
