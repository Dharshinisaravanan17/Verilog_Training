module tb_barrel_shifter;

reg [7:0] in;
reg [2:0] shamt;
wire [7:0] out;

barrel_shifter uut (.in(in), .shamt(shamt), .out(out));

initial begin
    $dumpfile("dump.vcd"); $dumpvars;

    in=8'b0001_0101; shamt=3'b000; #10;
    shamt=3'b001; #10;  
    shamt=3'b010; #10;  
    shamt=3'b011; #10;  
    shamt=3'b100; #10;

    $finish;
end
endmodule
