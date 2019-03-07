`timescale 1ns / 1ps

module col_counter(input logic clk, reset, enable,
                  output logic row_filled, [4:0] count);
	
	binaryCounter #(.MAXVAL(32)) counter_5bit(.clk(clk), .reset(reset), .enable(enable), .out(count));

	always_comb begin
	   if(reset) row_filled <= 0;
	   else if(count == 5'b11111) row_filled <= 1;
       else row_filled <= 0;
    end
endmodule