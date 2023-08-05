module ring_oscillator (
    output bit
);
  wire n0;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;

  assign n1 = ~n0;
  assign n2 = ~n1;
  assign n3 = ~n2;
  assign n4 = ~n3;
  assign n5 = ~n4;
  assign n6 = ~n5;
  assign n0 = ~n6;

  assign bit = n0;
endmodule
