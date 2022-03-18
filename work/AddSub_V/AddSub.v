module AddSub(mult, control, A_in, A_out, clock);
    input control, clock;
    input [3:0] A_in, mult;
    output [3:0] A_out;

    parameter Add = 1'b0 , Sub = 1'b1;

    reg [3:0] A_out;
     
    always @(posedge clock) begin
        A_out = (control == Add) ? A_in + mult : A_in - mult;
    end

endmodule