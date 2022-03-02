`timescale 1ns/1ps

module testcontrol();

logic clock;
logic start, done, M_out, adder;
logic [1:0] Q_out, A_out, Q_in;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11,
		Add = 1'b0 , Sub = 1'b1,
		LD = 1'b1 , HD = 1'b0;

ControlLogic Control(
    .clock (clock),
    .start (start),
    .done (done),
    .M_out (M_out),
    .adder (adder),
    .Q_out (Q_out),
    .A_out (A_out),
    .Q_in (Q_in)
);

initial begin
    clock   = 1'b0;
    start = 1'b1;
    Q_in = 2'b00;

    forever #5 clock = ~clock;
end

initial begin
    #10;
    start = 1'b0; 
    forever #20 Q_in = Q_in + 1;
end

always @(posedge done) begin
    $display("done!");
    #5
    $finish();
end

initial begin
    $monitor("%1b | %1b | %2b | %2b | %2b | %1b | %1b | %1b", clock, start, Q_in, Q_out, A_out, M_out, adder, done);
end
endmodule