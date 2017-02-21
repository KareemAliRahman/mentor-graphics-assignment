/*
This Module implements the parsing Moore FSM of Payload and CRC Fields 
parsing of Payload and CRC reduces to a counter that counts 50 bytes
since no validation is required for payload and/or CRC
*/
module payload_crc(
		input enable,
		input clock,
		output packet_size_valid
	);

//Inputs: all ACTIVE HIGH
wire clock, enable;

//Output ACTIVE HIGH
reg packet_size_valid;

//Counter
reg [5:0] bytes_counter;

always @(posedge clock) begin
	if (enable == 1'b0) begin
		bytes_counter <= 0;
		packet_size_valid <= 1'b0;
	end else begin
		bytes_counter = bytes_counter + 1; 
		if (bytes_counter == 50) begin
			packet_size_valid <= 1'b1;
		end
	end
end

endmodule