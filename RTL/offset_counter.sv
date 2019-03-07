`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 09:29:26 AM
// Design Name: 
// Module Name: concatenator
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


module offset_counter(input logic clk, reset, enable,
				      output logic [9:0] count);
	
	// Allows us to choose the number of frames we want to wait from the higher level module
	parameter FRAME_COUNT = 100;
	logic [$clog2(FRAME_COUNT):0] frame_count;
	logic offset_count_enable;
	
	binaryCounter #(.MAXVAL(FRAME_COUNT)) counter_frames(.clk(clk), .reset(reset), .enable(enable), .out(frame_count)); // Count frames
	
	binaryCounter #(.MAXVAL(1024)) counter_10bit(.clk(clk), .reset(reset), .enable(offset_count_enable), .out(count)); // Count for the memory offset
	
	always_comb begin // If we have reached x number of frames, updated the offset by 1
		if(frame_count == FRAME_COUNT) offset_count_enable = 1;
		else offset_count_enable = 0;
	end
endmodule
