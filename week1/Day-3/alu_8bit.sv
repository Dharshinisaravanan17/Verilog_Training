module alu_8bit(
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] opcode,
    output reg  [7:0] result,
    output reg zero,
    output reg carry,
    output reg overflow
);

    reg [8:0] temp;  // for carry

    always @(*) begin
        carry = 0;
        overflow = 0;

        case(opcode)
            3'b000: begin // ADD
                temp = A + B;
                result = temp[7:0];
                carry = temp[8];
                overflow = (A[7] == B[7]) && (result[7] != A[7]);
            end

            3'b001: begin // SUB
                temp = A - B;
                result = temp[7:0];
                carry = temp[8];
                overflow = (A[7] != B[7]) && (result[7] != A[7]);
            end

            3'b010: result = A & B;      // AND
            3'b011: result = A | B;      // OR
            3'b100: result = A ^ B;      // XOR
            3'b101: result = ~A;         // NOT
            3'b110: result = A << 1;     // Shift Left
            3'b111: result = A >> 1;     // Shift Right

            default: result = 8'b0;
        endcase

        zero = (result == 8'b0);
    end

endmodule
