`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 07:23:40 PM
// Design Name: Traffic Light Controller Testbench
// Module Name: traffic_tb
// Project Name: FPGA Implementation of an FSM-based Traffic Light Controller
// Target Devices: Artix-7
// Tool Versions: Vivado 2025.1
// Description: 
//     Testbench for simulating the functionality of a 4-way traffic light controller
//     using a finite state machine. Simulates clock and reset signals to verify
//     traffic light sequences (Green, Yellow, Red) for North, East, South, and West.
// Dependencies: traffic_light_controller.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module traffic_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [2:0] north;
    wire [2:0] east;
    wire [2:0] south;
    wire [2:0] west;

    // Instantiate the Unit Under Test (UUT)
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .north(north),
        .east(east),
        .south(south),
        .west(west)
    );

    // Clock generation: 10ns period = 100MHz
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;

        // Hold reset for 2 cycles
        #20;
        reset = 0;

        // Let simulation run for a while
        #200000000;  // Simulate for sufficient time (~200ms)

        // End simulation
        $stop;
    end

endmodule

