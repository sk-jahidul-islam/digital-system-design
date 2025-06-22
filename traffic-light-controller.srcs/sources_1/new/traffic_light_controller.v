`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 07:19:28 PM
// Design Name: 4-Way Traffic Light Controller
// Module Name: traffic_light_controller
// Project Name: FPGA Implementation of an FSM-based Traffic Light Controller
// Target Devices: Artix-7
// Tool Versions: Vivado 2025.1
// Description: 
//    FSM-based traffic light controller for North, South, East, and West directions.
//    Each direction has defined green, yellow, and red timing controlled by clock cycles.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] north, // RYG
    output reg [2:0] east,
    output reg [2:0] south,
    output reg [2:0] west
);
    reg [3:0] state = 0;
    reg [23:0] counter = 0; // Adjust width for timing

    parameter GREEN_TIME = 10_000_000; // 10M clock cycles ~10s @ 1MHz
    parameter YELLOW_TIME = 3_000_000; // ~3s

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 0;
            counter <= 0;
        end else begin
            counter <= counter + 1;
            case(state)
                0: begin // North Green
                    north = 3'b010;
                    east = 3'b100;
                    south = 3'b100;
                    west = 3'b100;
                    if (counter >= GREEN_TIME) begin
                        state <= 1; counter <= 0;
                    end
                end
                1: begin // North Yellow
                    north = 3'b001;
                    if (counter >= YELLOW_TIME) begin
                        state <= 2; counter <= 0;
                    end
                end
                2: begin // East Green
                    east = 3'b010;
                    north = 3'b100;
                    south = 3'b100;
                    west = 3'b100;
                    if (counter >= GREEN_TIME) begin
                        state <= 3; counter <= 0;
                    end
                end
                3: begin // East Yellow
                    east = 3'b001;
                    if (counter >= YELLOW_TIME) begin
                        state <= 4; counter <= 0;
                    end
                end
                4: begin // South Green
                    south = 3'b010;
                    north = 3'b100;
                    east = 3'b100;
                    west = 3'b100;
                    if (counter >= GREEN_TIME) begin
                        state <= 5; counter <= 0;
                    end
                end
                5: begin // South Yellow
                    south = 3'b001;
                    if (counter >= YELLOW_TIME) begin
                        state <= 6; counter <= 0;
                    end
                end
                6: begin // West Green
                    west = 3'b010;
                    north = 3'b100;
                    east = 3'b100;
                    south = 3'b100;
                    if (counter >= GREEN_TIME) begin
                        state <= 7; counter <= 0;
                    end
                end
                7: begin // West Yellow
                    west = 3'b001;
                    if (counter >= YELLOW_TIME) begin
                        state <= 0; counter <= 0;
                    end
                end
                default: begin
                    north = 3'b100;
                    east = 3'b100;
                    south = 3'b100;
                    west = 3'b100;
                    state = 0;
                end
            endcase
        end
    end
endmodule

