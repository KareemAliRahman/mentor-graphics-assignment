/*
ETHERNET PACKET DETECTOR
*/
`include "header_fsm.v"
`include "payload_crc.v"
`include "control_fsm.v"

module epd(
		input clock,
		input reset,
		input [7:0] data,
		input control,
		output preamble_valid,
		output dst_addr_valid,
		output src_addr_valid,
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
wire [3:0] valid_packet_counter;

control_fsm U_control_fsm(
clock,
reset,
control,
data,
type_length_valid,
packet_size_valid,
enable_header,
enable_payload
);

header_fsm U_header_fsm(
.clock (clock),
.reset (reset),
.enable (enable_header),
.data (data),
.preamble_valid (preamble_valid),
.dst_addr_valid (dst_addr_valid),
.src_addr_valid (src_addr_valid),
.type_length_valid (type_length_valid)
);

payload_crc U_payload_crc(
.clock (clock),
.reset (reset),
.enable (enable_payload),
.packet_size_valid (packet_size_valid),
.valid_packet_counter (valid_packet_counter)
);

endmodule