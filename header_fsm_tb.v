`include "header_fsm.v"

module header_fsm_tb();

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
reg clock ,enable;
reg [7:0] data;
wire preamble_valid, dst_addr_valid, src_addr_valid,
  type_length_valid;

initial begin
  $dumpfile("header_fsm_tb.vcd");
  $dumpvars(0,header_fsm_tb);
  clock = 1;
  enable = 1;
  data = 0;
  #4 reset = 0;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55; // Preamble
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;

  #1 data = 8'h01;#1 data = 8'h02;#1 data = 8'h03;#1 data = 8'h04; // DST
  #1 data = 8'h05;#1 data = 8'h06;

  #1 data = 8'hFF;#1 data = 8'hFE;#1 data = 8'hFD;#1 data = 8'hFC; // SRC
  #1 data = 8'hFB;#1 data = 8'hFA;

  #1 data = 8'h08;#1 data = 8'h00; // Type_Length

  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55; // payload
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;
  #1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;#1 data = 8'h55;

  #10 $finish;
end

always
 #1 clock = ~clock;


header_fsm_tb U_header_fsm_tb(
enable,
clock , // Clock
data , // Active high request from agent 0
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid
);



endmodule