module TopModel(clock, start, q_in, m_in, done, mult_out);
input clock, start;
input [3:0] q_in, m_in;
output done;
output [7:0] mult_out;

wire m_sig, add_sig;
wire [1:0] a_con, q_con;
wire [3:0] a_out, m_out, a_in;
wire [4:0] q_out;

assign mult_out[7:4] = a_out;
assign mult_out[3:0] = q_out[4:1];

always @(clock) begin
    #2 $display("OUT: %1b | %d | %8b ", clock, mult_out, mult_out);
end

ControlLogic Control(
    .clock (clock),
    .start (start),
    .done_sig (done),
    .M_sig (m_sig),
    .adder_sig (add_sig),
    .Q_sig (q_con),
    .A_sig (a_con),
    .Q_in (q_out[1:0])
);

Areg A(
    .adder (a_in),
    .control (a_con),
    .clock (clock),
    .A_out (a_out)
);

Mreg M(
    .load (m_in),
    .control (m_sig),
    .clock (clock),
    .M_out (m_out)
);

Qreg Q(
    .load (q_in),
    .control (q_con),
    .clock (clock),
    .Q_out (q_out),
    .A_in (a_out[0])
);

AddSub Adder(
    .mult (m_out),
    .control (add_sig),
    .clock (clock),
    .A_in (a_out),
    .A_out (a_in)
);

endmodule