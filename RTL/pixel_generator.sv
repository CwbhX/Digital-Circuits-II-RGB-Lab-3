`timescale 1ns / 1ps

module pixel_generator(input logic clk, reset,
                       input logic [4:0] col_count,
					   input logic [2:0] row_count,
					   input logic [9:0] offset,
					  output logic [2:0] LED_Top, LED_Bottom);
	
	logic [12:0] read_addr;
	concatenator address_concat(.reset(reset), .row_count(row_count), .col_count(col_count), .offset(offset), .address(read_addr));
	
	// Setup Top half of the matrix RAM Module
	logic [31:0] top_data_in;
	logic [9:0]  top_write_addr;
	logic        top_write_enable;
	logic [12:0] top_read_addr;
	logic [3:0]  top_data_out;
	RAM_Top RAM_Top(.data_in(top_data_in), .write_addr(top_write_addr), .write_enable(top_write_enable), .read_addr(top_read_addr), .data_out(top_data_out), .clk(clk));
	
	// Setup Bottom half of the matrix RAM Module
	logic [31:0] bottom_data_in;
	logic [9:0]  bottom_write_addr;
	logic        bottom_write_enable;
	logic [12:0] bottom_read_addr;
	logic [3:0]  bottom_data_out;
	RAM_Bottom RAM_Bottom(.data_in(bottom_data_in), .write_addr(bottom_write_addr), .write_enable(bottom_write_enable), .read_addr(bottom_read_addr), .data_out(bottom_data_out), .clk(clk));
	
	
	
	always_ff @(posedge clk) begin
		if(reset) begin
			LED_Top <= 3'b000;
			LED_Bottom <= 3'b000;
		end else begin
			
		end
	end
endmodule