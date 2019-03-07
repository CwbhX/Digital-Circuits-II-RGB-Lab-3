`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2019 09:16:30 AM
// Design Name: 
// Module Name: Top_Simulation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_Simulation();
	// Inputs
	logic clk;
	logic reset;
	
	// Outputs
    logic [2:0] LED_Top;
    logic [2:0] LED_Bottom;
	logic [2:0] row_select;
	logic sclk, latch, blank;
	
	// Clock signal
	initial
	forever begin
		clk = 0; #10; clk = 1; #10;
	end
	
	// Instantiate the Top 
    top uut(.clk(clk), .reset(reset),
            .sclk(sclk),
            .latch(latch),
            .blank(blank),
            .LED_Top(LED_Top),
			.LED_Bottom(LED_Bottom),
			.row_select(row_select));
			
	// Start the test
	initial begin
		reset = 1;
		#100;
		reset = 0;
		repeat (3000) @(posedge clk); #1; // Repeat 3000 times I think
		$stop;
    end
	
endmodule
