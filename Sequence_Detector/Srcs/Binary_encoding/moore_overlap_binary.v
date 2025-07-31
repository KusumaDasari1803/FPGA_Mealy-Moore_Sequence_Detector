module moore_overlap_binary(
    input clk, 
    input rst, 
    input in, 
    output reg out,
    output reg [2:0] state  // <-- Exposed state
); 
  parameter A = 3'h0; 
  parameter B = 3'h1; 
  parameter C = 3'h2; 
  parameter D = 3'h3; 
  parameter E = 3'h4; // extra state
  
  reg [2:0] next_state; 

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
