module moore_overlap_onehot(
    input clk, 
    input rst, 
    input in, 
    output reg out,
    output reg [4:0] state  
); 
parameter A = 5'b00001;  
parameter B = 5'b00010;  
parameter C = 5'b00100;  
parameter D = 5'b01000;  
parameter E = 5'b10000;  
  
  reg [4:0] next_state; 

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
      D: if(in == 0) next_state = A; else next_state = E; 
      E: if(in == 0) next_state = A; else next_state = C; 
      default: next_state = A; 
    endcase 
  end 

  always @(*) begin 
    case(state) 
      A : out = 0; 
      B : out = 0; 
      C : out = 0; 
      D : out = 0; 
      E : out = 1; 
      default : out = 0; 
    endcase 
  end 
endmodule
