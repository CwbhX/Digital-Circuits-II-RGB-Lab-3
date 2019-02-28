`timescale 1ns / 1ps

module top(input logic clk, reset_button,
		  output logic sclk, latch, blank,
		  output logic [2:0] LED_Top, LED_Bottom, row_select);
	
	// Debounce the reset button
	logic reset_debounced;
	debounce debouncer(.clk(clk), .pb(reset_button), .rst(0), .pb_debounced(reset_debounced));
	
	// Setup the delay enable signal
	logic delay_enable;
	delay_enb #(.DELAY_NS(300)) delay_enabler(.clk(clk), .rst(reset_debounced), .clr(0), .enb_out(delay_enable));
	
	// Setup the row counter module
	logic row_counter_enable;
	logic [2:0] row_count;
	row_counter row_counter(.clk(clk), .reset(reset_debounced), .enable(row_counter_enable), .count(row_count));
	
	// Setup the column counter module
	logic col_counter_enable, row_filled;
	logic [4:0] col_count;
	col_counter col_counter(.clk(clk), .reset(reset_debounced), .enable(col_counter_enable), .row_filled(row_filled), .count(col_count));
	
	// Setup the offset counter module
	logic offset_counter_enable;
	logic [9:0] offset_count;
	offset_counter offset_counter(.clk(clk), .reset(reset_debounced), .enable(offset_counter_enable), .count(offset_count));
	
	// Setup the pixel-gen module
	pixel_generator pixel_generator(.clk(clk), .reset(reset_debounced), .col_count(col_count), .row_count(row_count), .LED_Top(LED_Top), .LED_Bottom(LED_Bottom));
	
	// Setup the main FSM
	fsm main_fsm(.clk(clk), .reset(reset_debounced), .delay_enb(delay_enable), .col_count(col_count), .row_count(row_count), .row_filled(row_filled),
	             .col_counter_enb(col_counter_enable), .row_counter_enb(row_counter_enable), .offset_counter_enable(offset_counter_enable),
				 .sclk(sclk), .blank(blank), .latch(latch));
	
endmodule