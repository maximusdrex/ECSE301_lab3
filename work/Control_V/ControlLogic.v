module ControlLogic(Q_in, clock, start, Q_sig, A_sig, done_sig, M_sig, adder_sig);
	input [1:0] Q_in;
	input clock, start;
	output done_sig, M_sig, adder_sig;
	output [1:0] Q_sig, A_sig;

	reg adder_sig, done_sig, M_sig;
	reg [1:0] Q_sig, A_sig;

	parameter /*pragma enum state_parameters auto*/ s0 = 3'b000, s5 = 3'b001, s10 = 3'b011, s15 = 3'b010, start_state=3'b111, end_state = 3'b110; 
	
	parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11,
		Add = 1'b0 , Sub = 1'b1,
		LD = 1'b1 , HD = 1'b0;

	reg [2:0] /*pragma enum state_parameters */ NEXT_STATE; reg [2:0] /*pragma enum state_parameters */ PRES_STATE;
	reg [2:0] count;


always @(clock or Q_in) begin
	if (clock == 1'b1) begin
	case(PRES_STATE)
		start_state: begin
			adder_sig=Add;
			A_sig=Reset;
			M_sig=LD;
			Q_sig=Load;
			done_sig = 1'b0;
			NEXT_STATE=s0;
			count = 4;
		end
		s0: begin
			adder_sig=Add;
			A_sig=Hold;
			M_sig=HD;
			Q_sig=Hold;
			done_sig = 1'b0;
			if(Q_in==2'b10) begin NEXT_STATE = s10; end else
			if(Q_in==2'b01) begin NEXT_STATE = s5; end else
			begin NEXT_STATE = s15; end
			$display("Next: %2b -> %2b", NEXT_STATE, Q_in);
		end
		s5: begin
			adder_sig=Add;
			A_sig=Load;
			M_sig=HD;
			Q_sig=Hold;
			done_sig = 1'b0;
			NEXT_STATE = s15;
		end
		s10: begin
			adder_sig=Sub;
			A_sig=Load;
			M_sig=HD;
			Q_sig=Hold;
			done_sig = 1'b0;
			NEXT_STATE = s15;
		end
		s15: begin
			adder_sig=Add;
			A_sig=Shift;
			M_sig=HD;
			Q_sig=Shift;
			done_sig = 1'b0;
			$display("COUNT: %1d", count);
			count = count - 1;
			if(count==0) begin NEXT_STATE = end_state; end else
			begin 
				NEXT_STATE = s0; 
			end
		end
		end_state: begin
			adder_sig=Add;
			A_sig=Hold;
			M_sig=HD;
			Q_sig=Hold;
			done_sig = 1'b1;
			if(start==1) begin 
				NEXT_STATE = end_state;
			end else begin
				NEXT_STATE = start_state;
			end
		end
	endcase
	end
end


always @(posedge clock)
begin
	if (start == 1'b1) PRES_STATE = start_state;
		else PRES_STATE = NEXT_STATE;
end

/*always @(posedge start)
begin
	NEXT_STATE = start_state;
	$display("STATE: %1d | %2b", NEXT_STATE, Q_in);
end */

endmodule