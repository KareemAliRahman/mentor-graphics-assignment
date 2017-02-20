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

reg [6:0] state, next_state;

parameter [6:0] STATE0  = 7'b0000000;
parameter [6:0] STATE1  = 7'b0000001;
parameter [6:0] STATE2  = 7'b0000010;
parameter [6:0] STATE3  = 7'b0000011;
parameter [6:0] STATE4  = 7'b0000100;
parameter [6:0] STATE5  = 7'b0000101;
parameter [6:0] STATE6  = 7'b0000110;
parameter [6:0] STATE7  = 7'b0000111;
parameter [6:0] STATE8  = 7'b0001000;
parameter [6:0] STATE9  = 7'b0001001;
parameter [6:0] STATE10 = 7'b0001010;
parameter [6:0] STATE11 = 7'b0001011;
parameter [6:0] STATE12 = 7'b0001100;
parameter [6:0] STATE13 = 7'b0001101;
parameter [6:0] STATE14 = 7'b0001110;
parameter [6:0] STATE15 = 7'b0001111;
parameter [6:0] STATE16 = 7'b0010000;
parameter [6:0] STATE17 = 7'b0010001;
parameter [6:0] STATE18 = 7'b0010010;
parameter [6:0] STATE19 = 7'b0010011;
parameter [6:0] STATE20 = 7'b0010100;
parameter [6:0] STATE21 = 7'b0010101;
parameter [6:0] STATE22 = 7'b0010110;
parameter [6:0] STATE23 = 7'b0010111;
parameter [6:0] STATE24 = 7'b0011000;
parameter [6:0] STATE25 = 7'b0011001;
parameter [6:0] STATE26 = 7'b0011010;
parameter [6:0] STATE27 = 7'b0011011;
parameter [6:0] STATE28 = 7'b0011100;
parameter [6:0] STATE29 = 7'b0011101;
parameter [6:0] STATE30 = 7'b0011110;
parameter [6:0] STATE31 = 7'b0011111;
parameter [6:0] STATE32 = 7'b0100000;
parameter [6:0] STATE33 = 7'b0100001;
parameter [6:0] STATE34 = 7'b0100010;
parameter [6:0] STATE35 = 7'b0100011;
parameter [6:0] STATE36 = 7'b0100100;
parameter [6:0] STATE37 = 7'b0100101;
parameter [6:0] STATE38 = 7'b0100110;
parameter [6:0] STATE39 = 7'b0100111;
parameter [6:0] STATE40 = 7'b0101000;
parameter [6:0] STATE41 = 7'b0101001;
parameter [6:0] STATE42 = 7'b0101010;
parameter [6:0] STATE43 = 7'b0101011;
parameter [6:0] STATE44 = 7'b0101100;
parameter [6:0] STATE45 = 7'b0101101;
parameter [6:0] STATE46 = 7'b0101110;
parameter [6:0] STATE47 = 7'b0101111;
parameter [6:0] STATE48 = 7'b0110000;
parameter [6:0] STATE49 = 7'b0110001;
parameter [6:0] STATE50 = 7'b0110010;
parameter [6:0] STATE51 = 7'b0110011;
parameter [6:0] STATE52 = 7'b0110100;
parameter [6:0] STATE53 = 7'b0110101;
parameter [6:0] STATE54 = 7'b0110110;
parameter [6:0] STATE55 = 7'b0110111;
parameter [6:0] STATE56 = 7'b0111000;
parameter [6:0] STATE57 = 7'b0111001;
parameter [6:0] STATE58 = 7'b0111010;
parameter [6:0] STATE59 = 7'b0111011;
parameter [6:0] STATE60 = 7'b0111100;
parameter [6:0] STATE61 = 7'b0111101;
parameter [6:0] STATE62 = 7'b0111110;
parameter [6:0] STATE63 = 7'b0111111;
parameter [6:0] STATE64 = 7'b1000000;
parameter [6:0] STATE65 = 7'b1000001;
parameter [6:0] STATE66 = 7'b1000010;
parameter [6:0] STATE67 = 7'b1000011;
parameter [6:0] STATE68 = 7'b1000100;
parameter [6:0] STATE69 = 7'b1000101;
parameter [6:0] STATE70 = 7'b1000110;
parameter [6:0] STATE71 = 7'b1000111;

always @(posedge clock) begin
	if (reset == 1'b1) begin // reset is synchronus logical high
		
	end
	else if () begin
		
	end
end


endmodule