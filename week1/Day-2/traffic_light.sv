module traffic_light (
    input wire clk,
    input wire rst,
    output reg [1:0] light   // 00=Red, 01=Green, 10=Yellow
);

    reg [3:0] timer;
    reg [1:0] state;

    localparam RED = 2'b00,
               GREEN = 2'b01,
               YELLOW = 2'b10;

    always @(posedge clk) begin
        if (rst) begin
            state <= RED;
            timer <= 0;
        end
        else begin
            case (state)
                RED: begin
                    if (timer == 4) begin
                        state <= GREEN;
                        timer <= 0;
                    end else timer <= timer + 1;
                end

                GREEN: begin
                    if (timer == 4) begin
                        state <= YELLOW;
                        timer <= 0;
                    end else timer <= timer + 1;
                end

                YELLOW: begin
                    if (timer == 1) begin
                        state <= RED;
                        timer <= 0;
                    end else timer <= timer + 1;
                end
            endcase
        end
        light <= state;
    end

endmodule
