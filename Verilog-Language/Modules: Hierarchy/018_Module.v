module top_module (
    input wire a,
    input wire b,
    output wire out
);

	wire in1, in2;

    mod_a u0 (.in1(a), .in2(b), .out(out));

endmodule
