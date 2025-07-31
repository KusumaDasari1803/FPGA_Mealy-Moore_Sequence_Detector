module seven_seg_driver_binary(
    input clk, rst,
    input [2:0] state_moore_nonoverlap,
    input [2:0] state_moore_overlap,
    input [1:0] state_mealy_nonoverlap,
    input [1:0] state_mealy_overlap,
    output reg [6:0] seg,
    output reg [7:0] an
);
    reg [15:0] refresh_cnt;  
    reg [2:0] digit_sel;  

    wire [6:0] seg_non_moore, seg_ov_moore, seg_non_mealy, seg_ov_mealy;

    seven_seg_encoder_moore_binary enc_moore_non(.state(state_moore_nonoverlap), .seg(seg_non_moore));
    seven_seg_encoder_moore_binary enc_moore_ov (.state(state_moore_overlap),   .seg(seg_ov_moore));
    seven_seg_encoder_mealy_binary enc_mealy_non(.state(state_mealy_nonoverlap),.seg(seg_non_mealy));
    seven_seg_encoder_mealy_binary enc_mealy_ov (.state(state_mealy_overlap),   .seg(seg_ov_mealy));

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            refresh_cnt <= 0;
            digit_sel <= 0;
        end else begin
            refresh_cnt <= refresh_cnt + 1;
            if (refresh_cnt == 50_000) begin  
                refresh_cnt <= 0;
                digit_sel <= digit_sel + 1;
            end
        end
    end


    always @(*) begin
        case(digit_sel)
            3'b000: begin an = 8'b11111110; seg = seg_non_moore; end // Digit0: Moore Non-overlap
            3'b001: begin an = 8'b11111101; seg = seg_ov_moore;  end // Digit1: Moore Overlap
            3'b010: begin an = 8'b11111011; seg = seg_non_mealy; end // Digit2: Mealy Non-overlap
            3'b011: begin an = 8'b11110111; seg = seg_ov_mealy;  end // Digit3: Mealy Overlap

            
            3'b100: begin an = 8'b11101111; seg = 7'b1111111;    end // Digit4 blank
            3'b101: begin an = 8'b11011111; seg = 7'b1111111;    end // Digit5 blank
            3'b110: begin an = 8'b10111111; seg = 7'b1111111;    end // Digit6 blank
            3'b111: begin an = 8'b01111111; seg = 7'b1111111;    end // Digit7 blank
        endcase
    end
endmodule
