module mealy_nonoverlap_onehot(
    input clk, 
    input rst, 
    input in, 
    output reg out,
    output reg [3:0] state  
); 
parameter A = 4'b0001;  
parameter B = 4'b0010;  
parameter C = 4'b0100;  
parameter D = 4'b1000;  
   
  reg [3:0] next_state; 
   
  always @(posedge clk or negedge rst) begin 
    if(!rst)  
      state <= A; 
    else 
      state <= next_state; 
  end 
   
  always @(*) begin 
    case(state) 
      A: if(in == 0) next_state = A; else next_state = B; 
      B: if(in == 0) next_state = A; else next_state = C; 
      C: if(in == 0) next_state = D; else next_state = C; 
      D: if(in == 0) next_state = A; else next_state = A; 
      default: next_state = A; 
    endcase 
  end 

  always @(*) begin
    if (state == D && in == 1) 
      out = 1;
    else 
      out = 0;
  end
endmodule
