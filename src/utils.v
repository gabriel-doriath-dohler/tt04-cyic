// 4-way multiplexer
module mux4 (
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] sel,

    output o
);
    assign o = {i0, i1, i2, i3}[sel];
endmodule
