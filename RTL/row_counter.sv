`timescale 1ns / 1ps

module row_counter(input logic clk, reset, enable,
                  output logic [2:0] count);
	
	binaryCounter #(.MAXVAL(8)) counter_3bit(.clk(clk), .reset(reset), .enable(enable), .out(count));

endmodule			  