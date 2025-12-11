module tb_alu;

    reg  [7:0] A, B;
    reg  [2:0] opcode;
    wire [7:0] result;
    wire zero, carry, overflow;

    alu_8bit uut (A, B, opcode, result, zero, carry, overflow);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb_alu);

        A = 8'h15;  
        B = 8'h0A;

        // Test all opcodes
        for (integer i = 0; i < 8; i++) begin
            opcode = i;
            #10;
            $display("Time=%0t opcode=%0b A=%h B=%h result=%h carry=%b zero=%b overflow=%b",
                     $time, opcode, A, B, result, carry, zero, overflow);
        end

        $finish;
    end
endmodule
