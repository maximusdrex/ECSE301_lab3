//
// Verilog description for cell ControlLogic, 
// Thu Mar  3 11:58:28 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module ControlLogic ( Q_in, clock, start, Q_sig, A_sig, done_sig, M_sig, 
                      adder_sig ) ;

    input [1:0]Q_in ;
    input clock ;
    input start ;
    output [1:0]Q_sig ;
    output [1:0]A_sig ;
    output done_sig ;
    output M_sig ;
    output adder_sig ;

    wire nx342, NEXT_STATE_2, nx355, count_2, nx356, PRES_STATE_0, NEXT_STATE_0, 
         PRES_STATE_1, NEXT_STATE_1, nx357, nx2, nx18, nx22, nx30, nx44, nx52, 
         NOT_PRES_STATE_0, nx68, nx72, nx82, count_1, count_0, nx94, nx110, 
         nx128, nx134, nx146, NOT_nx82, nx196, nx371, nx373, nx375, nx383, nx394, 
         nx397, nx400, nx406, nx408, nx411, nx414, nx416, nx440, nx444, nx446, 
         nx448, nx5, nx457, nx459, nx517;
    wire [0:0] \$dummy ;




    fake_gnd ix343 (.Y (nx342)) ;
    latch lat_adder (.Q (adder_sig), .D (PRES_STATE_1), .CLK (nx2)) ;
    or02 ix31 (.Y (nx30), .A0 (NEXT_STATE_1), .A1 (start)) ;
    latch lat_NEXT_STATE_1 (.Q (NEXT_STATE_1), .D (nx18), .CLK (nx444)) ;
    nand03 ix19 (.Y (nx18), .A0 (nx371), .A1 (nx414), .A2 (nx416)) ;
    oai21 ix372 (.Y (nx371), .A0 (Q_in[1]), .A1 (nx373), .B0 (nx375)) ;
    inv02 ix374 (.Y (nx373), .A (Q_in[0])) ;
    or02 ix147 (.Y (nx146), .A0 (NEXT_STATE_2), .A1 (start)) ;
    latch lat_NEXT_STATE_2 (.Q (NEXT_STATE_2), .D (nx357), .CLK (nx444)) ;
    ao21 ix139 (.Y (nx357), .A0 (nx128), .A1 (nx134), .B0 (nx355)) ;
    nor03 ix129 (.Y (nx128), .A0 (nx356), .A1 (PRES_STATE_0), .A2 (nx397)) ;
    nand02_2x ix123 (.Y (nx356), .A0 (nx383), .A1 (nx459)) ;
    xnor2 ix384 (.Y (nx383), .A0 (count_2), .A1 (nx457)) ;
    latch lat_count_2 (.Q (count_2), .D (nx356), .CLK (nx446)) ;
    oai21 ix83 (.Y (nx82), .A0 (nx517), .A1 (nx72), .B0 (nx68)) ;
    or02 ix53 (.Y (nx52), .A0 (NEXT_STATE_0), .A1 (start)) ;
    latch lat_NEXT_STATE_0 (.Q (NEXT_STATE_0), .D (nx44), .CLK (nx444)) ;
    nor04 ix45 (.Y (nx44), .A0 (PRES_STATE_1), .A1 (nx517), .A2 (PRES_STATE_0), 
          .A3 (nx394)) ;
    dff reg_PRES_STATE_0 (.Q (PRES_STATE_0), .QB (NOT_PRES_STATE_0), .D (nx52), 
        .CLK (clock)) ;
    xnor2 ix395 (.Y (nx394), .A0 (Q_in[1]), .A1 (Q_in[0])) ;
    dff reg_PRES_STATE_1 (.Q (PRES_STATE_1), .QB (nx397), .D (nx30), .CLK (clock
        )) ;
    latch lat_count_0 (.Q (count_0), .D (nx94), .CLK (nx446)) ;
    aoi21 ix407 (.Y (nx406), .A0 (count_1), .A1 (count_0), .B0 (nx457)) ;
    dff reg_PRES_STATE_2 (.Q (\$dummy [0]), .QB (nx408), .D (nx146), .CLK (clock
        )) ;
    ao21 ix135 (.Y (nx134), .A0 (nx411), .A1 (count_0), .B0 (nx517)) ;
    latch lat_M_out (.Q (M_sig), .D (PRES_STATE_0), .CLK (nx444)) ;
    latch lat_done (.Q (done_sig), .D (nx355), .CLK (nx444)) ;
    latch lat_A_out_0 (.Q (A_sig[0]), .D (nx196), .CLK (nx444)) ;
    latch lat_A_out_1 (.Q (A_sig[1]), .D (NOT_PRES_STATE_0), .CLK (nx22)) ;
    latch lat_Q_out_0 (.Q (Q_sig[0]), .D (NOT_nx82), .CLK (nx22)) ;
    latch lat_Q_out_1 (.Q (Q_sig[1]), .D (nx68), .CLK (nx22)) ;
    inv02 ix429 (.Y (NOT_nx82), .A (nx82)) ;
    inv02 ix3 (.Y (nx2), .A (nx414)) ;
    inv02 ix417 (.Y (nx416), .A (nx357)) ;
    inv02 ix439 (.Y (nx440), .A (nx408)) ;
    inv08 ix445 (.Y (nx446), .A (NOT_nx82)) ;
    buf08 ix447 (.Y (nx448), .A (nx110)) ;
    nor02ii ix401 (.Y (nx400), .A0 (count_0), .A1 (nx411)) ;
    latchr lat_count_1__u1 (.QB (nx5), .D (nx448), .CLK (nx446), .R (nx342)) ;
    inv01 lat_count_1__u2 (.Y (count_1), .A (nx5)) ;
    buf02 lat_count_1__u3 (.Y (nx411), .A (nx5)) ;
    buf02 ix456 (.Y (nx457), .A (nx400)) ;
    inv02 ix458 (.Y (nx459), .A (nx517)) ;
    and03 ix157 (.Y (nx355), .A0 (nx517), .A1 (NOT_PRES_STATE_0), .A2 (
          PRES_STATE_1)) ;
    or02 ix415 (.Y (nx414), .A0 (nx517), .A1 (NOT_PRES_STATE_0)) ;
    nor03 ix376 (.Y (nx375), .A0 (PRES_STATE_1), .A1 (nx517), .A2 (PRES_STATE_0)
          ) ;
    nand02_2x ix73 (.Y (nx72), .A0 (NOT_PRES_STATE_0), .A1 (PRES_STATE_1)) ;
    nand02_2x ix23 (.Y (nx22), .A0 (nx397), .A1 (nx440)) ;
    nand03 ix69 (.Y (nx68), .A0 (PRES_STATE_1), .A1 (nx440), .A2 (PRES_STATE_0)
           ) ;
    nor02_2x ix95 (.Y (nx94), .A0 (count_0), .A1 (nx440)) ;
    nor02_2x ix111 (.Y (nx110), .A0 (nx406), .A1 (nx440)) ;
    ao21 ix197 (.Y (nx196), .A0 (nx440), .A1 (PRES_STATE_1), .B0 (nx375)) ;
    nand02_2x ix443 (.Y (nx444), .A0 (nx397), .A1 (nx440)) ;
    inv02 ix516 (.Y (nx517), .A (nx408)) ;
endmodule