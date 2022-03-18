//
// Verilog description for cell ControlLogic, 
// Wed Mar  2 16:57:32 2022
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

    wire nx341, PRES_STATE_0, NEXT_STATE_0, NEXT_STATE_2, PRES_STATE_1, 
         NEXT_STATE_1, nx353, nx2, nx18, nx22, nx30, nx40, count_0, nx355, 
         NOT_PRES_STATE_0, nx50, nx60, count_2, nx356, count_1, nx88, nx110, 
         nx124, nx138, nx146, NOT_nx60, nx190, nx365, nx367, nx369, nx379, nx382, 
         nx388, nx397, nx399, nx403, nx405, nx407, nx409, nx429, nx433, nx435, 
         nx437, nx5, nx448, nx450, nx508, nx510;
    wire [0:0] \$dummy ;




    fake_gnd ix342 (.Y (nx341)) ;
    fake_vcc ix340 (.Y (done_sig)) ;
    latch lat_adder (.Q (adder_sig), .D (PRES_STATE_1), .CLK (nx2)) ;
    or02 ix31 (.Y (nx30), .A0 (NEXT_STATE_1), .A1 (start)) ;
    latch lat_NEXT_STATE_1 (.Q (NEXT_STATE_1), .D (nx18), .CLK (nx433)) ;
    nand03 ix19 (.Y (nx18), .A0 (nx365), .A1 (nx407), .A2 (nx409)) ;
    oai21 ix366 (.Y (nx365), .A0 (Q_in[1]), .A1 (nx367), .B0 (nx369)) ;
    inv02 ix368 (.Y (nx367), .A (Q_in[0])) ;
    or02 ix125 (.Y (nx124), .A0 (NEXT_STATE_2), .A1 (start)) ;
    latch lat_NEXT_STATE_2 (.Q (NEXT_STATE_2), .D (nx353), .CLK (nx433)) ;
    dff reg_PRES_STATE_0 (.Q (PRES_STATE_0), .QB (NOT_PRES_STATE_0), .D (nx146)
        , .CLK (clock)) ;
    or02 ix147 (.Y (nx146), .A0 (NEXT_STATE_0), .A1 (start)) ;
    latch lat_NEXT_STATE_0 (.Q (NEXT_STATE_0), .D (nx138), .CLK (nx433)) ;
    nor04 ix139 (.Y (nx138), .A0 (PRES_STATE_1), .A1 (nx510), .A2 (PRES_STATE_0)
          , .A3 (nx379)) ;
    xnor2 ix380 (.Y (nx379), .A0 (Q_in[1]), .A1 (Q_in[0])) ;
    dff reg_PRES_STATE_1 (.Q (PRES_STATE_1), .QB (nx382), .D (nx30), .CLK (clock
        )) ;
    nor04 ix111 (.Y (nx110), .A0 (nx510), .A1 (nx388), .A2 (count_2), .A3 (
          count_1)) ;
    oai21 ix61 (.Y (nx60), .A0 (nx510), .A1 (nx40), .B0 (nx50)) ;
    latch lat_count_2 (.Q (count_2), .D (nx356), .CLK (nx437)) ;
    nand02_2x ix101 (.Y (nx356), .A0 (nx397), .A1 (nx450)) ;
    xnor2 ix398 (.Y (nx397), .A0 (count_2), .A1 (nx448)) ;
    latch lat_count_1 (.Q (count_1), .D (nx88), .CLK (nx437)) ;
    aoi21 ix404 (.Y (nx403), .A0 (count_1), .A1 (count_0), .B0 (nx448)) ;
    dff reg_PRES_STATE_2 (.Q (\$dummy [0]), .QB (nx405), .D (nx124), .CLK (clock
        )) ;
    latch lat_M_out (.Q (M_sig), .D (PRES_STATE_0), .CLK (nx433)) ;
    latch lat_A_out_0 (.Q (A_sig[0]), .D (nx190), .CLK (nx433)) ;
    latch lat_A_out_1 (.Q (A_sig[1]), .D (NOT_PRES_STATE_0), .CLK (nx433)) ;
    latch lat_Q_out_0 (.Q (Q_sig[0]), .D (NOT_nx60), .CLK (nx22)) ;
    latch lat_Q_out_1 (.Q (Q_sig[1]), .D (nx50), .CLK (nx22)) ;
    inv02 ix420 (.Y (NOT_nx60), .A (nx60)) ;
    inv02 ix3 (.Y (nx2), .A (nx407)) ;
    inv02 ix117 (.Y (nx353), .A (nx409)) ;
    inv02 ix428 (.Y (nx429), .A (nx405)) ;
    buf08 ix434 (.Y (nx435), .A (nx355)) ;
    inv08 ix436 (.Y (nx437), .A (NOT_nx60)) ;
    nor02ii ix400 (.Y (nx399), .A0 (count_1), .A1 (nx388)) ;
    latchr lat_count_0__u1 (.QB (nx5), .D (nx435), .CLK (nx437), .R (nx341)) ;
    inv01 lat_count_0__u2 (.Y (count_0), .A (nx5)) ;
    buf02 lat_count_0__u3 (.Y (nx388), .A (nx5)) ;
    buf02 ix447 (.Y (nx448), .A (nx399)) ;
    inv02 ix449 (.Y (nx450), .A (nx510)) ;
    or02 ix408 (.Y (nx407), .A0 (nx510), .A1 (NOT_PRES_STATE_0)) ;
    nor03 ix370 (.Y (nx369), .A0 (PRES_STATE_1), .A1 (nx510), .A2 (PRES_STATE_0)
          ) ;
    nand02_2x ix23 (.Y (nx22), .A0 (nx382), .A1 (nx510)) ;
    nor02ii ix73 (.Y (nx355), .A0 (nx429), .A1 (nx388)) ;
    nand02_2x ix41 (.Y (nx40), .A0 (NOT_PRES_STATE_0), .A1 (PRES_STATE_1)) ;
    nand03 ix51 (.Y (nx50), .A0 (PRES_STATE_1), .A1 (nx429), .A2 (PRES_STATE_0)
           ) ;
    nor02_2x ix89 (.Y (nx88), .A0 (nx403), .A1 (nx429)) ;
    oai21 ix410 (.Y (nx409), .A0 (nx110), .A1 (nx429), .B0 (nx508)) ;
    inv02 ix507 (.Y (nx508), .A (nx40)) ;
    ao21 ix191 (.Y (nx190), .A0 (nx429), .A1 (PRES_STATE_1), .B0 (nx369)) ;
    nand02_2x ix432 (.Y (nx433), .A0 (nx382), .A1 (nx429)) ;
    inv02 ix509 (.Y (nx510), .A (nx405)) ;
endmodule