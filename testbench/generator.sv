class generator;
  transaction tr;
  mailbox#(transaction) mbx;
  event next;
  event done;

  function new(mailbox#(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();
    repeat(20) begin
    tr = new();
    assert(tr.randomize()) else $error("Randomization failed");
    if (tr.tx_start) begin
      $display("[GEN] Sending TX: %0d", tr.tx_data);
      mbx.put(tr.copy());
      @(next);
    end
  end
  ->done;
endtask
endclass
