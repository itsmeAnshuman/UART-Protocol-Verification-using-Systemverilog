`include "test.sv"

module tb();
  uart_if uif();
  test t;
  
  uartprotocoltop dut(
    .clk(uif.clk),
    .rst(uif.rst),
    .tx_data(uif.tx_data),
    .tx_start(uif.tx_start),
    .tx_serial(uif.tx_serial),
    .rx_serial(uif.rx_serial),
    .rx_data(uif.rx_data),
    .rx_done(uif.rx_done),
    .tx_done(uif.tx_done)
  );
  
  initial begin
    uif.clk =0;
  end
  always #10 uif.clk = ~ uif.clk;
  
  initial begin
  uif.rst = 1;
  #25;
  uif.rst = 0;
end

  initial begin
    t=new(uif);
    t.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
