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
  wire ring_valid;
  wire random_bit;
  wire bit_valid;

  wire req;
  wire [7:0] vector;
  wire vector_valid;

  assign bit_valid = enabled;
  // TODO: Wire to `ena`
  assign req = ui_in[0];

  initial begin
      enabled = 0;
  end

  always @ (posedge clk) begin
      enabled = 1;
  end

  // TODO: instantiate all 4 RNGs and put them behind a mux4
  ring_oscillator oscillator (enabled, ring_valid, random_bit);
  vector_buffer entropy_buffer (clk, random_bit, enabled, req, vector, vector_valid);

  assign uo_out = vector;
  assign uio_oe = 0;
  assign uio_out = 0;
endmodule
