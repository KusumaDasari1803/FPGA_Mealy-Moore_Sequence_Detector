module mealy_overlap_binary(
    input clk, 
    input rst, 
    input in, 
    output reg out,
    output reg [1:0] state   // <-- expose state
); 
  parameter A = 2'h0; 
  parameter B = 2'h1; 
  parameter C = 2'h2; 
  parameter D = 2'h3; 
   
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
      D: if(in == 0) next_state = A; else next_state = B; 
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
