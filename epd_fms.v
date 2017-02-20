/*
This module cotains the Ethernet Packet Detector implementation
of Cobinational and Sequential parts of the Moore Finite State Machine
*/

module epd_fms(
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

wire clock, reset, [7:0] data, control;

reg preamble_valid, src_addr_valid, 
	dst_addr_valid, type_length_valid,
	packet_size_valid, [3:0] valid_packet_counter;

parameter [6:0] STATE0 = 7'b0000000;
parameter [6:0] STATE1 = 7'b0000000;
parameter [6:0] STATE2 = 7'b0000000;
parameter [6:0] STATE0 = 7'b0000000;
parameter [6:0] STATE0 = 7'b0000000;
parameter [6:0] STATE0 = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;
parameter [6:0] IDLE = 7'b0000000;

always @(posedge clock) begin
	if (reset) begin
		
		
	end
	else if () begin
		
	end
end


endmodule