interface uart_if;
  logic clk,rst;
  logic tx_done,rx_done;
  logic tx_serial,rx_serial;
  logic [7:0] tx_data;
  logic [7:0] rx_data;
  logic bit_index;
  logic tx_start;
 
endinterface
