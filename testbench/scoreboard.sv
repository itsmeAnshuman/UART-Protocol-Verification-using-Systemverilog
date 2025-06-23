class scoreboard;
  transaction tr;
  mailbox#(transaction) mbx;
  event next;
  
  function new(mailbox#(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task compare(input transaction tr);
    if(tr.tx_data ==  tr.rx_data) $display("[SCO] : verified");
    else $display("[SCO] : Mismatch!");
  endtask
  
  task run();
    forever begin
      mbx.get(tr);
      $display("[SCO] Data Received from monitor");
      if(tr.rx_done == 1'b1)begin
        compare(tr);
        ->next;
      end
    end
  endtask
endclass
