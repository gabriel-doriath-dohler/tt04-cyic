module ring_oscillator (
    output entropy_bit
);
  wire n0;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;

  // TODO: Add emulate random for the simulation
  sky130_fd_sc_hd__inv_2 nand0 (.Y(n1), .A(n0));
  sky130_fd_sc_hd__inv_2 nand1 (.Y(n2), .A(n1));
  sky130_fd_sc_hd__inv_2 nand2 (.Y(n3), .A(n2));
  sky130_fd_sc_hd__inv_2 nand3 (.Y(n4), .A(n3));
  sky130_fd_sc_hd__inv_2 nand4 (.Y(n5), .A(n4));
  sky130_fd_sc_hd__inv_2 nand5 (.Y(n6), .A(n5));
  sky130_fd_sc_hd__inv_2 nand6 (.Y(n0), .A(n6));

  assign entropy_bit = n0;
endmodule
