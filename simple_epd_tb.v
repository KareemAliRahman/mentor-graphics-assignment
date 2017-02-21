`include "epd_fsm.v"

module simple_epd_tb();

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
reg clock , reset, control;
reg [7:0] data;
wire preamble_valid, dst_addr_valid, src_addr_valid,
  type_length_valid, packet_size_valid;
wire [3:0] valid_packet_counter;

initial begin
  $dumpfile("simple_epd_tb.vcd");
  $dumpvars(0,simple_epd_tb);
  clock = 1;
  reset = 1;
  control = 0;
  data = 0;
  #4 reset = 0;
  control = 1;
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

  control = 0;
  #1 data = 8'h00;

  #10 $finish;
end

always
 #1 clock = ~clock;


epd_fsm U_epd_fsm(
clock , // Clock
reset , // Active high reset
data , // Active high request from agent 0
control , // Active high request from agent 1
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid,
packet_size_valid,
valid_packet_counter 
);



endmodule