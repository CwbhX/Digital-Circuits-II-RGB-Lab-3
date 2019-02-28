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
	
	binaryCounter #(.MAXVAL(1024)) counter_10bit(.clk(clk), .reset(reset), .enable(enable), .out(count));
	
	
endmodule
