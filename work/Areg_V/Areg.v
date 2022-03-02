module Areg(adder, control, clock, A_out);
input [3:0] adder;
input [2:0] control;
input clock;
output reg [3:0] A_out;

reg [3:0] A;

parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;


initial begin
    A = 3'b000;
    A_out = 3'b000;
end

always @(posedge clock) begin
    A_out = A;
end

always @(negedge clock) begin
    case(control)
    Load: begin
        A = adder;
    end
    Reset: begin
        A = 3'b000;
    end
    Shift: begin
        A = A >> 1;
        A[3] = A[2];
    end
    Hold: begin
        A = A;
    end
    endcase
end

endmodule