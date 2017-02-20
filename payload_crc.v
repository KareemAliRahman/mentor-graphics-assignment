/*
This Module implements the parsing Moore FSM of Payload and CRC Fields 
parsing of Payload and CRC reduces to a counter that counts 50 bytes
since no validation is required for payload and/or CRC
*/
module payload_crc_fsm(
		input clock,
		input reset,
		input [7:0] data,
		input control,
		output packet_size_valid
	);

//Inputs: all ACTIVE HIGH
wire [7:0] data;
wire clock, reset, control;

//Output ACTIVE HIGH
reg packet_size_valid;

//Counter
reg [5:0] bytes_counter;

always @(posedge clock) begin
	if (reset == 1'b1) begin
		bytes_counter <= 0;	
	end
	else if (control == 1'b1) begin
		bytes_counter = bytes_counter + 1;
	end
end

endmodule