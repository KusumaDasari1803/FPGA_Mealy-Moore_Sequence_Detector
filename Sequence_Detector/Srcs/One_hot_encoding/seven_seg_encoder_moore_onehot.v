module seven_seg_encoder_moore_onehot(
    input [4:0] state,    
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            5'b00001: seg = 7'b0001000; // A
            5'b00010: seg = 7'b0000011; // b
            5'b00100: seg = 7'b1000110; // C
            5'b01000: seg = 7'b0100001; // d
            5'b10000: seg = 7'b0000110; // E
            default:  seg = 7'b1111111; // blank
        endcase
    end
endmodule
