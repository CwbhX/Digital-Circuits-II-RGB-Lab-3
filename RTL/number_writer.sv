`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2019 03:53:23 PM
// Design Name: 
// Module Name: number_writer
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


module number_writer(input logic clk, rst,
                     input logic [3:0] number,
                     input logic [2:0] colour,
                     output logic [31:0] data_out,
                     output logic [9:0] write_addr,
                     output logic write_enable);
endmodule
