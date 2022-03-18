module Areg(adder, control, clock, A_out);
input [3:0] adder;
input [1:0] control;
input clock;
output [3:0] A_out;

reg [3:0] A_out;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;

always @(posedge clock) begin
    case(control)
    Load: begin
        A_out = adder;
    end
    Reset: begin
        A_out = 4'b0000;
    end
    Shift: begin
        A_out = {A_out[3], A_out[3], A_out[2], A_out[1]}
    end
    Hold: ;
    endcase
end

endmodule