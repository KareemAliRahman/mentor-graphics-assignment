`include "payload_crc.v"

module payload_crc_tb();

    // input clock,
    // input reset,
    // input [7:0] data,
    // input control,
    // output preamble_valid,
    // output src_addr_valid,
    // output dst_addr_valid,
    // output type_length_valid,
    // output packet_size_valid,
    // output [3:0] valid_packet_counter
reg clock, enable;

wire packet_size_valid;


initial begin
  $dumpfile("payload_crc_tb.vcd");
  $dumpvars(0,payload_crc_tb);
  // clock = 0;
  // reset = 0;
  // control = 0;
  // data = 0;
  // #4 reset = 1;
  // reset = 0;
  // control = 1;
  clock = 1;
  enable = 0;
  // data = 0;
  #5 enable = 1;
  
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;
  #2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;#2 enable = 1;

  
  #2 enable = 1;

  #10 $finish;
end

always
 #1 clock = ~clock;


payload_crc U_payload_crc(
enable,
clock , // Clock
packet_size_valid
);



endmodule