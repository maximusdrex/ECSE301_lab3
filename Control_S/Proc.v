//
// Verilog description for cell ControlLogic, 
// Mon Mar 21 11:31:44 2022
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

    wire nx543, PRES_STATE_2, NEXT_STATE_2, PRES_STATE_0, NEXT_STATE_0, 
         PRES_STATE_4, NEXT_STATE_4, PRES_STATE_5, NEXT_STATE_5, PRES_STATE_3, 
         NEXT_STATE_3, PRES_STATE_1, NEXT_STATE_1, nx4, NOT_PRES_STATE_4, nx10, 
         nx14, nx24, nx28, nx36, nx46, nx60, nx62, nx72, count_1, nx556, nx80, 
         count_0, nx90, count_2, nx108, nx126, nx130, nx140, nx150, nx158, nx168, 
         nx178, nx190, nx200, nx569, nx574, nx581, nx587, nx590, nx592, nx598, 
         nx607, nx609, nx616, nx622, nx625, nx630, nx646, nx648, nx650, nx656, 
         nx5, nx661;
    wire [1:0] \$dummy ;




    fake_gnd ix544 (.Y (nx543)) ;
    latch lat_adder_sig (.Q (adder_sig), .D (PRES_STATE_2), .CLK (nx646)) ;
    dff reg_PRES_STATE_2 (.Q (PRES_STATE_2), .QB (\$dummy [0]), .D (nx200), .CLK (
        clock)) ;
    nor02ii ix201 (.Y (nx200), .A0 (start), .A1 (NEXT_STATE_2)) ;
    latch lat_NEXT_STATE_2 (.Q (NEXT_STATE_2), .D (nx190), .CLK (nx646)) ;
    nor03 ix191 (.Y (nx190), .A0 (nx569), .A1 (nx630), .A2 (Q_in[0])) ;
    nor02ii ix179 (.Y (nx178), .A0 (start), .A1 (NEXT_STATE_0)) ;
    latch lat_NEXT_STATE_0 (.Q (NEXT_STATE_0), .D (nx168), .CLK (nx646)) ;
    nor02ii ix73 (.Y (nx72), .A0 (start), .A1 (NEXT_STATE_3)) ;
    latch lat_NEXT_STATE_3 (.Q (NEXT_STATE_3), .D (nx62), .CLK (nx646)) ;
    or02 ix63 (.Y (nx62), .A0 (nx60), .A1 (PRES_STATE_2)) ;
    ao21 ix61 (.Y (nx60), .A0 (PRES_STATE_0), .A1 (nx581), .B0 (PRES_STATE_1)) ;
    dff reg_PRES_STATE_0 (.Q (PRES_STATE_0), .QB (nx569), .D (nx178), .CLK (
        clock)) ;
    xnor2 ix582 (.Y (nx581), .A0 (Q_in[1]), .A1 (Q_in[0])) ;
    dff reg_PRES_STATE_1 (.Q (PRES_STATE_1), .QB (\$dummy [1]), .D (nx46), .CLK (
        clock)) ;
    nor02ii ix47 (.Y (nx46), .A0 (start), .A1 (NEXT_STATE_1)) ;
    latch lat_NEXT_STATE_1 (.Q (NEXT_STATE_1), .D (nx4), .CLK (nx646)) ;
    nor03 ix5 (.Y (nx4), .A0 (nx569), .A1 (Q_in[1]), .A2 (nx587)) ;
    inv02 ix588 (.Y (nx587), .A (Q_in[0])) ;
    nand02_2x ix37 (.Y (nx36), .A0 (nx590), .A1 (nx625)) ;
    ao21 ix591 (.Y (nx590), .A0 (nx592), .A1 (nx24), .B0 (nx616)) ;
    or02 ix159 (.Y (nx158), .A0 (NEXT_STATE_4), .A1 (start)) ;
    latch lat_NEXT_STATE_4 (.Q (NEXT_STATE_4), .D (nx150), .CLK (nx646)) ;
    nor02ii ix141 (.Y (nx140), .A0 (start), .A1 (NEXT_STATE_5)) ;
    latch lat_NEXT_STATE_5 (.Q (NEXT_STATE_5), .D (nx130), .CLK (nx646)) ;
    ao21 ix131 (.Y (nx130), .A0 (start), .A1 (PRES_STATE_5), .B0 (nx126)) ;
    dff reg_PRES_STATE_5 (.Q (PRES_STATE_5), .QB (nx598), .D (nx140), .CLK (
        clock)) ;
    nor04 ix127 (.Y (nx126), .A0 (nx574), .A1 (count_2), .A2 (nx622), .A3 (
          count_1)) ;
    latch lat_count_2 (.Q (count_2), .D (nx108), .CLK (nx14)) ;
    xnor2 ix608 (.Y (nx607), .A0 (count_2), .A1 (nx661)) ;
    dff reg_PRES_STATE_4 (.Q (PRES_STATE_4), .QB (NOT_PRES_STATE_4), .D (nx158)
        , .CLK (clock)) ;
    inv02 ix617 (.Y (nx616), .A (clock)) ;
    latch lat_count_1 (.Q (count_1), .D (nx80), .CLK (nx14)) ;
    dff reg_PRES_STATE_3 (.Q (PRES_STATE_3), .QB (nx574), .D (nx72), .CLK (clock
        )) ;
    ao21 ix105 (.Y (nx556), .A0 (count_1), .A1 (count_0), .B0 (nx661)) ;
    nor03_2x ix25 (.Y (nx24), .A0 (PRES_STATE_1), .A1 (PRES_STATE_4), .A2 (
             PRES_STATE_2)) ;
    inv02 ix631 (.Y (nx630), .A (Q_in[1])) ;
    latch lat_M_sig (.Q (M_sig), .D (PRES_STATE_4), .CLK (nx648)) ;
    latch lat_done_sig (.Q (done_sig), .D (PRES_STATE_5), .CLK (nx648)) ;
    latch lat_A_sig_0 (.Q (A_sig[0]), .D (nx28), .CLK (nx648)) ;
    latch lat_A_sig_1 (.Q (A_sig[1]), .D (nx24), .CLK (nx648)) ;
    latch lat_Q_sig_0 (.Q (Q_sig[0]), .D (nx10), .CLK (nx648)) ;
    latch lat_Q_sig_1 (.Q (Q_sig[1]), .D (NOT_PRES_STATE_4), .CLK (nx648)) ;
    inv02 ix29 (.Y (nx28), .A (nx592)) ;
    inv08 ix15 (.Y (nx14), .A (nx625)) ;
    buf02 ix645 (.Y (nx646), .A (nx36)) ;
    buf02 ix647 (.Y (nx648), .A (nx36)) ;
    buf08 ix649 (.Y (nx650), .A (nx90)) ;
    ao21 ix169 (.Y (nx168), .A0 (PRES_STATE_3), .A1 (nx656), .B0 (PRES_STATE_4)
         ) ;
    nor02ii ix610 (.Y (nx609), .A0 (count_1), .A1 (nx622)) ;
    or03 ix629 (.Y (nx656), .A0 (count_2), .A1 (nx622), .A2 (count_1)) ;
    latchr lat_count_0__u1 (.QB (nx5), .D (nx650), .CLK (nx14), .R (nx543)) ;
    inv01 lat_count_0__u2 (.Y (count_0), .A (nx5)) ;
    buf02 lat_count_0__u3 (.Y (nx622), .A (nx5)) ;
    buf02 ix660 (.Y (nx661), .A (nx609)) ;
    nor03 ix593 (.Y (nx592), .A0 (PRES_STATE_4), .A1 (PRES_STATE_5), .A2 (
          PRES_STATE_0)) ;
    nor02_2x ix151 (.Y (nx150), .A0 (start), .A1 (nx598)) ;
    oai21 ix109 (.Y (nx108), .A0 (nx574), .A1 (nx607), .B0 (NOT_PRES_STATE_4)) ;
    nor02ii ix91 (.Y (nx90), .A0 (nx574), .A1 (nx622)) ;
    and02 ix81 (.Y (nx80), .A0 (PRES_STATE_3), .A1 (nx556)) ;
    oai21 ix626 (.Y (nx625), .A0 (PRES_STATE_4), .A1 (PRES_STATE_3), .B0 (clock)
          ) ;
    nor02_2x ix11 (.Y (nx10), .A0 (PRES_STATE_4), .A1 (PRES_STATE_3)) ;
endmodule

