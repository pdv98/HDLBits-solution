module top_module (
    input  wire [1:0] sel,
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [7:0] c,
    input  wire [7:0] d,
    output wire [7:0] out
    );

    wire [7:0] mux0, mux1;
    
    mux2 u0(
        .sel(sel[0]),
        .a(a),
        .b(b),
        .out(mux0)
    );

    mux2 u1(
        .sel(sel[0]),
        .a(c),
        .b(d),
        .out(mux1)
    );

    mux2 u2(
        .sel(sel[1]),
        .a(mux0),
        .b(mux1),
        .out(out)
    );

endmodule
