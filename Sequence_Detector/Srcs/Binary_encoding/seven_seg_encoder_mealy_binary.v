module seven_seg_encoder_mealy_binary(
    input [1:0] state,
    output reg [6:0] seg
);
    always @(*) begin
        case(state)
            2'h0: seg = 7'b0001000; // A
            2'h1: seg = 7'b0000011; // b
            2'h2: seg = 7'b1000110; // C
            2'h3: seg = 7'b0100001; // d
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
