module mult_test();

logic clock, start, done;
logic signed [3:0] q_in, m_in;
logic signed [7:0] out;

initial begin
    start = 1'b0;
    q_in = 6;
    m_in = -3;

    #1 start = 1'b1;
    #10 start = 1'b0;
end

initial begin
    clock = 1'b0;
    forever #10 clock = ~clock;
end

TopModel mult(
    .clock (clock),
    .start (start),
    .done (done),
    .q_in (q_in),
    .m_in (m_in),
    .mult_out (out)
);

always @(posedge done) begin
    $display("done! Product: %2d; Time: %t", out, $time);
    #5
    $finish();
end

always @(posedge clock) begin
    $display("%2d, %7b | %1b", out, out, done);
end

initial begin
    $monitor("%2d | %1b", out, done);
end



endmodule