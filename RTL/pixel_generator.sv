`timescale 1ns / 1ps

module pixel_generator(input logic clk, reset,
                       input logic [4:0] col_count,
					   input logic [2:0] row_count,
					  output logic [2:0] LED_Top, LED_Bottom);
	
	always_ff @(posedge clk) begin
		if(reset) begin
			LED_Top <= 3'b000;
			LED_Bottom <= 3'b000;
		end else begin
			case(row_count)
				3'd0: begin
					LED_Top <= 3'b111;    // White
					LED_Bottom <= 3'b111; // White
				end
				3'd1: begin
					LED_Top <= 3'b000;    // Black
					LED_Bottom <= 3'b000; // Black
				end
				3'd2: begin
					LED_Top <= 3'b100;     // Red
					LED_Bottom <= 3'b100;  // Red
				end
				3'd3: begin
					LED_Top <= 3'b110;     // Yellow
					LED_Bottom <= 3'b110;  // Yellow
				end
				3'd4: begin
					LED_Top <= 3'b010;     // Green
					LED_Bottom <= 3'b010;  // Green
				end
				3'd5: begin
					LED_Top <= 3'b011;     // Cyan
					LED_Bottom <= 3'b011;  // Cyan
				end
				3'd6: begin
					LED_Top <= 3'b001;     // Blue
					LED_Bottom <= 3'b001;  // Blue
				end
				3'd7: begin
					LED_Top <= 3'b101;     // Magenta
					LED_Top <= 3'b101;     // Magenta
				end
			endcase
		end
	end
endmodule