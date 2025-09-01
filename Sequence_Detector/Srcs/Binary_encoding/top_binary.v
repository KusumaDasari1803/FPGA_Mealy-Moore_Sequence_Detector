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


   
    wire [2:0] st_moore_non, st_moore_ov;
    wire [1:0] st_mealy_non, st_mealy_ov;

   
    clock_divider u_div(
        .clk(clk), 
        .rst(rst), 
        .slow_clk(slow_clk)
    );

    
    moore_nonoverlap_binary u_moore_non(
        .clk(slow_clk), .rst(rst), .in(sw), .out(led_moore_non), .state(st_moore_non)
    );
   
    moore_overlap_binary u_moore_ov(
        .clk(slow_clk), .rst(rst), .in(sw), .out(led_moore_ov), .state(st_moore_ov)
    );
        
    mealy_nonoverlap_binary u_mealy_non(
        .clk(slow_clk), .rst(rst), .in(sw), .out(led_mealy_non), .state(st_mealy_non)
    );
    
    mealy_overlap_binary u_mealy_ov(
        .clk(slow_clk), .rst(rst), .in(sw), .out(led_mealy_ov), .state(st_mealy_ov)
    );
        
    seven_seg_driver_binary u_disp(
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
