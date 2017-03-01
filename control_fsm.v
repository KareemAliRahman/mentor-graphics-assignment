/*
This module cotains the Ethernet Packet Detector implementation
of Cobinational and Sequential parts of the controller Logic.
*/
module control_fsm(
		input clock,
		input reset,
		input control,
		input [7:0] data,
		input type_length_valid,
		input packet_size_valid,
		output enable_header,
		output enable_payload
	);

//Inputs: all ACTIVE HIGH
wire clock, reset, control, 
	type_length_valid, packet_size_valid;
wire [7:0] data;

//Outputs: all ACTIVE HIGH
wire enable_header, enable_payload; //enable signals for header and payload modules

//3 states
parameter [1:0] STATE0 = 2'b00;
parameter [1:0] STATE1 = 2'b01;
parameter [1:0] STATE2 = 2'b10;

reg [1:0] state = STATE0;
reg [1:0] next_state = STATE0;

assign enable_header = control && !state;
assign enable_payload = control & state;

always @(type_length_valid or packet_size_valid or state) begin
	next_state = STATE0; //prevent unintended latches
	case(state)
		STATE0:begin
			next_state = STATE0;
			if(type_length_valid == 1'b1 && control == 1'b1)begin
				next_state = STATE1;
			end
		end
		STATE1:begin
			next_state = STATE1;
			if(packet_size_valid == 1'b1)begin
				next_state = STATE2;
			end
		end
		STATE2:begin
			next_state = STATE2;
			if(control == 1'b0 && data == 8'h00)begin
				next_state = STATE0;
			end
		end
	endcase
end

always @(posedge clock) begin
	// reset are synchronus active high
	if (reset == 1'b1) begin
		state <= STATE0;
	end
	else begin
		state = next_state; //blocking assignment
		if((control == 1'b0 && state != STATE2 )
			||(control == 1'b0 && state == STATE2 && data == 2'b00))begin
			state <= STATE0;
		end

	end
end

endmodule