`include "header_fsm.v"

module header_fsm_tb();

reg clock ,enable;
reg [7:0] data;
wire preamble_valid, dst_addr_valid, src_addr_valid,
  type_length_valid;

initial begin
  $dumpfile("header_fsm_tb.vcd");
  $dumpvars(0,header_fsm_tb);
  enable = 0;
  clock = 1;
  enable = 0;
  #5 enable = 1;

  #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55; // Preamble
  #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'hD5;

  #2 data = 8'h01;#2 data = 8'h02;#2 data = 8'h03;#2 data = 8'h04; // DST
  #2 data = 8'h05;#2 data = 8'h06;

  #2 data = 8'hFF;#2 data = 8'hFE;#2 data = 8'hFD;#2 data = 8'hFC; // SRC
  #2 data = 8'hFB;#2 data = 8'hFA;

  #2 data = 8'h08;#2 data = 8'h00; // Type_Length

  #10 $finish;
end

always
 #1 clock = ~clock;


header_fsm U_header_fsm(
enable,
clock , // Clock
data , // Active high request from agent 0
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid
);



endmodule