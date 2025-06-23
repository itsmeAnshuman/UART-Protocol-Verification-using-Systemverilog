`include "baudgen.sv"
`include "uarttransmitter.sv"
`include "uartreceiver.sv"

module uartprotocoltop(clk,rst,tx_data,tx_start,tx_serial,rx_serial,rx_data,rx_done,tx_done);
  input clk,rst,tx_start,rx_serial;
  output rx_done,tx_done,tx_serial;
  input [7:0]tx_data;
  output [7:0] rx_data;
  
  wire baud_tick;
  
  uartbaudgenny ubg(clk,rst,baud_tick);
  uarttransmitter utx0(clk,rst,baud_tick,tx_data,tx_start,tx_serial,tx_done);
  uartreceiver urx0(clk,rst,rx_serial,baud_tick,rx_data,rx_done);
endmodule

