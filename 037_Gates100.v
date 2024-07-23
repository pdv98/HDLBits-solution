module top_module(
    input wire [99:0] in,
    output wire out_and,
    output wire out_or,
    output wire out_xor
);
    
    assign out_and = & in[99:0];
    assign out_or = | in[99:0];
    assign out_xor = ^ in[99:0];

endmodule
