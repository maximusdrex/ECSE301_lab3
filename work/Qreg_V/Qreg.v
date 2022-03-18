module Qreg(load, control, clock, Q_out, A_in);

input [3:0] load;
input [1:0] control;
input clock;
input A_in;
output [4:0] Q_out;

reg [4:0] Q_out;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;


always @(negedge clock) begin
    case(control)
    Load: begin
        Q_out[4:1] = load;
        Q_out[0] = 1'b0;
    end
    Reset: begin
        Q_out = 5'b0000;
    end
    Shift: begin
        Q_out = Q_out >> 1;
        Q_out[4] = A_in;
    end
    Hold: ;
    default: begin
        Q_out[4:1] = load;
        Q_out[0] = 1'b0;
    end
    endcase
end

endmodule