module top_module(
    input  wire [2:0] in,
    output wire [1:0] out
);
    
    assign out = in[0] + in[1] + in[2];

endmodule
