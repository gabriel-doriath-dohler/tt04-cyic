`timescale 1ns / 1ps

`include "utils.v"

module utils_tb ();
  reg clk;

  reg [1:0] selector_in;
  wire change;

  change_detector cd (
    clk,
    selector_in,
    change
  );

  // generate the clock
    always #1 clk = ~clk;
  initial begin
    clk = 0;
    $dumpfile ("utils.vcd");
    $dumpvars ();
    selector_in = 2'b10;
    #5
    selector_in = 2'b11;
    #5
    selector_in = 2'b00;
    #5
    selector_in = 2'b10;
    #5
    selector_in = 2'b0;
    #5
    $finish;
  end
  endmodule
