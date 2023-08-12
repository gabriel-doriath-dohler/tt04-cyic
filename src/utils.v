// 4-way multiplexer
module mux4 (
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] sel,

    output o
);
    wire [3:0] intermediate;

    assign intermediate = {i0, i1, i2, i3};
    assign o = intermediate[sel];
endmodule

// Outputs a signal upon input change
module change_detector(
  input clk,
  input [1:0] sel_in,

  output reg change_out
);
reg [1:0] last_value;

initial begin
    change_out = 1;
  last_value = 0;
end

always @(posedge clk) begin
  change_out = (sel_in != last_value);
  last_value = sel_in;
end
endmodule
