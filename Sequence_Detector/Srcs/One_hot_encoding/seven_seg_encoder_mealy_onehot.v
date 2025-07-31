module seven_seg_encoder_mealy_onehot(
    input [3:0] state,
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            4'b0001: seg = 7'b0001000; // A
            4'b0010: seg = 7'b0000011; // b
            4'b0100: seg = 7'b1000110; // C
            4'b1000: seg = 7'b0100001; // d
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
