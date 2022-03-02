module Mreg(load, control, clock, M_out);

input [3:0] load;
input control;
input clock;
output reg [3:0] M_out;

reg [3:0] M;

parameter LD = 1'b1 , HD = 1'b0;

initial begin
    M = 3'b000;
    M_out = 3'b000;
end

always @(posedge clock) begin
    M_out = M;
end

always @(negedge clock) begin
    case(control)
    LD: begin
        M = load;
    end
    HD: begin
        M = M;
    end
    endcase
end

endmodule