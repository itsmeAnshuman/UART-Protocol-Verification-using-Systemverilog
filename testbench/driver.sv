class driver;
  virtual uart_if uif;
  mailbox#(transaction) mbx;
  transaction tr;
  function new(mailbox#(transaction)mbx);
    this.mbx=mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(tr);
      @(posedge uif.clk);
      uif.clk<=tr.clk;
      uif.rst<=tr.rst;
      uif.tx_done<=tr.tx_done;
      uif.rx_done<=tr.rx_done;
      uif.tx_data<=tr.tx_data;
      uif.rx_data<=tr.rx_data;
      uif.tx_serial<=tr.tx_serial;
      uif.rx_serial<=tr.rx_serial;
      uif.tx_start<=tr.tx_start;
      $display("[DRV] : interface triggered");
        end
  endtask
endclass

        
      
