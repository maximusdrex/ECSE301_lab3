//
// Verilog description for cell Qreg, 
// Mon Mar 21 11:31:59 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Qreg ( load, control, clock, Q_out, A_in ) ;

    input [3:0]load ;
    input [1:0]control ;
    input clock ;
    output [4:0]Q_out ;
    input A_in ;

    wire nx4, nx10, nx22, NOT_clock, nx34, nx44, nx54, nx134, nx144, nx154, 
         nx164, nx174, nx206, nx208;
    wire [4:0] \$dummy ;




    dff reg_Q_out_0 (.Q (Q_out[0]), .QB (\$dummy [0]), .D (nx174), .CLK (
        NOT_clock)) ;
    ao32 ix175 (.Y (nx174), .A0 (control[1]), .A1 (Q_out[1]), .A2 (nx206), .B0 (
         Q_out[0]), .B1 (nx208)) ;
    dff reg_Q_out_1 (.Q (Q_out[1]), .QB (\$dummy [1]), .D (nx164), .CLK (
        NOT_clock)) ;
    mux21_ni ix165 (.Y (nx164), .A0 (Q_out[1]), .A1 (nx54), .S0 (nx4)) ;
    ao22 ix55 (.Y (nx54), .A0 (control[1]), .A1 (Q_out[2]), .B0 (load[0]), .B1 (
         nx10)) ;
    dff reg_Q_out_2 (.Q (Q_out[2]), .QB (\$dummy [2]), .D (nx154), .CLK (
        NOT_clock)) ;
    mux21_ni ix155 (.Y (nx154), .A0 (Q_out[2]), .A1 (nx44), .S0 (nx4)) ;
    ao22 ix45 (.Y (nx44), .A0 (control[1]), .A1 (Q_out[3]), .B0 (load[1]), .B1 (
         nx10)) ;
    dff reg_Q_out_3 (.Q (Q_out[3]), .QB (\$dummy [3]), .D (nx144), .CLK (
        NOT_clock)) ;
    mux21_ni ix145 (.Y (nx144), .A0 (Q_out[3]), .A1 (nx34), .S0 (nx4)) ;
    ao22 ix35 (.Y (nx34), .A0 (control[1]), .A1 (Q_out[4]), .B0 (load[2]), .B1 (
         nx10)) ;
    dff reg_Q_out_4 (.Q (Q_out[4]), .QB (\$dummy [4]), .D (nx134), .CLK (
        NOT_clock)) ;
    mux21_ni ix135 (.Y (nx134), .A0 (Q_out[4]), .A1 (nx22), .S0 (nx4)) ;
    ao22 ix23 (.Y (nx22), .A0 (A_in), .A1 (control[1]), .B0 (load[3]), .B1 (nx10
         )) ;
    nor02_2x ix11 (.Y (nx10), .A0 (control[0]), .A1 (control[1])) ;
    nand02_2x ix5 (.Y (nx4), .A0 (control[1]), .A1 (control[0])) ;
    inv02 ix201 (.Y (NOT_clock), .A (clock)) ;
    inv02 ix207 (.Y (nx206), .A (control[0])) ;
    inv02 ix209 (.Y (nx208), .A (nx4)) ;
endmodule

