module seven_seg_encoder_moore_binary(
    input [2:0] state,   
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            3'h0: seg = 7'b0001000; // A
            3'h1: seg = 7'b0000011; // b
            3'h2: seg = 7'b1000110; // C
            3'h3: seg = 7'b0100001; // d
            3'h4: seg = 7'b0000110; // E
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
