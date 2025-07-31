`timescale 1ns / 1ps
module clock_divider #(parameter DIVISOR = 50_000_000)(
    input clk, rst,
    output reg slow_clk
);
    reg [25:0] counter;  

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            counter <= 0;
            slow_clk <= 0;
        end else begin
            if (counter == DIVISOR-1) begin
                counter <= 0;
                slow_clk <= ~slow_clk;
            end else
                counter <= counter + 1;
        end
    end
endmodule

