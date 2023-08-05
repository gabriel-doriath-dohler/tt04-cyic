`default_nettype none

module mynot (
    input wire a,
    output wire y
);
    sky130_fd_sc_hd__inv_2 inv_gate (.A(y), .Y(a));
endmodule

module ring_oscillator (
    input enable,
    output entropy_bit
);
  wire n0;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;

  //assign n1 = !n0;
  //assign n2 = !n1;
  //assign n3 = !n2;
  //assign n4 = !n3;
  //assign n5 = !n4;
  //assign n6 = !n5;
  //assign n0 = !n6;

  mynot not0 (n1, n0);
  mynot not1 (n2, n1);
  mynot not2 (n3, n2);
  mynot not3 (n4, n3);
  mynot not4 (n5, n4);

  assign n0 = enable ? n5 : 0;

  //sky130_fd_sc_hd__inv_2 nand0 (.Y(n1), .A(n0));
  //sky130_fd_sc_hd__inv_2 nand1 (.Y(n2), .A(n1));
  //sky130_fd_sc_hd__inv_2 nand2 (.Y(n3), .A(n2));
  //sky130_fd_sc_hd__inv_2 nand3 (.Y(n4), .A(n3));
  //sky130_fd_sc_hd__inv_2 nand4 (.Y(n5), .A(n4));
  //sky130_fd_sc_hd__inv_2 nand5 (.Y(n6), .A(n5));
  //sky130_fd_sc_hd__inv_2 nand6 (.Y(n0), .A(n6));

  assign entropy_bit = n0;
endmodule
