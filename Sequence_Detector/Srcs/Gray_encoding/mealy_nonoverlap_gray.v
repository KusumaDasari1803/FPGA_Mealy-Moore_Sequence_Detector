module mealy_nonoverlap_gray(
    input clk, 
    input rst, 
    input in, 
    output reg out,
    output reg [1:0] state  
); 
parameter A = 2'b00;  
parameter B = 2'b01;  
parameter C = 2'b11;  
parameter D = 2'b10;  
   
  reg [1:0] next_state; 
   
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
