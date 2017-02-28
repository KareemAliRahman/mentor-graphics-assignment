// Test sends multiple packets while control is always low
`include "epd.v"

module multiple_packets_cntrl;

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


initial begin
	$dumpfile("multiple_packets_cntrl.vcd");
	$dumpvars(0,multiple_packets_cntrl);
	
	clock = 0;
	
	control = 0; //CONTROL IS ALWAYS LOW
	data = 0;
	reset = 0;
	
	//***************************** First packet ******************************
	//valid preamble
	repeat (7) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'hFF;

	//send one IFG
	#2 control = 0;
    data = 8'h00;
    #2 control = 0; //CONTROL IS ALWAYS LOW

    //***************************** Second packet ******************************
	//valid preamble
	repeat (7) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'h56;

	//send multiple IFGs
	#2 control = 0;
    data = 8'h00;
    #6 control = 0; //CONTROL IS ALWAYS LOW

    //***************************** Third packet ******************************
	//valid preamble
	repeat (7) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'h56;

	//send one IFG
	#2 control = 0;
    data = 8'h00;
    #2 control = 0; //CONTROL IS ALWAYS LOW

    #10 $finish;
end


//clock generator
always
	#1 clock =~ clock;

endmodule