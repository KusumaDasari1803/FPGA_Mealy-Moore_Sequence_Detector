//Testbench to test FSM
`timescale 1ns/1ps

module TB;

  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate DUT
  moore_overlap uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .z(z)
  );

  // Clock generation: 4ns period ? 250 MHz
  initial clk = 0;
  always #2 clk = ~clk; // toggle every 2ns

  // Stimulus
  initial begin
    // Initialize
    in = 0;
    rst = 0;

    // Apply reset
    #5 rst = 1;

    // Apply input sequence: 1 1 0 1 0 1 0 ...
    #3  in = 1;
    #4  in = 1;
    #4  in = 0;
    #4  in = 1;
    #4  in = 0;
    #4  in = 1;
    #4  in = 0;
    #4  in = 1;
    #4  in = 1;
    #4  in = 1;
    #4  in = 0;
    #4  in = 1;
    #4  in = 0;
    #4  in = 1;
    #4  in = 0;

    #20 $finish;
  end

  // Optional: print values to the console
  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | in=%b | out=%b",
             $time, clk, rst, in, out);
  end

endmodule
