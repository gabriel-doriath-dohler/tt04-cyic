module tt_um_sup3legacy_trng (
  input clk,
  input ena,
  input rst_n,
  input [7:0] ui_in,
  input [7:0] uio_in,
  input [7:0] uio_oe,
  output [7:0] uio_out,
  output [7:0] uo_out
);
  wire random_bit;

  //ring_oscillator oscillator(
  //  .entropy_bit (random_bit),
  //);

  assign random_bit = 0;
  assign uo_out = {7'b0000000, random_bit};
  assign uio_oe = 0;
  assign uio_out = 0;
endmodule
