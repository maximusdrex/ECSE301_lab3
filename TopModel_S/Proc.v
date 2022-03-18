//
// Verilog description for cell AddSub, 
// Thu Mar 10 10:52:14 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module AddSub ( mult, control, A_in, A_out, clock ) ;

    input [3:0]mult ;
    input control ;
    input [3:0]A_in ;
    output [3:0]A_out ;
    input clock ;

    wire nx0, nx2, nx10, nx12, nx32, nx42, nx44, nx210, nx212, nx219;



    xor2 ix53 (.Y (A_out[0]), .A0 (A_in[0]), .A1 (mult[0])) ;
    xor2 ix51 (.Y (A_out[1]), .A0 (nx32), .A1 (nx12)) ;
    mux21_ni ix33 (.Y (nx32), .A0 (control), .A1 (A_in[0]), .S0 (mult[0])) ;
    xnor2 ix13 (.Y (nx12), .A0 (A_in[1]), .A1 (nx10)) ;
    xnor2 ix11 (.Y (nx10), .A0 (mult[1]), .A1 (control)) ;
    xnor2 ix49 (.Y (A_out[2]), .A0 (nx210), .A1 (nx2)) ;
    aoi22 ix211 (.Y (nx210), .A0 (nx212), .A1 (A_in[1]), .B0 (nx32), .B1 (nx12)
          ) ;
    xnor2 ix3 (.Y (nx2), .A0 (A_in[2]), .A1 (nx0)) ;
    xnor2 ix1 (.Y (nx0), .A0 (mult[2]), .A1 (control)) ;
    xnor2 ix47 (.Y (A_out[3]), .A0 (nx219), .A1 (nx44)) ;
    mux21_ni ix220 (.Y (nx219), .A0 (nx0), .A1 (nx210), .S0 (nx2)) ;
    xnor2 ix45 (.Y (nx44), .A0 (A_in[3]), .A1 (nx42)) ;
    xnor2 ix43 (.Y (nx42), .A0 (mult[3]), .A1 (control)) ;
    inv02 ix213 (.Y (nx212), .A (nx10)) ;
endmodule


module inv02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = ~A ;
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


module xnor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xnor (Y, A0, A1) ;
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


module xor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xor (Y, A0, A1) ;
endmodule

