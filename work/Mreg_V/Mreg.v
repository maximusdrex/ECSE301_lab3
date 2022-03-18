module Mreg(load, control, clock, M_out);

input [3:0] load;
input control;
input clock;
output [3:0] M_out;

reg [3:0] M_out;

parameter LD = 1'b1 , HD = 1'b0;

always @(posedge clock) begin
    case(control)
    LD: begin
        M_out = load;
    end
    HD: ;
    endcase
end

endmodule