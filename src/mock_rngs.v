// Mock RNG that just alternates between 0 and 1
module alternating_rng (
    input clk,

    output entropy_valid,
    output entropy_bit
);
  reg state;

  initial begin
      state = 0;
  end

  always @ (posedge clk) begin
      state <= !state;
  end

  assign entropy_valid = 1;
  assign entropy_bit = state;
endmodule

// Cycles through the same 16-bit word.
// Simulates the broken AMD RNG 
// TODO: Citation needed
module repeating_rng (
    input clk,

    output entropy_valid,
    output entropy_bit
);
  reg [3:0] idx;

  initial begin
      idx = 0;
  end

  always @ (posedge clk) begin
      idx = idx + 1;
  end

  assign entropy_valid = 1;
  assign entropy_bit = {16'b1111110111100101}[idx];
endmodule

// TODO:
module user_rng (
    input clk,
    input user_valid,
    input user_bit,

    output entropy_valid,
    output entropy_bit
);

endmodule
