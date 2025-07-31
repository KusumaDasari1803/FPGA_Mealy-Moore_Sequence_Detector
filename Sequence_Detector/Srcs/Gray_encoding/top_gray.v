module top(
    input clk, rst,
    input sw,   
    output [7:0] an,
    output [6:0] seg,
    output led_moore_non,
    output led_moore_ov,
    output led_mealy_non,
    output led_mealy_ov
);
    wire slow_clk;
    wire seq_in;

    
    assign seq_in = sw;

   
    wire out_moore_non, out_moore_ov, out_mealy_non, out_mealy_ov;
    wire [2:0] st_moore_non, st_moore_ov;
    wire [1:0] st_mealy_non, st_mealy_ov;

    clock_divider #(50_000_000) u_div(
        .clk(clk), 
        .rst(rst), 
        .slow_clk(slow_clk)
    );

   
    moore_nonoverlap_gray u_moore_non(
        .clk(slow_clk), .rst(rst), .in(seq_in), .out(out_moore_non)
    );
    assign st_moore_non = u_moore_non.state;
    assign led_moore_non = out_moore_non;

    moore_overlap_gray u_moore_ov(
        .clk(slow_clk), .rst(rst), .in(seq_in), .out(out_moore_ov)
    );
    assign st_moore_ov = u_moore_ov.state;
    assign led_moore_ov = out_moore_ov;

   
    mealy_nonoverlap_gray u_mealy_non(
        .clk(slow_clk), .rst(rst), .in(seq_in), .out(out_mealy_non)
    );
    assign st_mealy_non = u_mealy_non.state;
    assign led_mealy_non = out_mealy_non;

    mealy_overlap_gray u_mealy_ov(
        .clk(slow_clk), .rst(rst), .in(seq_in), .out(out_mealy_ov)
    );
    assign st_mealy_ov = u_mealy_ov.state;
    assign led_mealy_ov = out_mealy_ov;

    
    seven_seg_driver_gray u_disp(
        .clk(clk),  
        .rst(rst),
        .state_moore_nonoverlap(st_moore_non),
        .state_moore_overlap(st_moore_ov),
        .state_mealy_nonoverlap(st_mealy_non),
        .state_mealy_overlap(st_mealy_ov),
        .seg(seg),
        .an(an)
    );

endmodule
