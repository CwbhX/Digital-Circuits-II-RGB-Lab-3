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
                     
    typedef enum logic [5:0] {IDLE, W1, W2, W3, W4, W5} write_trans_table;
    write_trans_table write_trans_state;
    
    logic [2:0] write_row;
    logic [4:0] write_col;
    
    concatenator address_concat(.rst(rst), .row_count(write_row), .col_count(write_col), .offset(0), .address(write_addr));
    
    logic [3:0] oldnum;
    
    always_ff @(posedge clk)begin
        if(rst) begin
            write_trans_state <= IDLE;
            data_out          <= 32'b0;
            write_addr        <= 10'b0;
            write_enable      <= 0;
        end
    end
    
    always_comb begin
        case (write_trans_state)
            IDLE: begin
                data_out          <= 32'b0;
                write_addr        <= 10'b0;
                write_enable      <= 0;
                
                if(number != oldnum) write_trans_state = W1;
                else write_trans_state = IDLE;
            end
            W1: begin
                
            end
            W2: begin
            
            end
            W3: begin
            
            end
            W4: begin
            
            end
            W5: begin
            
            end
            default: write_trans_state = IDLE;
        endcase
    end 
                     
endmodule

// Second Module for generating the data for each row and column
module number_gen(input logic rst,
                  input logic [3:0] number,
                  input logic [2:0] write_row,
                  input logic [2:0] write_col,  // Give relative column e.g. 0-4
                  output logic [7:0] col_data);
    always_comb begin
        case(number)  // Switch on number, then on column to get column data
            4'd0:begin // 0
                case(write_col)
                    3'd0: col_data = 8'b01111110;
                    3'd1: col_data = 8'b10000001;
                    3'd2: col_data = 8'b10000001;
                    3'd3: col_data = 8'b10000001;
                    3'd4: col_data = 8'b01111110;
                    default: col_data = 8'd0;
                endcase
            end
            4'd1:begin // 1
                case(write_col)
                    3'd0: col_data = 8'b00000000;
                    3'd1: col_data = 8'b01000001;
                    3'd2: col_data = 8'b11111111;
                    3'd3: col_data = 8'b00000001;
                    3'd4: col_data = 8'b00000000;
                    default: col_data = 8'd0;
                endcase
            end
            4'd2:begin // 2
                case(write_col)
                    3'd0: col_data = 8'b01000011;
                    3'd1: col_data = 8'b10000101;
                    3'd2: col_data = 8'b10001001;
                    3'd3: col_data = 8'b10010001;
                    3'd4: col_data = 8'b01100001;
                    default: col_data = 8'd0;
                endcase
            end
            4'd3:begin // 3
                case(write_col)
                    3'd0: col_data = 8'b01000010;
                    3'd1: col_data = 8'b10000001;
                    3'd2: col_data = 8'b10010001;
                    3'd3: col_data = 8'b10010001;
                    3'd4: col_data = 8'b01101110;
                    default: col_data = 8'd0;
                endcase
            end
            4'd4:begin // 4
                case(write_col)
                    3'd0: col_data = 8'b11110000;
                    3'd1: col_data = 8'b00010000;
                    3'd2: col_data = 8'b00010000;
                    3'd3: col_data = 8'b00010000;
                    3'd4: col_data = 8'b11111111;
                    default: col_data = 8'd0;
                endcase
            end
            4'd5:begin // 5
                case(write_col)
                    3'd0: col_data = 8'b11110010;
                    3'd1: col_data = 8'b10010001;
                    3'd2: col_data = 8'b10010001;
                    3'd3: col_data = 8'b10010001;
                    3'd4: col_data = 8'b10001110;
                    default: col_data = 8'd0;
                endcase
            end
            4'd6:begin  // 6
                case(write_col)
                    3'd0: col_data = 8'b00011110;
                    3'd1: col_data = 8'b00110001;
                    3'd2: col_data = 8'b01010001;
                    3'd3: col_data = 8'b10010001;
                    3'd4: col_data = 8'b00001110;
                    default: col_data = 8'd0;
                endcase
            end
            4'd7:begin // 7
                case(write_col)
                    3'd0: col_data = 8'b10000000;
                    3'd1: col_data = 8'b10000011;
                    3'd2: col_data = 8'b10001100;
                    3'd3: col_data = 8'b10110000;
                    3'd4: col_data = 8'b11000000;
                    default: col_data = 8'd0;
                endcase
            end
            4'd8:begin // 8
                case(write_col)
                    3'd0: col_data = 8'b01101110;
                    3'd1: col_data = 8'b10010001;
                    3'd2: col_data = 8'b10010001;
                    3'd3: col_data = 8'b10010001;
                    3'd4: col_data = 8'b01101110;
                    default: col_data = 8'd0;
                endcase
            end
            4'd9:begin // 9
                case(write_col)
                    3'd0: col_data = 8'b01100000;
                    3'd1: col_data = 8'b10010000;
                    3'd2: col_data = 8'b10010000;
                    3'd3: col_data = 8'b10010000;
                    3'd4: col_data = 8'b01111111;
                    default: col_data = 8'd0;
                endcase
            end
            default: col_data = 8'd0;
        endcase
    end
    
endmodule