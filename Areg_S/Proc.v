//
// Verilog description for cell Areg, 
// Fri Mar  4 18:10:07 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Areg ( adder, control, clock, A_out ) ;

    input [3:0]adder ;
    input [1:0]control ;
    input clock ;
    output [3:0]A_out ;

    wire A_0, nx4, nx10, A_1, A_2, A_3, NOT_clock, nx119, nx121, nx131, nx141, 
         nx151, nx164, nx168, nx172, nx174, nx178, nx180, nx185;
    wire [4:0] \$dummy ;




    dff reg_A_out_0 (.Q (A_out[0]), .QB (\$dummy [0]), .D (A_0), .CLK (clock)) ;
    mux21 ix152 (.Y (nx151), .A0 (nx164), .A1 (nx168), .S0 (nx4)) ;
    dff reg_A_0 (.Q (A_0), .QB (nx164), .D (nx151), .CLK (NOT_clock)) ;
    inv02 ix167 (.Y (NOT_clock), .A (clock)) ;
    aoi22 ix169 (.Y (nx168), .A0 (control[1]), .A1 (A_1), .B0 (adder[0]), .B1 (
          nx10)) ;
    mux21 ix142 (.Y (nx141), .A0 (nx172), .A1 (nx174), .S0 (nx4)) ;
    dff reg_A_1 (.Q (A_1), .QB (nx172), .D (nx141), .CLK (NOT_clock)) ;
    aoi22 ix175 (.Y (nx174), .A0 (control[1]), .A1 (A_2), .B0 (adder[1]), .B1 (
          nx10)) ;
    mux21 ix132 (.Y (nx131), .A0 (nx178), .A1 (nx180), .S0 (nx4)) ;
    dff reg_A_2 (.Q (A_2), .QB (nx178), .D (nx131), .CLK (NOT_clock)) ;
    aoi22 ix181 (.Y (nx180), .A0 (control[1]), .A1 (A_3), .B0 (adder[2]), .B1 (
          nx10)) ;
    dff reg_A_3 (.Q (A_3), .QB (\$dummy [1]), .D (nx121), .CLK (NOT_clock)) ;
    ao21 ix122 (.Y (nx121), .A0 (A_3), .A1 (control[1]), .B0 (nx119)) ;
    nor03 ix120 (.Y (nx119), .A0 (nx185), .A1 (control[0]), .A2 (control[1])) ;
    inv02 ix186 (.Y (nx185), .A (adder[3])) ;
    nor02_2x ix11 (.Y (nx10), .A0 (control[0]), .A1 (control[1])) ;
    nand02_2x ix5 (.Y (nx4), .A0 (control[1]), .A1 (control[0])) ;
    dff reg_A_out_1 (.Q (A_out[1]), .QB (\$dummy [2]), .D (A_1), .CLK (clock)) ;
    dff reg_A_out_2 (.Q (A_out[2]), .QB (\$dummy [3]), .D (A_2), .CLK (clock)) ;
    dff reg_A_out_3 (.Q (A_out[3]), .QB (\$dummy [4]), .D (A_3), .CLK (clock)) ;
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


module nor03 ( Y, A0, A1, A2 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (Y, nx4, NOT_A2) ;
endmodule


module ao21 ( Y, A0, A1, B0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;

    wire nx0;



    and (nx0, A0, A1) ;
    or (Y, nx0, B0) ;
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


module inv02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = ~A ;
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

