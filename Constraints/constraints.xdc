# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
#Pmod Header JA
    #Bank = 15, Pin name = IO_L1N_T0_AD0N_15,                    Sch name = JA1
    set_property PACKAGE_PIN B13 [get_ports {LED_Top[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Top[0]}]
    #Bank = 15, Pin name = IO_L5N_T0_AD9N_15,                    Sch name = JA2
    set_property PACKAGE_PIN F14 [get_ports {LED_Top[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Top[1]}]
    #Bank = 15, Pin name = IO_L16N_T2_A27_15,                    Sch name = JA3
    set_property PACKAGE_PIN D17 [get_ports {LED_Top[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Top[2]}]
    #Bank = 15, Pin name = IO_0_15,                              Sch name = JA7
    set_property PACKAGE_PIN G13 [get_ports {LED_Bottom[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Bottom[0]}]
    #Bank = 15, Pin name = IO_L20N_T3_A19_15,                    Sch name = JA8
    set_property PACKAGE_PIN C17 [get_ports {LED_Bottom[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Bottom[1]}]
    #Bank = 15, Pin name = IO_L21N_T3_A17_15,                    Sch name = JA9
    set_property PACKAGE_PIN D18 [get_ports {LED_Bottom[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {LED_Bottom[2]}]
        
#Pmod Header JB
    #Bank = 15, Pin name = IO_L15N_T2_DQS_ADV_B_15,               Sch name = JB1
    set_property PACKAGE_PIN G14 [get_ports {row_select[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {row_select[0]}]
    #Bank = 14, Pin name = IO_L13P_T2_MRCC_14,                    Sch name = JB2
    set_property PACKAGE_PIN P15 [get_ports {row_select[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {row_select[1]}]
    #Bank = 14, Pin name = IO_L21N_T3_DQS_A06_D22_14,             Sch name = JB3
    set_property PACKAGE_PIN V11 [get_ports {row_select[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {row_select[2]}]
    #Bank = 15, Pin name = IO_25_15,                              Sch name = JB7
    set_property PACKAGE_PIN K16 [get_ports {sclk}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {sclk}]
    #Bank = CONFIG, Pin name = IO_L15P_T2_DQS_RWR_B_14,           Sch name = JB8
    set_property PACKAGE_PIN R16 [get_ports {blank}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {blank}]
    #Bank = 14, Pin name = IO_L24P_T3_A01_D17_14,                 Sch name = JB9
    set_property PACKAGE_PIN T9 [get_ports {latch}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {latch}]
        
##Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
        set_property PACKAGE_PIN E16 [get_ports reset]                        
            set_property IOSTANDARD LVCMOS33 [get_ports reset]