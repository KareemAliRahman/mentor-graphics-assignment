`include "payload_crc.v"

module payload_crc_tb();

reg clock, enable;

wire packet_size_valid;


initial begin
  $dumpfile("payload_crc_tb.vcd");
  $dumpvars(0,payload_crc_tb);
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