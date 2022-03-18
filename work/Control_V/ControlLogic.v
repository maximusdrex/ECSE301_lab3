module ControlLogic(Q_in, clock, start, Q_sig, A_sig, done_sig, M_sig, adder_sig);
	input [1:0] Q_in;
	input clock, start;
	output done_sig, M_sig, adder_sig;
	output [1:0] Q_sig, A_sig;

	reg Adder, done, M;
	reg [1:0] Q, A;

	reg [2:0] NEXT_STATE; reg [2:0] PRES_STATE;
	reg [2:0] count;
	parameter s0 = 3'b000, s5 = 3'b001, s10 = 3'b011, s15 = 3'b010, start_state=3'b111, end_state = 3'b110;
	parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11,
		Add = 1'b0 , Sub = 1'b1,
		LD = 1'b1 , HD = 1'b0;

	assign done_sig = done;
	assign adder_sig = Adder;
	assign M_sig = M;
	assign Q_sig = Q;
	assign A_sig = A;

always @(clock or Q_in) begin
	if (clock == 1'b1) begin
		
	
	case(PRES_STATE)
	start_state: begin
		Adder=Add;
		done = 1'b0;
		NEXT_STATE=s0;
		count = 4;
		M=LD;
		Q=Load;
		A=Reset;
	end
	s0: begin
		Adder=Add;
		M=HD;
		Q=Hold;
		A=Hold;
		done = 1'b0;
		// The problem is here, going to add instead of subtract
		if(Q_in==2'b10) begin NEXT_STATE = s10; end else
		if(Q_in==2'b01) begin NEXT_STATE = s5; end else
		begin NEXT_STATE = s15; end
		$display("Next: %1d -> %2b", NEXT_STATE, Q_in);
	end
	s5: begin
		Adder=Add;
		A=Load;
		Q=Hold;
		M=HD;
		done = 1'b0;
		NEXT_STATE = s15; 
		$display("Add");
	end
	s10: begin
		Adder=Sub;
		A=Load;
		Q=Hold;
		M=HD;
		done = 1'b0;
		NEXT_STATE = s15;
		$display("Sub");
	end
	s15: begin
		Adder=Add;
		count = count - 1;
		A=Shift;
		Q=Shift;
		M=HD;
		done = 1'b0;
		if(count==0) begin NEXT_STATE = end_state; end else
		begin NEXT_STATE = s0; end
		$display("shift");
	end
	end_state: begin
		Adder=Add;
		M=HD;
		Q=Hold;
		A=Hold;
		done = 1'b1;
		NEXT_STATE = end_state;
	end
	default: begin
		done = 1'b0;
		NEXT_STATE=s0;
		count = 4;
		M=LD;
		Q=Load;
		A=Reset;
	end
	endcase
	end
end


always @(negedge clock)
begin
	if (start == 1'b1) PRES_STATE = start_state;
		else PRES_STATE = NEXT_STATE;
end

always @(posedge start)
begin
	PRES_STATE = start_state;
	NEXT_STATE=start_state;
	$display("STATE: %1d | %2b", NEXT_STATE, Q_in);
	$monitor("Count: %1d", count);
end

endmodule