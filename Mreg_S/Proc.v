//
// Verilog description for cell Mreg, 
// Fri Mar  4 18:10:35 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Mreg ( load, control, clock, M_out ) ;

    input [3:0]load ;
    input control ;
    input clock ;
    output [3:0]M_out ;

    wire M_0, NOT_clock, M_1, M_2, M_3, nx131, nx141, nx151, nx161;
    wire [7:0] \$dummy ;




    dff reg_M_out_0 (.Q (M_out[0]), .QB (\$dummy [0]), .D (M_0), .CLK (clock)) ;
    dff reg_M_0 (.Q (M_0), .QB (\$dummy [1]), .D (nx131), .CLK (NOT_clock)) ;
    mux21_ni ix132 (.Y (nx131), .A0 (M_0), .A1 (load[0]), .S0 (control)) ;
    inv02 ix175 (.Y (NOT_clock), .A (clock)) ;
    dff reg_M_out_1 (.Q (M_out[1]), .QB (\$dummy [2]), .D (M_1), .CLK (clock)) ;
    dff reg_M_1 (.Q (M_1), .QB (\$dummy [3]), .D (nx141), .CLK (NOT_clock)) ;
    mux21_ni ix142 (.Y (nx141), .A0 (M_1), .A1 (load[1]), .S0 (control)) ;
    dff reg_M_out_2 (.Q (M_out[2]), .QB (\$dummy [4]), .D (M_2), .CLK (clock)) ;
    dff reg_M_2 (.Q (M_2), .QB (\$dummy [5]), .D (nx151), .CLK (NOT_clock)) ;
    mux21_ni ix152 (.Y (nx151), .A0 (M_2), .A1 (load[2]), .S0 (control)) ;
    dff reg_M_out_3 (.Q (M_out[3]), .QB (\$dummy [6]), .D (M_3), .CLK (clock)) ;
    dff reg_M_3 (.Q (M_3), .QB (\$dummy [7]), .D (nx161), .CLK (NOT_clock)) ;
    mux21_ni ix162 (.Y (nx161), .A0 (M_3), .A1 (load[3]), .S0 (control)) ;
endmodule


module inv02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = ~A ;
endmodule


module mux21_ni ( Y, A0, A1, S0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input S0 ;

    wire NOT_S0, nx2, nx4;



    assign NOT_S0 = ~S0 ;
    and (nx2, A0, NOT_S0) ;
    and (nx4, A1, S0) ;
    or (Y, nx2, nx4) ;
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

