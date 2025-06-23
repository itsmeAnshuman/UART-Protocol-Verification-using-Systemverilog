class transaction;
   bit clk,rst;
  bit tx_done,rx_done;
  bit tx_serial , rx_serial;
  bit [7:0] rx_data;
  randc bit[7:0] tx_data;
  rand bit tx_start;
  
  constraint t_start{ tx_start dist{0:=25 , 1:=75};}
  constraint data { tx_data inside { 0,255};}
  
  function transaction copy();
    copy=new();
    copy.tx_done=this.tx_done;
    copy.rx_done=this.rx_done;
    copy.tx_serial=this.tx_serial;
    copy.rx_serial=this.rx_serial;
    copy.rx_data=this.rx_data;
    copy.tx_data=this.tx_data;
    copy.tx_start=this.tx_start;
  endfunction
endclass

   
