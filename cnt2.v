module  cnt2 (
    input clk,          // Clock input (50 MHz)
    input rst,          // Reset input
    output [7:0] HEX00, HEX01,  // Hours on 7-segment displays
    output [7:0] HEX02, HEX03,  // Minutes on 7-segment displays
    output [7:0] HEX04, HEX05   // Seconds on 7-segment displays
);

// Define state encoding
typedef enum logic [1:0] {
    IDLE = 2'b00,
    SECOND = 2'b01,
    MINUTE = 2'b10,
    HOUR = 2'b11
} state_t;

// Registers for time components (hours, minutes, seconds)
reg [5:0] hours;       // 6-bit register to store hours (0-23)
reg [5:0] minutes;     // 6-bit register to store minutes (0-59)
reg [5:0] seconds;     // 6-bit register to store seconds (0-59)

// State register for FSM
reg [1:0] current_state, next_state;

// Clock divider for 1-second interval
reg [25:0] clk_divider, clk_divider_next;

// FSM state transition logic
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        current_state <= IDLE;
        hours <= 0;
        minutes <= 0;
        seconds <= 0;
        clk_divider <= 0;
    end else begin
        current_state <= next_state;
        clk_divider <= clk_divider_next;
    end
end

// FSM logic and time logic
always @ (*) begin
    // Default values
    next_state = current_state;
    clk_divider_next = clk_divider;

    // Default time increments
    hours = hours;
    minutes = minutes;
    seconds = seconds;

    case (current_state)
        IDLE: begin
            // Stay in IDLE state, waiting for reset or clock signal
            next_state = SECOND;
        end

        SECOND: begin
            // Increment seconds
            clk_divider_next = clk_divider + 1;

            if (clk_divider == 24999999) begin  // 1 second passed (50 MHz clock)
                clk_divider_next = 0;
                seconds = seconds + 1;

                if (seconds == 60) begin
                    seconds = 0;
                    next_state = MINUTE;
                end
            end
        end

        MINUTE: begin
            // Increment minutes after 60 seconds
            minutes = minutes + 1;
            
            if (minutes == 60) begin
                minutes = 0;
                next_state = HOUR;
            end

            next_state = SECOND;  // Return to SECOND state to continue
        end

        HOUR: begin
            // Increment hours after 60 minutes
            hours = hours + 1;

            if (hours == 24) begin
                hours = 0;
            end

            next_state = SECOND;  // Return to SECOND state to continue
        end

        default: begin
            next_state = IDLE;
        end
    endcase
end

// BCD Conversion for 7-segment display
// Convert each of hours, minutes, and seconds to BCD and display
assign HEX00 = {4'b0000, hours[5:4]};   // MSB of hours
assign HEX01 = {4'b0000, hours[3:0]};   // LSB of hours

assign HEX02 = {4'b0000, minutes[5:4]}; // MSB of minutes
assign HEX03 = {4'b0000, minutes[3:0]}; // LSB of minutes

assign HEX04 = {4'b0000, seconds[5:4]}; // MSB of seconds
assign HEX05 = {4'b0000, seconds[3:0]}; // LSB of seconds

endmodule
