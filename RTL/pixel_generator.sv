`timescale 1ns / 1ps

module pixel_generator(input logic clk, reset,
                       input logic [4:0] col_count,
					   input logic [2:0] row_count,
					   input logic [9:0] offset,
					  output logic [2:0] LED_Top, LED_Bottom);
	
	logic [12:0] read_addr;
	concatenator address_concat(.reset(reset), .row_count(row_count), .col_count(col_count), .offset(offset), .address(read_addr));
	
	
	always_ff @(posedge clk) begin
		if(reset) begin
			LED_Top <= 3'b000;
			LED_Bottom <= 3'b000;
		end else begin
			
		end
	end
endmodule