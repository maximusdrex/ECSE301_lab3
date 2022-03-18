//
// Verilog description for cell Qreg, 
// Fri Mar  4 18:10:02 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Qreg ( load, control, clock, Q_out, A_in ) ;

    input [3:0]load ;
    input [1:0]control ;
    input clock ;
    output [4:0]Q_out ;
    input A_in ;

    wire Q_0, nx4, Q_1, nx10, Q_2, Q_3, Q_4, NOT_clock, nx144, nx154, nx164, 
         nx174, nx184, nx197, nx199, nx202, nx206, nx210, nx214, nx216, nx220, 
         nx222, nx226;
    wire [4:0] \$dummy ;




    dff reg_Q_out_0 (.Q (Q_out[0]), .QB (\$dummy [0]), .D (Q_0), .CLK (clock)) ;
    oai32 ix185 (.Y (nx184), .A0 (nx197), .A1 (nx199), .A2 (control[0]), .B0 (
          nx226), .B1 (nx4)) ;
    inv02 ix198 (.Y (nx197), .A (control[1])) ;
    dff reg_Q_1 (.Q (Q_1), .QB (nx199), .D (nx174), .CLK (NOT_clock)) ;
    mux21 ix175 (.Y (nx174), .A0 (nx199), .A1 (nx202), .S0 (nx4)) ;
    aoi22 ix203 (.Y (nx202), .A0 (control[1]), .A1 (Q_2), .B0 (load[0]), .B1 (
          nx10)) ;
    mux21 ix165 (.Y (nx164), .A0 (nx206), .A1 (nx210), .S0 (nx4)) ;
    dff reg_Q_2 (.Q (Q_2), .QB (nx206), .D (nx164), .CLK (NOT_clock)) ;
    inv02 ix209 (.Y (NOT_clock), .A (clock)) ;
    aoi22 ix211 (.Y (nx210), .A0 (control[1]), .A1 (Q_3), .B0 (load[1]), .B1 (
          nx10)) ;
    mux21 ix155 (.Y (nx154), .A0 (nx214), .A1 (nx216), .S0 (nx4)) ;
    dff reg_Q_3 (.Q (Q_3), .QB (nx214), .D (nx154), .CLK (NOT_clock)) ;
    aoi22 ix217 (.Y (nx216), .A0 (control[1]), .A1 (Q_4), .B0 (load[2]), .B1 (
          nx10)) ;
    mux21 ix145 (.Y (nx144), .A0 (nx220), .A1 (nx222), .S0 (nx4)) ;
    dff reg_Q_4 (.Q (Q_4), .QB (nx220), .D (nx144), .CLK (NOT_clock)) ;
    aoi22 ix223 (.Y (nx222), .A0 (A_in), .A1 (control[1]), .B0 (load[3]), .B1 (
          nx10)) ;
    nor02_2x ix11 (.Y (nx10), .A0 (control[0]), .A1 (control[1])) ;
    nand02_2x ix5 (.Y (nx4), .A0 (control[1]), .A1 (control[0])) ;
    dff reg_Q_0 (.Q (Q_0), .QB (nx226), .D (nx184), .CLK (NOT_clock)) ;
    dff reg_Q_out_1 (.Q (Q_out[1]), .QB (\$dummy [1]), .D (Q_1), .CLK (clock)) ;
    dff reg_Q_out_2 (.Q (Q_out[2]), .QB (\$dummy [2]), .D (Q_2), .CLK (clock)) ;
    dff reg_Q_out_3 (.Q (Q_out[3]), .QB (\$dummy [3]), .D (Q_3), .CLK (clock)) ;
    dff reg_Q_out_4 (.Q (Q_out[4]), .QB (\$dummy [4]), .D (Q_4), .CLK (clock)) ;
endmodule


module nand02_2x ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A1, NOT_A0;



    assign NOT_A1 = ~A1 ;
    assign NOT_A0 = ~A0 ;
    or (Y, NOT_A1, NOT_A0) ;
endmodule


module nor02_2x ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A0, NOT_A1;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (Y, NOT_A0, NOT_A1) ;
endmodule


module aoi22 ( Y, A0, A1, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;
    input B1 ;

    wire NOT_A1, NOT_B1, nx4, NOT_A0, nx8, nx10, NOT_B0, nx14, nx16, nx18;



    assign NOT_A1 = ~A1 ;
    assign NOT_B1 = ~B1 ;
    and (nx4, NOT_A1, NOT_B1) ;
    assign NOT_A0 = ~A0 ;
    and (nx8, NOT_A0, NOT_B1) ;
    or (nx10, nx4, nx8) ;
    assign NOT_B0 = ~B0 ;
    and (nx14, NOT_A1, NOT_B0) ;
    or (nx16, nx10, nx14) ;
    and (nx18, NOT_A0, NOT_B0) ;
    or (Y, nx16, nx18) ;
endmodule


module mux21 ( Y, A0, A1, S0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input S0 ;

    wire NOT_A0, NOT_S0, nx4, NOT_A1, nx8;



    assign NOT_A0 = ~A0 ;
    assign NOT_S0 = ~S0 ;
    and (nx4, NOT_A0, NOT_S0) ;
    assign NOT_A1 = ~A1 ;
    and (nx8, NOT_A1, S0) ;
    or (Y, nx4, nx8) ;
endmodule


module inv02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = ~A ;
endmodule


module oai32 ( Y, A0, A1, A2, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input B0 ;
    input B1 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2, nx8, NOT_B0, NOT_B1, nx14;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (nx8, nx4, NOT_A2) ;
    assign NOT_B0 = ~B0 ;
    assign NOT_B1 = ~B1 ;
    and (nx14, NOT_B0, NOT_B1) ;
    or (Y, nx8, nx14) ;
endmodule


module dff ( Q, QB, D, CLK ) ;

    output Q ;
    output QB ;
    input D ;
    input CLK ;

    wire nx2, nx4;



    DFFRS ix1 (.set (nx4), .reset (nx2), .in (D), .clk (CLK), .out (Q)) ;
    assign nx2 = 0 ;
    assign nx4 = 0 ;
    assign QB = ~Q ;
endmodule


module DFFRS ( set, reset, in, clk, out ) ;

    input set ;
    input reset ;
    input in ;
    input clk ;
    output out ;
reg out; 
always @ (posedge set or posedge reset or posedge clk)
begin
    if (set) out = 1;
    else if (reset) out = 0;
    else begin
     out = in;
    end
end

endmodule

