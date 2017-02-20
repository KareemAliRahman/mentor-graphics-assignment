module header_fsm(
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

wire [7:0] data;
wire clock, reset, control;

reg preamble_valid, src_addr_valid, 
	dst_addr_valid, type_length_valid,
	packet_size_valid;
reg [3:0] valid_packet_counter;

reg [4:0] state, next_state;

parameter [4:0] STATE0  = 5'b00000;
parameter [4:0] STATE1  = 5'b00001;
parameter [4:0] STATE2  = 5'b00010;
parameter [4:0] STATE3  = 5'b00011;
parameter [4:0] STATE4  = 5'b00100;
parameter [4:0] STATE5  = 5'b00101;
parameter [4:0] STATE6  = 5'b00110;
parameter [4:0] STATE7  = 5'b00111;
parameter [4:0] STATE8  = 5'b01000;
parameter [4:0] STATE9  = 5'b01001;
parameter [4:0] STATE10 = 5'b01010;
parameter [4:0] STATE11 = 5'b01011;
parameter [4:0] STATE12 = 5'b01100;
parameter [4:0] STATE13 = 5'b01101;
parameter [4:0] STATE14 = 5'b01110;
parameter [4:0] STATE15 = 5'b01111;
parameter [4:0] STATE16 = 5'b10000;
parameter [4:0] STATE17 = 5'b10001;
parameter [4:0] STATE18 = 5'b10010;
parameter [4:0] STATE19 = 5'b10011;
parameter [4:0] STATE20 = 5'b10100;
parameter [4:0] STATE21 = 5'b10101;
parameter [4:0] STATE22 = 5'b10110;


//COMBINATIONAL LOGIC
always @(state or data or control) begin
	next_state = 0; //prevent latches
	if (control == 1'b1) begin
		case({state,data}) 
			{STATE0,8'h55}:next_state = STATE1;//1st byte PREAMBLE
			{STATE1,8'h55}:next_state = STATE2;//2nd byte PREAMBLE
			{STATE2,8'h55}:next_state = STATE3;//3rd byte PREAMBLE
			{STATE3,8'h55}:next_state = STATE4;//4th byte PREAMBLE
			{STATE4,8'h55}:next_state = STATE5;//5th byte PREAMBLE
			{STATE5,8'h55}:next_state = STATE6;//6th byte PREAMBLE
			{STATE6,8'h55}:next_state = STATE7;//7th byte PREAMBLE
			{STATE7,8'hD5}:next_state = STATE8;//8th byte PREAMBLE			
			
			{STATE8,8'h01}:next_state = STATE9;//1st byte DST_ADDRESS
			{STATE9,8'h02}:next_state = STATE10;//2nd byte DST_ADDRESS
			{STATE10,8'h03}:next_state = STATE11;//3rd byte DST_ADDRESS
			{STATE11,8'h04}:next_state = STATE12;//4th byte DST_ADDRESS
			{STATE12,8'h05}:next_state = STATE13;//5th byte DST_ADDRESS
			{STATE13,8'h06}:next_state = STATE14;//6th byte DST_ADDRESS

			{STATE14,8'hFF}:next_state = STATE15;//1st byte SRC_ADDRESS
			{STATE15,8'hFE}:next_state = STATE16;//2nd byte SRC_ADDRESS
			{STATE16,8'hFD}:next_state = STATE17;//3rd byte SRC_ADDRESS
			{STATE17,8'hFC}:next_state = STATE18;//4th byte SRC_ADDRESS
			{STATE18,8'hFB}:next_state = STATE19;//5th byte SRC_ADDRESS
			{STATE19,8'hFA}:next_state = STATE20;//6th byte SRC_ADDRESS

			{STATE20,8'h08}:next_state = STATE21;//1st byte TYPE_LENGTH
			{STATE21,8'h00}:next_state = STATE22;//2nd byte TYPE_LENGTH

			default: next_state = STATE0; //anything Else is start from begininng 
		endcase
	end
end

always @(posedge clock) begin //positive transition of clock 
	if (rst) begin
		// reset
		
	end
	else if () begin
		
	end
end

// always @(posedge clock) begin
// 	if (reset == 1'b1) begin // reset is synchronus logical high
		
// 	end
// 	else if () begin
		
// 	end
// end


endmodule