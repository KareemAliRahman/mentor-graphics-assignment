/*
This module cotains the Ethernet Packet Detector implementation
of Cobinational and Sequential parts of the Moore Finite State Machine
*/
`include "header_fsm.v"
`include "payload_crc.v"

module epd_fsm(
		input clock,
		input reset,
		input [7:0] data,
		input control,
		output preamble_valid,
		output src_addr_valid,
		output dst_addr_valid,
		output type_length_valid,
		output packet_size_valid,
		output [3:0] valid_packet_counter 
	);

//Inputs: all ACTIVE HIGH
wire clock, reset, control;
wire [7:0] data;

//Outputs: all ACTIVE HIGH
wire preamble_valid, src_addr_valid, 
	dst_addr_valid, type_length_valid,
	packet_size_valid;
reg [3:0] valid_packet_counter;

parameter [1:0] STATE0 = 2'b00;
parameter [1:0] STATE1 = 2'b01;
parameter [1:0] STATE2 = 2'b10;

reg enable_h, enable_p;
reg [1:0] state, next_state;

always @(state or control or data or type_length_valid or packet_size_valid) begin
	next_state = 0;
	enable_h = 0;
	enable_p = 0;	
	case (state)
		STATE0: begin
				enable_h = 1'b1;
				enable_p = 1'b0;
				if (type_length_valid == 1'b1 && control == 1'b1) begin
					next_state = STATE1;
				end
			end
		STATE1: begin
				enable_h = 0;
				enable_p = 1;
				if (packet_size_valid == 1'b1 && control == 1'b1) begin
					next_state = STATE2;
				end	
			end
		STATE2: begin
				enable_p = 0;
				if (data == 0 && control == 1'b0) begin
					next_state = STATE0;
				end
			end
	endcase
end


always @(posedge clock) begin
	if (reset == 1'b1) begin // reset is synchronus active high
		state <= STATE0;
		// preamble_valid <= 1'b0;
		// src_addr_valid <= 1'b0;
		// dst_addr_valid <= 1'b0;
		// type_length_valid <= 1'b0;
		// packet_size_valid <= 1'b0;
		valid_packet_counter <= 4'h0;		
	end
	else begin
		state <= next_state;
		if (state == STATE2) begin
			valid_packet_counter <= valid_packet_counter + 1;	
		end		
	end
end

header_fsm U_header_fsm(
.enable (enable_h),
.clock (clock),
.data (data),
.preamble_valid (preamble_valid),
.dst_addr_valid (dst_addr_valid),
.src_addr_valid (src_addr_valid),
.type_length_valid (type_length_valid)
);

payload_crc U_payload_crc(
.enable (enable_p),
.clock (clock),
.packet_size_valid (packet_size_valid)
);

endmodule