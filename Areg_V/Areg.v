module Areg(control, clock,  A, A_out);
input [3:0] A;
input [1:0] control;
input clock;
output [3:0] A_out;

reg [3:0] A_out;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;

always @(negedge clock) begin
    case(control)
    Load: A_out = A;
    Reset: A_out = 3'b000;
    Shift: A_out = {A[3],A[3],A[2],A[1]};
    Hold: ;
    endcase
end

endmodule
