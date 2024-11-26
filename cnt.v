module cnt(
    input clk, 
    input rst, 
    input [2:0] opcode, // 3-bit opcode input
    input valid,        // Input flag to validate the opcode
    output [7:0] cnt    // 8-bit counter output
);

reg [25:0] cnt50_reg, cnt50_nxt;
reg [7:0]  cnt_reg, cnt_nxt;
reg enable; // Signal to enable counting

// Opcodes (One-hot encoding)
localparam START = 3'b001,
           PAUSE = 3'b010,
           STOP  = 3'b100;

// Control logic: Update enable based on opcode
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        enable <= 0;
    end else if (valid) begin
        case (opcode)
            START: enable <= 1;
            PAUSE: enable <= 0;
            STOP: begin
                enable <= 0;
                cnt_nxt <= 0; // Reset counter on STOP
            end
            default: enable <= enable; // No change for invalid opcodes
        endcase
    end
end

// Counter logic
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        cnt50_reg <= 0;
        cnt_reg <= 0;
    end else begin
        cnt50_reg <= cnt50_nxt;
        cnt_reg <= cnt_nxt;
    end
end

always @ (*) begin
    cnt50_nxt = cnt50_reg;
    cnt_nxt = cnt_reg;
    if (enable) begin
        if (cnt50_reg == 24999999) begin
            cnt50_nxt = 0;
            cnt_nxt = cnt_reg + 1;
        end else begin
            cnt50_nxt = cnt50_reg + 1;
        end
    end
end

assign cnt = cnt_reg;

endmodule
