module Qreg(load, control, clock, Q_out, A_in);

input [3:0] load;
input [2:0] control;
input clock;
input A_in;
output reg [3:0] Q_out;

reg [3:0] Q;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;


initial begin
    Q = 3'b000;
    Q_out = 3'b000;
end

always @(posedge clock) begin
    Q_out = Q;
end

always @(negedge clock) begin
    case(control)
    Load: begin
        Q = load;
    end
    Reset: begin
        Q = 3'b000;
    end
    Shift: begin
        Q = Q >> 1;
        Q[3] = A_in;
    end
    Hold: begin
        Q = Q;
    end
    endcase
end

endmodule