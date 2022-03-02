`timescale 1ns/1ps

module ControlLogic(Q_in, clock, start, Q_out, A_out, done, M_out, adder);
	input [1:0] Q_in;
	input clock, start;
	output reg done, M_out , adder;
	output reg [1:0] Q_out, A_out;

	reg [2:0] NEXT_STATE; reg [2:0] PRES_STATE;
	reg [2:0] count;
	parameter s0 = 3'b000, s5 = 3'b001, s10 = 3'b011, s15 = 3'b010, start_state=3'b111, end_state = 3'b110;
	parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11,
		Add = 1'b0 , Sub = 1'b1,
		LD = 1'b1 , HD = 1'b0;

initial begin
	done = 1'b0;
	M_out = 1'b0;
	adder = 1'b0;
	Q_out = 2'b00;
	A_out = 2'b00;
	PRES_STATE=start_state;
	NEXT_STATE=start_state;
	count = 4;
end

always @(PRES_STATE or Q_in) begin
	case(PRES_STATE)
	start_state: begin
		NEXT_STATE=s0;
		count = 4;
		M_out=LD;
		Q_out=Load;
		A_out=Reset;
	end
	s0: begin
		M_out=HD;
		Q_out=Hold;
		A_out=Hold;
		if(Q_in==2'b10) begin NEXT_STATE = s10; end else
		if(Q_in==2'b01) begin NEXT_STATE = s5; end else
		begin NEXT_STATE = s15; end
	end
	s5: begin //state = s5
		adder=Add;
		A_out=Load;
		Q_out=Hold;
		M_out=Hold;
		NEXT_STATE = s15; 
	end
	s10: begin //state = s10
		adder=Sub;
		A_out=Load;
		Q_out=Hold;
		M_out=Hold;
		NEXT_STATE = s15;
	end
	s15: begin 
		count = count - 1;
		A_out=Shift;
		Q_out=Shift;
		M_out=Shift;
		if(count==0) begin NEXT_STATE = end_state; end else
		begin NEXT_STATE = s0; end
	end //state = s15
	end_state: begin
		M_out=HD;
		Q_out=Hold;
		A_out=Hold;
		done = 1'b1;
		NEXT_STATE = end_state;
	end
	endcase
end

always @(posedge clock) //clock the state flipflops. use synchronous start
begin
	$display("test");
	if (start == 1'b1) PRES_STATE = start_state;
		else PRES_STATE = NEXT_STATE;
end
endmodule