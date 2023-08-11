`timescale 1ns / 1ps

`include "vector_buffer.v"

module example_tb ();
  reg clk;
  reg reset;
  reg bit;
  reg bit_valid;
  reg req;

  wire [7:0] vector;
  wire vector_valid;

  vector_buffer buffer (
    .clk (clk),
    .input_bit (bit),
    .bit_valid (bit_valid),
    .req (req),
    .vector (vector),
    .valid (vector_valid)
  );

  // generate the clock
    always #1 clk = ~clk;
    always #1 bit = $random;
  initial begin
    $dumpfile ("vector_buffer.vcd");
    $dumpvars (vector);
    bit = 1'b1;
    clk = 1'b0;
    bit_valid = 1'b1;
    req = 1'b0;
    #200
    req = 1'b1;
    #100
    bit_valid = 1'b0;
    #200
    $finish;
  end
  endmodule
