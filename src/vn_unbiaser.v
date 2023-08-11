// Von Neumann unbiaser
module vn_unbiaser (
  input clk,
  input rst,
  input i_valid,
  input i_bit,
  output reg o_valid,
  output o_bit
);

  reg last_value;
  reg next;

  assign o_bit = last_value;

  initial begin
    next = 0;
    last_value = 0;
    o_valid = 0;
  end

  always @(posedge clk) begin
    if (rst) begin
      next = 0;
      o_valid = 0;
      // last_valid will we overwritten anyway
    end 
    else begin
      if (i_valid) begin
        if (!next) begin
          // Store the first value of the pair
          last_value = i_bit;
        end
        else begin
          // Compute the output validity depending on the received input and the
          // previous one
          o_valid = (i_bit ^ last_value);
        end
        next = !next;
      end
      else begin
        o_valid = 0;
      end
    end
  end
endmodule

module vn_unbiaser_wrapper (
  input clk,
  input rst,
  input vn_enable,
  input i_valid,
  input i_bit,
  output o_valid,
  output o_bit
);
  wire vn_bit;
  wire vn_valid;
  vn_unbiaser VN (clk, rst, i_valid, i_bit, vn_valid, vn_bit);

  assign o_valid = vn_enable ? vn_valid : i_valid;
  assign o_bit = vn_enable ? vn_bit : i_bit;
endmodule
