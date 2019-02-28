`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 08:22:19 AM
// Design Name: 
// Module Name: binaryCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Counts up in binary from 0 to some maximum value
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module binaryCounter(
        input logic clk, reset, // clk and reset
        input logic enable,     // the counter will only increment when this signal is high
        output logic [$clog2(MAXVAL) - 1 : 0] out
);

parameter MAXVAL = 32; // The value we want to count up to 

logic [$clog2(MAXVAL):0] count; // register which stores the current count

always_ff @(posedge clk, posedge reset) begin : proc_
    if(reset | count == MAXVAL) begin
        count <= 0;
    end else if(enable) begin
        count <= count + 1;
    end else begin
        count <= count;
    end
    end

    assign out = count;

endmodule
