module uarttransmitter(clk,rst,baud_tick,data_in,send,tx_serial,tx_done);
  input clk,rst,baud_tick,send;
  input [7:0] data_in;
  output reg tx_serial ,tx_done;
  
  typedef enum logic[1:0] { IDLE =2'b00 , START = 2'b01 , DATA =2'b10 , STOP=2'b11} state_t;
  state_t current_state, next_state;
  reg [2:0] bit_index;
  reg [7:0] shift_reg;
  
  always@(posedge clk or posedge rst)begin
    if(rst) begin
      current_state<=IDLE;
      tx_serial=1'b1;
      tx_done=1'b0;
      bit_index=3'b000;
    end
    else begin
      current_state <=next_state;
    end
  end
  
  always@(*) begin
    next_state = current_state;
    case(current_state)
      IDLE: begin
        if(send) begin
          next_state = START;
        end
      end
      START: begin
        next_state=DATA;
      end
      DATA: begin
        if(baud_tick)begin
          if(bit_index==7)begin
            next_state = STOP;
          end
        end
      end
      STOP: begin
        if(baud_tick)begin
         next_state<=IDLE;
        end
      end
      default :begin
        next_state = IDLE;
      end
    endcase
  end
  
  always@(posedge clk)begin
    case(current_state)
      IDLE : begin
        tx_done<=1'b0;
        if(send) begin
          shift_reg<=data_in;
          bit_index<=1'b0;
          tx_serial<=1'b1;
        end
      end
      START :begin
        tx_serial<=1'b0;
      end
      DATA : begin
        if(baud_tick) begin
          tx_serial <= shift_reg[bit_index];
          bit_index<=bit_index+1'b1;
        end
      end
      STOP : begin
        if(baud_tick) begin
          tx_serial<=1'b1;
          tx_done<=1'b1;
        end
      end
    endcase
  end
endmodule

        
