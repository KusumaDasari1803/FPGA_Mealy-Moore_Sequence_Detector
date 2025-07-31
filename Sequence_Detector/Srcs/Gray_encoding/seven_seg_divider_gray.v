`timescale 1ns / 1ps

module seven_seg_driver_gray(
    input clk, rst,
    input [2:0] state_moore_nonoverlap,
    input [2:0] state_moore_overlap,
    input [1:0] state_mealy_nonoverlap,
    input [1:0] state_mealy_overlap,
    output reg [6:0] seg,
    output reg [7:0] an
);
    reg [15:0] refresh_cnt;  
    reg [1:0] digit_sel;     

    wire [6:0] seg_non_moore, seg_ov_moore, seg_non_mealy, seg_ov_mealy;

    
    seven_seg_encoder_moore_gray enc_moore_non(.state(state_moore_nonoverlap), .seg(seg_non_moore));
    seven_seg_encoder_moore_gray enc_moore_ov(.state(state_moore_overlap), .seg(seg_ov_moore));
    seven_seg_encoder_mealy_gray enc_mealy_non(.state(state_mealy_nonoverlap), .seg(seg_non_mealy));
    seven_seg_encoder_mealy_gray enc_mealy_ov(.state(state_mealy_overlap), .seg(seg_ov_mealy));

    
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
            2'b00: begin an = 8'b11111110; seg = seg_non_moore; end // Rightmost digit
            2'b01: begin an = 8'b11111101; seg = seg_ov_moore;  end
            2'b10: begin an = 8'b11111011; seg = seg_non_mealy; end
            2'b11: begin an = 8'b11110111; seg = seg_ov_mealy;  end
        endcase
    end
endmodule

