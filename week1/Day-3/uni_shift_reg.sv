module uni_shift_reg(
    input wire clk,
    input wire reset,
    input wire [1:0] mode,     // 00=Hold, 01=Right, 10=Left, 11=Load
    input wire [3:0] D,        // Parallel input
    output reg [3:0] Q         // Register output
);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            Q <= 4'b0000;            // Reset
        else begin
            case(mode)
                2'b00: Q <= Q;                       // Hold
                2'b01: Q <= {1'b0, Q[3:1]};          // Shift Right
                2'b10: Q <= {Q[2:0], 1'b0};          // Shift Left
                2'b11: Q <= D;                       // Parallel Load
                default: Q <= Q;
            endcase
        end
    end

endmodule
