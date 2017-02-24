/*
This module cotains the Ethernet Packet Detector implementation
of Cobinational and Sequential parts of the controller Logic.
*/
// `include "header_fsm.v"
// `include "payload_crc.v"

module control_fsm(
		input clock,
		input reset,
		input control,
		input type_length_valid,
		input packet_size_valid,
		output enable_header,
		output enable_payload
	);

//Inputs: all ACTIVE HIGH
wire clock, reset, control, 
	type_length_valid, packet_size_valid;

//Outputs: all ACTIVE HIGH
reg enable_header, enable_payload; //enable signals for header and payload modules

//3 states
parameter [1:0] STATE0 = 2'b00;
parameter [1:0] STATE1 = 2'b01;
parameter [1:0] STATE2 = 2'b10;

reg [1:0] state, next_state;

always @(control or type_length_valid or packet_size_valid) begin
	//next_state = 2'b00;
	case(state)
		STATE0:begin
			if(type_length_valid == 1'b1 && control == 1'b1)begin
				next_state = STATE1;
			end
		end
		STATE1:begin
			if(packet_size_valid == 1'b1)begin
				next_state = STATE2;
			end
		end
		STATE2:begin
			if(control == 1'b0)begin
				next_state = STATE0;
			end
		end
		default: next_state = STATE0;
	endcase
end

always @(posedge clock) begin
	if (reset == 1'b1) begin // reset is synchronus active high
		state <= STATE0;
		enable_header = 1'b1;
		enable_payload = 1'b0;
	end
	else begin
		state = next_state; //blocking assignment
		case(state)
			STATE0:begin
				enable_header <= 1'b1;
				enable_payload <= 1'b0;
			end
			STATE1:begin
				enable_header <= 1'b0;
				enable_payload <= 1'b1;
			end
			STATE2:begin
				enable_header <= 1'b0;
				enable_payload	 <= 1'b0;
			end

		endcase
	end
end

// header_fsm U_header_fsm(
// .clock (clock),
// .reset (reset),
// .enable (enable_h),
// .data (data),
// .preamble_valid (preamble_valid),
// .dst_addr_valid (dst_addr_valid),
// .src_addr_valid (src_addr_valid),
// .type_length_valid (type_length_valid)
// );

// payload_crc U_payload_crc(
// .clock (clock),
// .reset (reset),
// .enable (enable_p),
// .packet_size_valid (packet_size_valid)
// .valid_packet_counter (valid_packet_counter)
// );

endmodule