module seven_seg_encoder_moore_gray(
    input [2:0] state,    
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            3'b000: seg = 7'b0001000; // A
            3'b001: seg = 7'b0000011; // b
            3'b011: seg = 7'b1000110; // C
            3'b010: seg = 7'b0100001; // d
            3'b110: seg = 7'b0000110; // E
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
