module tt_um_sup3legacy_trng (
  input clk,
  input ena,
  input rst_n,
  input [7:0] ui_in,
  input [7:0] uio_in,
  output [7:0] uio_oe,
  output [7:0] uio_out,
  output [7:0] uo_out
);
  reg enabled;
  wire random_bit;

  initial begin
      enabled = 0;
  end

  always @ (posedge clk) begin
      enabled = 1;
  end

  ring_oscillator oscillator (enabled, random_bit);

  assign uo_out = {7'b0000000, random_bit};
  assign uio_oe = 0;
  assign uio_out = 0;
endmodule
