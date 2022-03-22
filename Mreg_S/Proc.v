//
// Verilog description for cell Mreg, 
// Mon Mar 21 11:40:43 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module Mreg ( load, control, clock, M_out ) ;

    input [3:0]load ;
    input control ;
    input clock ;
    output [3:0]M_out ;

    wire nx121, nx131, nx141, nx151;
    wire [3:0] \$dummy ;




    dff reg_M_out_0 (.Q (M_out[0]), .QB (\$dummy [0]), .D (nx121), .CLK (clock)
        ) ;
    mux21_ni ix122 (.Y (nx121), .A0 (M_out[0]), .A1 (load[0]), .S0 (control)) ;
    dff reg_M_out_1 (.Q (M_out[1]), .QB (\$dummy [1]), .D (nx131), .CLK (clock)
        ) ;
    mux21_ni ix132 (.Y (nx131), .A0 (M_out[1]), .A1 (load[1]), .S0 (control)) ;
    dff reg_M_out_2 (.Q (M_out[2]), .QB (\$dummy [2]), .D (nx141), .CLK (clock)
        ) ;
    mux21_ni ix142 (.Y (nx141), .A0 (M_out[2]), .A1 (load[2]), .S0 (control)) ;
    dff reg_M_out_3 (.Q (M_out[3]), .QB (\$dummy [3]), .D (nx151), .CLK (clock)
        ) ;
    mux21_ni ix152 (.Y (nx151), .A0 (M_out[3]), .A1 (load[3]), .S0 (control)) ;
endmodule

