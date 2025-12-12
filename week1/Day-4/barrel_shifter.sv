/*Concept

Shift by 1,2,4… stages for shamt.

Example: shamt=3 → shift by 3 bits.*/

module barrel_shifter #(parameter N = 8)(
    input  wire [N-1:0] in,
    input  wire [2:0]   shamt,
    output reg  [N-1:0] out
);
always @(*) begin
    out = in;
    if (shamt[0]) out = out << 1;
    if (shamt[1]) out = out << 2;
    if (shamt[2]) out = out << 4;
end

endmodule
