`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 08:48:43 AM
// Design Name: 
// Module Name: RAM
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


module RAM_Top(input logic [31:0] data_in,
               input logic [9:0] write_addr,
               input logic write_enable,
               input logic [12:0] read_addr,
               output logic [3:0] data_out,
               input logic clk, RST);  
               
    assign WE = 4'b1111;
    assign RDEN = 4'b1;
    assign REGCE = 1'b0;
                 
    // BRAM_SDP_MACRO : In order to incorporate this function into the design,
    //   Verilog   : the following instance declaration needs to be placed
    //  instance   : in the body of the design code.  The instance name
    // declaration : (BRAM_SDP_MACRO_inst) and/or the port declarations within the
    //    code     : parenthesis may be changed to properly reference and
    //             : connect this function to the design.  All inputs
    //             : and outputs must be connected.
    
    //  <-----Cut code below this line---->
    
       // BRAM_SDP_MACRO: Simple Dual Port RAM
       //                 Artix-7
       // Xilinx HDL Language Template, version 2016.2
       
       ///////////////////////////////////////////////////////////////////////
       //  READ_WIDTH | BRAM_SIZE | READ Depth  | RDADDR Width |            //
       // WRITE_WIDTH |           | WRITE Depth | WRADDR Width |  WE Width  //
       // ============|===========|=============|==============|============//
       //    37-72    |  "36Kb"   |      512    |     9-bit    |    8-bit   //
       //    19-36    |  "36Kb"   |     1024    |    10-bit    |    4-bit   //
       //    19-36    |  "18Kb"   |      512    |     9-bit    |    4-bit   //
       //    10-18    |  "36Kb"   |     2048    |    11-bit    |    2-bit   //
       //    10-18    |  "18Kb"   |     1024    |    10-bit    |    2-bit   //
       //     5-9     |  "36Kb"   |     4096    |    12-bit    |    1-bit   //
       //     5-9     |  "18Kb"   |     2048    |    11-bit    |    1-bit   //
       //     3-4     |  "36Kb"   |     8192    |    13-bit    |    1-bit   //
       //     3-4     |  "18Kb"   |     4096    |    12-bit    |    1-bit   //
       //       2     |  "36Kb"   |    16384    |    14-bit    |    1-bit   //
       //       2     |  "18Kb"   |     8192    |    13-bit    |    1-bit   //
       //       1     |  "36Kb"   |    32768    |    15-bit    |    1-bit   //
       //       1     |  "18Kb"   |    16384    |    14-bit    |    1-bit   //
       ///////////////////////////////////////////////////////////////////////
    
       BRAM_SDP_MACRO #(
          .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb" 
          .DEVICE("7SERIES"), // Target device: "7SERIES" 
          .WRITE_WIDTH(32),    // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
          .READ_WIDTH(4),     // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
          .DO_REG(0),         // Optional output register (0 or 1)
          .INIT_FILE ("NONE"),
          .SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY", 
                                        //   "GENERATE_X_ONLY" or "NONE" 
          .SRVAL(72'h000000000000000000), // Set/Reset value for port output
          .INIT(72'h000000000000000000),  // Initial values on output port
          .WRITE_MODE("WRITE_FIRST"),  // Specify "READ_FIRST" for same clock or synchronous clocks
                                       //   Specify "WRITE_FIRST for asynchronous clocks on ports
       .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
       .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000), 
       .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
       .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
       .INIT_04(256'h10000004_01226640_00000000_10000004_10006004_10006004_10006004_11226644),
       .INIT_05(256'h10006004_10006004_10006004_11226644_00000000_01000040_10000004_10000004),
       .INIT_06(256'h10020004_10200004_11000040_00000000_00000000_00000000_00000000_10000004),
       .INIT_07(256'h11000040_00000000_10000000_11226644_10000040_00000000_10000640_10006004),
       .INIT_08(256'h00000000_00000000_00000000_00000000_10000640_10006004_10020004_10200004),
          .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          
          // The next set of INIT_xx are valid when configured as 36Kb
          .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
          
          // The next set of INITP_xx are for the parity bits
          .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
          
          // The next set of INITP_xx are valid when configured as 36Kb
          .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
          .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)
       ) BRAM_SDP_MACRO_inst (
          .DO(data_out),         // Output read data port, width defined by READ_WIDTH parameter
          .DI(data_in),         // Input write data port, width defined by WRITE_WIDTH parameter
          .RDADDR(read_addr), // Input read address, width defined by read port depth
          .RDCLK(clk),   // 1-bit input read clock
          .RDEN(RDEN),     // 1-bit input read port enable
          .REGCE(REGCE),   // 1-bit input read output register enable
          .RST(RST),       // 1-bit input reset      
          .WE(WE),         // Input write enable, width defined by write port depth
          .WRADDR(write_addr), // Input write address, width defined by write port depth
          .WRCLK(clk),   // 1-bit input write clock
          .WREN(write_enable)      // 1-bit input write port enable
       );
    
       // End of BRAM_SDP_MACRO_inst instantiation

endmodule
