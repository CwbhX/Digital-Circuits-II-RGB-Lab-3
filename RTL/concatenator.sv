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


module concatenator(input logic reset,
					input logic [2:0] row_count,
                    input logic [4:0] col_count,
					input logic [9:0] offset,
					output logic [12:0] address);
	
	always_comb begin
        if(reset) address = 13'd0;
        else begin											    //   column   row
            assign address = {(col_count + offset), row_count}; // xxxxxxxxxx xxx 13 bit address returned
        end
	end			
endmodule
