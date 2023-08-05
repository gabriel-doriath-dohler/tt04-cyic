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
  sky130_fd_sc_hd__nand4_4 nand0 (.Y(n1), .A(n0), .B(n0), .C(n0), .D(n0));
  sky130_fd_sc_hd__nand4_4 nand1 (.Y(n2), .A(n1), .B(n1), .C(n1), .D(n1));
  sky130_fd_sc_hd__nand4_4 nand2 (.Y(n3), .A(n2), .B(n2), .C(n2), .D(n2));
  sky130_fd_sc_hd__nand4_4 nand3 (.Y(n4), .A(n3), .B(n3), .C(n3), .D(n3));
  sky130_fd_sc_hd__nand4_4 nand4 (.Y(n5), .A(n4), .B(n4), .C(n4), .D(n4));
  sky130_fd_sc_hd__nand4_4 nand5 (.Y(n6), .A(n5), .B(n5), .C(n5), .D(n5));
  sky130_fd_sc_hd__nand4_4 nand6 (.Y(n0), .A(n6), .B(n6), .C(n6), .D(n6));

  assign entropy_bit = n0;
endmodule
