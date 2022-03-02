`timescale 1ns/1ps

module testaddsub();

logic clock;
logic control;

logic [3:0] mult, A_in, A_out;

parameter Add = 1'b0 , Sub = 1'b1;


AddSub adder (
    .control (control),
    .clock (clock),
    .mult (mult),
    .A_in (A_in),
    .A_out (A_out)
);

initial begin
    A_in = 3;
    mult = 2;
    control = Add;

    #5 control = Sub;
end

endmodule