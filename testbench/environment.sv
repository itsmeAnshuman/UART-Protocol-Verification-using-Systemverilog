`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
 generator gen;
  driver d;
  monitor mon;
  scoreboard scb;
   virtual uart_if uif;
  event next_event;
  
  mailbox#(transaction) mbxgd;
  mailbox#(transaction) mbxms;
  
  function new(virtual uart_if uif);
    this.uif=uif;
    mbxgd=new();
    mbxms=new();
    gen=new(mbxgd);
    d=new(mbxgd);
    mon=new(mbxms);
    scb=new(mbxms);
    
    
    d.uif=uif;
    mon.uif=uif;
    gen.next=next_event;
    scb.next=next_event;
  endfunction
endclass

    
