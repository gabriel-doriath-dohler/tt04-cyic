// Built-In Self Test unit

module bist (
    input clk,
    input rst,

    input entropy_bit,

    output is_broken,
    output is_init
);

endmodule

module bist_wrapper (
  input clk,
  input rst,

  input entropy_bit,

  output [1:0] state
);

endmodule
