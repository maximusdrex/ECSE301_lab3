//
// Verilog description for cell TopModel, 
// Mon Mar 21 11:27:34 2022
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module TopModel ( clock, start, q_in, m_in, done, mult_out ) ;

    input clock ;
    input start ;
    input [3:0]q_in ;
    input [3:0]m_in ;
    output done ;
    output [7:0]mult_out ;

    wire q_out_0, q_con_1, q_con_0, a_con_1, a_con_0, add_sig, m_sig, nx4, nx10, 
         nx24, m_out_0, nx42, nx44, nx52, m_out_1, nx60, nx62, nx66, nx74, 
         m_out_2, nx82, nx84, nx86, m_out_3, nx124, nx134, nx144, nx154, 
         NOT_clock, nx166, nx176, nx186, nx153, nx163, nx173, nx183, nx191, 
         nx193, nx203, nx213, nx223, nx233, nx243, nx253, nx263, nx273, nx309, 
         nx311, nx313, nx328, nx332, nx334, nx341, nx347, nx351, nx362, nx364, 
         nx372, nx374, Control_nx543, Control_PRES_STATE_2, Control_NEXT_STATE_2, 
         Control_PRES_STATE_0, Control_NEXT_STATE_0, Control_PRES_STATE_4, 
         Control_NEXT_STATE_4, Control_PRES_STATE_5, Control_NEXT_STATE_5, 
         Control_PRES_STATE_3, Control_NEXT_STATE_3, Control_PRES_STATE_1, 
         Control_NEXT_STATE_1, Control_nx4, Control_NOT_PRES_STATE_4, 
         Control_nx10, Control_nx14, Control_nx24, Control_nx28, Control_nx36, 
         Control_nx46, Control_nx60, Control_nx62, Control_nx72, Control_count_1, 
         Control_nx556, Control_nx80, Control_count_0, Control_nx90, 
         Control_count_2, Control_nx108, Control_nx126, Control_nx130, 
         Control_nx140, Control_nx150, Control_nx158, Control_nx168, 
         Control_nx178, Control_nx190, Control_nx200, Control_nx569, 
         Control_nx574, Control_nx581, Control_nx587, Control_nx590, 
         Control_nx592, Control_nx598, Control_nx607, Control_nx609, 
         Control_nx616, Control_nx622, Control_nx625, Control_nx630, 
         Control_nx646, Control_nx648, Control_nx650, Control_nx656, Control_nx5, 
         Control_nx661;
    wire [14:0] \$dummy ;




    dff Q_reg_Q_out_0 (.Q (q_out_0), .QB (\$dummy [0]), .D (nx273), .CLK (
        NOT_clock)) ;
    ao32 ix274 (.Y (nx273), .A0 (q_con_1), .A1 (mult_out[0]), .A2 (nx362), .B0 (
         q_out_0), .B1 (nx364)) ;
    dff Q_reg_Q_out_1 (.Q (mult_out[0]), .QB (\$dummy [1]), .D (nx263), .CLK (
        NOT_clock)) ;
    mux21_ni ix264 (.Y (nx263), .A0 (mult_out[0]), .A1 (nx186), .S0 (nx4)) ;
    ao22 ix187 (.Y (nx186), .A0 (q_con_1), .A1 (mult_out[1]), .B0 (q_in[0]), .B1 (
         nx10)) ;
    dff Q_reg_Q_out_2 (.Q (mult_out[1]), .QB (\$dummy [2]), .D (nx253), .CLK (
        NOT_clock)) ;
    mux21_ni ix254 (.Y (nx253), .A0 (mult_out[1]), .A1 (nx176), .S0 (nx4)) ;
    ao22 ix177 (.Y (nx176), .A0 (q_con_1), .A1 (mult_out[2]), .B0 (q_in[1]), .B1 (
         nx10)) ;
    dff Q_reg_Q_out_3 (.Q (mult_out[2]), .QB (\$dummy [3]), .D (nx243), .CLK (
        NOT_clock)) ;
    mux21_ni ix244 (.Y (nx243), .A0 (mult_out[2]), .A1 (nx166), .S0 (nx4)) ;
    ao22 ix167 (.Y (nx166), .A0 (q_con_1), .A1 (mult_out[3]), .B0 (q_in[2]), .B1 (
         nx10)) ;
    dff Q_reg_Q_out_4 (.Q (mult_out[3]), .QB (\$dummy [4]), .D (nx233), .CLK (
        NOT_clock)) ;
    mux21_ni ix234 (.Y (nx233), .A0 (mult_out[3]), .A1 (nx154), .S0 (nx4)) ;
    ao22 ix155 (.Y (nx154), .A0 (q_con_1), .A1 (mult_out[4]), .B0 (q_in[3]), .B1 (
         nx10)) ;
    dff A_reg_A_out_0 (.Q (mult_out[4]), .QB (\$dummy [5]), .D (nx223), .CLK (
        clock)) ;
    mux21_ni ix224 (.Y (nx223), .A0 (mult_out[4]), .A1 (nx144), .S0 (nx24)) ;
    ao21 ix145 (.Y (nx144), .A0 (nx372), .A1 (mult_out[5]), .B0 (nx44)) ;
    dff A_reg_A_out_1 (.Q (mult_out[5]), .QB (\$dummy [6]), .D (nx213), .CLK (
        clock)) ;
    mux21_ni ix214 (.Y (nx213), .A0 (mult_out[5]), .A1 (nx134), .S0 (nx24)) ;
    ao21 ix135 (.Y (nx134), .A0 (nx372), .A1 (mult_out[6]), .B0 (nx66)) ;
    dff A_reg_A_out_2 (.Q (mult_out[6]), .QB (\$dummy [7]), .D (nx203), .CLK (
        clock)) ;
    mux21_ni ix204 (.Y (nx203), .A0 (mult_out[6]), .A1 (nx124), .S0 (nx24)) ;
    ao22 ix125 (.Y (nx124), .A0 (nx372), .A1 (mult_out[7]), .B0 (nx86), .B1 (
         nx42)) ;
    dff A_reg_A_out_3 (.Q (mult_out[7]), .QB (\$dummy [8]), .D (nx193), .CLK (
        clock)) ;
    ao21 ix194 (.Y (nx193), .A0 (mult_out[7]), .A1 (nx372), .B0 (nx191)) ;
    nor03 ix192 (.Y (nx191), .A0 (a_con_0), .A1 (nx309), .A2 (nx372)) ;
    xnor2 ix310 (.Y (nx309), .A0 (nx311), .A1 (nx332)) ;
    aoi22 ix312 (.Y (nx311), .A0 (nx313), .A1 (mult_out[6]), .B0 (nx74), .B1 (
          nx84)) ;
    dff M_reg_M_out_2 (.Q (m_out_2), .QB (\$dummy [9]), .D (nx173), .CLK (clock)
        ) ;
    mux21_ni ix174 (.Y (nx173), .A0 (m_out_2), .A1 (m_in[2]), .S0 (m_sig)) ;
    mux21_ni ix53 (.Y (nx52), .A0 (add_sig), .A1 (mult_out[4]), .S0 (m_out_0)) ;
    dff M_reg_M_out_0 (.Q (m_out_0), .QB (\$dummy [10]), .D (nx153), .CLK (clock
        )) ;
    mux21_ni ix154 (.Y (nx153), .A0 (m_out_0), .A1 (m_in[0]), .S0 (m_sig)) ;
    xnor2 ix63 (.Y (nx62), .A0 (nx60), .A1 (mult_out[5])) ;
    xnor2 ix61 (.Y (nx60), .A0 (add_sig), .A1 (m_out_1)) ;
    dff M_reg_M_out_1 (.Q (m_out_1), .QB (\$dummy [11]), .D (nx163), .CLK (clock
        )) ;
    mux21_ni ix164 (.Y (nx163), .A0 (m_out_1), .A1 (m_in[1]), .S0 (m_sig)) ;
    xnor2 ix85 (.Y (nx84), .A0 (nx82), .A1 (mult_out[6])) ;
    xnor2 ix83 (.Y (nx82), .A0 (add_sig), .A1 (m_out_2)) ;
    xnor2 ix333 (.Y (nx332), .A0 (mult_out[7]), .A1 (nx334)) ;
    xor2 ix335 (.Y (nx334), .A0 (add_sig), .A1 (m_out_3)) ;
    dff M_reg_M_out_3 (.Q (m_out_3), .QB (\$dummy [12]), .D (nx183), .CLK (clock
        )) ;
    mux21_ni ix184 (.Y (nx183), .A0 (m_out_3), .A1 (m_in[3]), .S0 (m_sig)) ;
    xnor2 ix87 (.Y (nx86), .A0 (nx341), .A1 (nx84)) ;
    aoi22 ix342 (.Y (nx341), .A0 (nx52), .A1 (nx62), .B0 (nx328), .B1 (
          mult_out[5])) ;
    nor02_2x ix43 (.Y (nx42), .A0 (a_con_0), .A1 (nx372)) ;
    nand02_2x ix25 (.Y (nx24), .A0 (nx372), .A1 (a_con_0)) ;
    nor03 ix67 (.Y (nx66), .A0 (nx347), .A1 (a_con_0), .A2 (nx374)) ;
    xnor2 ix348 (.Y (nx347), .A0 (nx52), .A1 (nx62)) ;
    nor03 ix45 (.Y (nx44), .A0 (nx351), .A1 (a_con_0), .A2 (nx374)) ;
    xnor2 ix352 (.Y (nx351), .A0 (m_out_0), .A1 (mult_out[4])) ;
    nor02_2x ix11 (.Y (nx10), .A0 (q_con_0), .A1 (q_con_1)) ;
    nand02_2x ix5 (.Y (nx4), .A0 (q_con_1), .A1 (q_con_0)) ;
    inv02 ix357 (.Y (NOT_clock), .A (clock)) ;
    inv02 ix363 (.Y (nx362), .A (q_con_0)) ;
    inv02 ix314 (.Y (nx313), .A (nx82)) ;
    inv02 ix75 (.Y (nx74), .A (nx341)) ;
    inv02 ix329 (.Y (nx328), .A (nx60)) ;
    inv02 ix365 (.Y (nx364), .A (nx4)) ;
    buf02 ix371 (.Y (nx372), .A (a_con_1)) ;
    buf02 ix373 (.Y (nx374), .A (a_con_1)) ;
    fake_gnd Control_ix544 (.Y (Control_nx543)) ;
    latch Control_lat_adder_sig (.Q (add_sig), .D (Control_PRES_STATE_2), .CLK (
          Control_nx646)) ;
    dff Control_reg_PRES_STATE_2 (.Q (Control_PRES_STATE_2), .QB (\$dummy [13])
        , .D (Control_nx200), .CLK (clock)) ;
    nor02ii Control_ix201 (.Y (Control_nx200), .A0 (start), .A1 (
            Control_NEXT_STATE_2)) ;
    latch Control_lat_NEXT_STATE_2 (.Q (Control_NEXT_STATE_2), .D (Control_nx190
          ), .CLK (Control_nx646)) ;
    nor03 Control_ix191 (.Y (Control_nx190), .A0 (Control_nx569), .A1 (
          Control_nx630), .A2 (q_out_0)) ;
    nor02ii Control_ix179 (.Y (Control_nx178), .A0 (start), .A1 (
            Control_NEXT_STATE_0)) ;
    latch Control_lat_NEXT_STATE_0 (.Q (Control_NEXT_STATE_0), .D (Control_nx168
          ), .CLK (Control_nx646)) ;
    nor02ii Control_ix73 (.Y (Control_nx72), .A0 (start), .A1 (
            Control_NEXT_STATE_3)) ;
    latch Control_lat_NEXT_STATE_3 (.Q (Control_NEXT_STATE_3), .D (Control_nx62)
          , .CLK (Control_nx646)) ;
    or02 Control_ix63 (.Y (Control_nx62), .A0 (Control_nx60), .A1 (
         Control_PRES_STATE_2)) ;
    ao21 Control_ix61 (.Y (Control_nx60), .A0 (Control_PRES_STATE_0), .A1 (
         Control_nx581), .B0 (Control_PRES_STATE_1)) ;
    dff Control_reg_PRES_STATE_0 (.Q (Control_PRES_STATE_0), .QB (Control_nx569)
        , .D (Control_nx178), .CLK (clock)) ;
    xnor2 Control_ix582 (.Y (Control_nx581), .A0 (mult_out[0]), .A1 (q_out_0)) ;
    dff Control_reg_PRES_STATE_1 (.Q (Control_PRES_STATE_1), .QB (\$dummy [14])
        , .D (Control_nx46), .CLK (clock)) ;
    nor02ii Control_ix47 (.Y (Control_nx46), .A0 (start), .A1 (
            Control_NEXT_STATE_1)) ;
    latch Control_lat_NEXT_STATE_1 (.Q (Control_NEXT_STATE_1), .D (Control_nx4)
          , .CLK (Control_nx646)) ;
    nor03 Control_ix5 (.Y (Control_nx4), .A0 (Control_nx569), .A1 (mult_out[0])
          , .A2 (Control_nx587)) ;
    inv02 Control_ix588 (.Y (Control_nx587), .A (q_out_0)) ;
    nand02_2x Control_ix37 (.Y (Control_nx36), .A0 (Control_nx590), .A1 (
              Control_nx625)) ;
    ao21 Control_ix591 (.Y (Control_nx590), .A0 (Control_nx592), .A1 (
         Control_nx24), .B0 (Control_nx616)) ;
    or02 Control_ix159 (.Y (Control_nx158), .A0 (Control_NEXT_STATE_4), .A1 (
         start)) ;
    latch Control_lat_NEXT_STATE_4 (.Q (Control_NEXT_STATE_4), .D (Control_nx150
          ), .CLK (Control_nx646)) ;
    nor02ii Control_ix141 (.Y (Control_nx140), .A0 (start), .A1 (
            Control_NEXT_STATE_5)) ;
    latch Control_lat_NEXT_STATE_5 (.Q (Control_NEXT_STATE_5), .D (Control_nx130
          ), .CLK (Control_nx646)) ;
    ao21 Control_ix131 (.Y (Control_nx130), .A0 (start), .A1 (
         Control_PRES_STATE_5), .B0 (Control_nx126)) ;
    dff Control_reg_PRES_STATE_5 (.Q (Control_PRES_STATE_5), .QB (Control_nx598)
        , .D (Control_nx140), .CLK (clock)) ;
    nor04 Control_ix127 (.Y (Control_nx126), .A0 (Control_nx574), .A1 (
          Control_count_2), .A2 (Control_nx622), .A3 (Control_count_1)) ;
    latch Control_lat_count_2 (.Q (Control_count_2), .D (Control_nx108), .CLK (
          Control_nx14)) ;
    xnor2 Control_ix608 (.Y (Control_nx607), .A0 (Control_count_2), .A1 (
          Control_nx661)) ;
    dff Control_reg_PRES_STATE_4 (.Q (Control_PRES_STATE_4), .QB (
        Control_NOT_PRES_STATE_4), .D (Control_nx158), .CLK (clock)) ;
    inv02 Control_ix617 (.Y (Control_nx616), .A (clock)) ;
    latch Control_lat_count_1 (.Q (Control_count_1), .D (Control_nx80), .CLK (
          Control_nx14)) ;
    dff Control_reg_PRES_STATE_3 (.Q (Control_PRES_STATE_3), .QB (Control_nx574)
        , .D (Control_nx72), .CLK (clock)) ;
    ao21 Control_ix105 (.Y (Control_nx556), .A0 (Control_count_1), .A1 (
         Control_count_0), .B0 (Control_nx661)) ;
    nor03_2x Control_ix25 (.Y (Control_nx24), .A0 (Control_PRES_STATE_1), .A1 (
             Control_PRES_STATE_4), .A2 (Control_PRES_STATE_2)) ;
    inv02 Control_ix631 (.Y (Control_nx630), .A (mult_out[0])) ;
    latch Control_lat_M_sig (.Q (m_sig), .D (Control_PRES_STATE_4), .CLK (
          Control_nx648)) ;
    latch Control_lat_done_sig (.Q (done), .D (Control_PRES_STATE_5), .CLK (
          Control_nx648)) ;
    latch Control_lat_A_sig_0 (.Q (a_con_0), .D (Control_nx28), .CLK (
          Control_nx648)) ;
    latch Control_lat_A_sig_1 (.Q (a_con_1), .D (Control_nx24), .CLK (
          Control_nx648)) ;
    latch Control_lat_Q_sig_0 (.Q (q_con_0), .D (Control_nx10), .CLK (
          Control_nx648)) ;
    latch Control_lat_Q_sig_1 (.Q (q_con_1), .D (Control_NOT_PRES_STATE_4), .CLK (
          Control_nx648)) ;
    inv02 Control_ix29 (.Y (Control_nx28), .A (Control_nx592)) ;
    inv08 Control_ix15 (.Y (Control_nx14), .A (Control_nx625)) ;
    buf02 Control_ix645 (.Y (Control_nx646), .A (Control_nx36)) ;
    buf02 Control_ix647 (.Y (Control_nx648), .A (Control_nx36)) ;
    buf08 Control_ix649 (.Y (Control_nx650), .A (Control_nx90)) ;
    ao21 Control_ix169 (.Y (Control_nx168), .A0 (Control_PRES_STATE_3), .A1 (
         Control_nx656), .B0 (Control_PRES_STATE_4)) ;
    nor02ii Control_ix610 (.Y (Control_nx609), .A0 (Control_count_1), .A1 (
            Control_nx622)) ;
    or03 Control_ix629 (.Y (Control_nx656), .A0 (Control_count_2), .A1 (
         Control_nx622), .A2 (Control_count_1)) ;
    latchr Control_lat_count_0__u1 (.QB (Control_nx5), .D (Control_nx650), .CLK (
           Control_nx14), .R (Control_nx543)) ;
    inv01 Control_lat_count_0__u2 (.Y (Control_count_0), .A (Control_nx5)) ;
    buf02 Control_lat_count_0__u3 (.Y (Control_nx622), .A (Control_nx5)) ;
    buf02 Control_ix660 (.Y (Control_nx661), .A (Control_nx609)) ;
    nor03 Control_ix593 (.Y (Control_nx592), .A0 (Control_PRES_STATE_4), .A1 (
          Control_PRES_STATE_5), .A2 (Control_PRES_STATE_0)) ;
    nor02_2x Control_ix151 (.Y (Control_nx150), .A0 (start), .A1 (Control_nx598)
             ) ;
    oai21 Control_ix109 (.Y (Control_nx108), .A0 (Control_nx574), .A1 (
          Control_nx607), .B0 (Control_NOT_PRES_STATE_4)) ;
    nor02ii Control_ix91 (.Y (Control_nx90), .A0 (Control_nx574), .A1 (
            Control_nx622)) ;
    and02 Control_ix81 (.Y (Control_nx80), .A0 (Control_PRES_STATE_3), .A1 (
          Control_nx556)) ;
    oai21 Control_ix626 (.Y (Control_nx625), .A0 (Control_PRES_STATE_4), .A1 (
          Control_PRES_STATE_3), .B0 (clock)) ;
    nor02_2x Control_ix11 (.Y (Control_nx10), .A0 (Control_PRES_STATE_4), .A1 (
             Control_PRES_STATE_3)) ;
endmodule