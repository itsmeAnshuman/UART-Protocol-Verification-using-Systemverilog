`include "env.sv"
class test;
   environment e;
  transaction tr;
  virtual uart_if uif;
  
  function new(virtual uart_if uif);
    this.uif=uif;
    e=new(uif);
  endfunction
  
  task run();
    fork 
    e.gen.run();
    e.d.run();
    e.mon.run();
    e.scb.run();
    join_any
    
     wait(e.gen.done.triggered);
    $display("------ TEST DONE ------");
    $finish();                   
  endtask
endclass
  
  
    
