/*
This Module implements the parsing Moore FSM of Payload and CRC Fields.
Since no validation is required, parsing of Payload and CRC problem 
reduces to a counter that counts 50 bytes.
*/
module payload_crc(
		input clock,
		input reset,
		input enable,
		output packet_size_valid,
		output [3:0] valid_packet_counter
	);

//Inputs: all ACTIVE HIGH
wire clock, enable, reset;

//Output: all ACTIVE HIGH
reg packet_size_valid;
reg [3:0] valid_packet_counter = 4'b0000;

//Counter
reg [5:0] bytes_counter;

always @(posedge clock) begin
 	//if packet_size_valid was set in previous clock -> should be unset 
	if(packet_size_valid == 1'b1) begin
		packet_size_valid <= 1'b0;
	end
	if(reset == 1'b1) begin //synchronus active high reset
		bytes_counter <= 1'b0;
		packet_size_valid <= 1'b0;
		valid_packet_counter <= 4'b0;
	end
	if (enable == 1'b0) begin
		bytes_counter <= 1;
		packet_size_valid <= 1'b0;
	end 
	else begin
		bytes_counter = bytes_counter + 1; //blocking assignment
		if (bytes_counter == 50) begin
			packet_size_valid <= 1'b1;
			valid_packet_counter <= valid_packet_counter + 1; 
		end
	end
end

endmodule