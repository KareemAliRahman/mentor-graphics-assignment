`include "epd.v"

module epd_tb;
	
reg clock, reset, control;
reg [7:0] data;

wire preamble_valid, dst_addr_valid, src_addr_valid,
	type_length_valid, packet_size_valid;
wire [3:0] valid_packet_counter;

epd U_epd(
clock,
reset,
data,
control,
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid,
packet_size_valid,
valid_packet_counter 
);

//initial values
initial begin
	clock = 0;
	reset = 0;
	control = 0;
	data = 0;
end

//clock generator
always
	#2 clock =~ clock;


// task send_valid_dst_addr;
// 	#2 data = 8'h01;#2 data = 8'h02;#2 data = 8'h03;#2 data = 8'h04; // DST
//     #2 data = 8'h05;#2 data = 8'h06;
// endtask

// task send_valid_src_addr;
// 	#2 data = 8'hFF;#2 data = 8'hFE;#2 data = 8'hFD;#2 data = 8'hFC; // SRC
//     #2 data = 8'hFB;#2 data = 8'hFA;
// endtask

// task send_valid_length;
// 	#2 data = 8'h08;#2 data = 8'h00; //valid type_length
// endtask

// task send_payload;
// 	repeat (25) #2 data = 8'h55;#2 data = 8'h56; //send payload and crc
// endtask

// task send_valid_packet;
// 	send_valid_preamble();
// 	send_valid_dst_addr();
// 	send_valid_src_addr();
// 	send_valid_length();
// 	send_payload();
// endtask

endmodule