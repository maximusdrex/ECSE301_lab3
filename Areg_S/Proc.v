//
// Verilog description for cell Areg, 
// Mon Mar 21 11:32:11 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Areg ( adder, control, clock, A_out ) ;

    input [3:0]adder ;
    input [1:0]control ;
    input clock ;
    output [3:0]A_out ;

    wire nx4, nx10, nx32, nx42, nx52, nx109, nx111, nx121, nx131, nx141, nx163;
    wire [3:0] \$dummy ;




    dff reg_A_out_0 (.Q (A_out[0]), .QB (\$dummy [0]), .D (nx141), .CLK (clock)
        ) ;
    mux21_ni ix142 (.Y (nx141), .A0 (A_out[0]), .A1 (nx52), .S0 (nx4)) ;
    ao22 ix53 (.Y (nx52), .A0 (control[1]), .A1 (A_out[1]), .B0 (adder[0]), .B1 (
         nx10)) ;
    dff reg_A_out_1 (.Q (A_out[1]), .QB (\$dummy [1]), .D (nx131), .CLK (clock)
        ) ;
    mux21_ni ix132 (.Y (nx131), .A0 (A_out[1]), .A1 (nx42), .S0 (nx4)) ;
    ao22 ix43 (.Y (nx42), .A0 (control[1]), .A1 (A_out[2]), .B0 (adder[1]), .B1 (
         nx10)) ;
    dff reg_A_out_2 (.Q (A_out[2]), .QB (\$dummy [2]), .D (nx121), .CLK (clock)
        ) ;
    mux21_ni ix122 (.Y (nx121), .A0 (A_out[2]), .A1 (nx32), .S0 (nx4)) ;
    ao22 ix33 (.Y (nx32), .A0 (control[1]), .A1 (A_out[3]), .B0 (adder[2]), .B1 (
         nx10)) ;
    dff reg_A_out_3 (.Q (A_out[3]), .QB (\$dummy [3]), .D (nx111), .CLK (clock)
        ) ;
    ao21 ix112 (.Y (nx111), .A0 (A_out[3]), .A1 (control[1]), .B0 (nx109)) ;
    nor03 ix110 (.Y (nx109), .A0 (nx163), .A1 (control[0]), .A2 (control[1])) ;
    inv02 ix164 (.Y (nx163), .A (adder[3])) ;
    nor02_2x ix11 (.Y (nx10), .A0 (control[0]), .A1 (control[1])) ;
    nand02_2x ix5 (.Y (nx4), .A0 (control[1]), .A1 (control[0])) ;
endmodule

