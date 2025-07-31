module seven_seg_encoder_mealy_gray(
    input [1:0] state,
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            2'b00: seg = 7'b0001000; // A
            2'b01: seg = 7'b0000011; // b
            2'b11: seg = 7'b1000110; // C
            2'b10: seg = 7'b0100001; // d
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
