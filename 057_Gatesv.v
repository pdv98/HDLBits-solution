module top_module(
    input  wire [3:0] in,
    output wire [2:0] out_both,
	output wire [3:1] out_any,
    output wire [3:0] out_different
);
    
    assign out_both = { in[2] & in[3], in[1] & in[2], in[0] & in[1] };
    assign out_any =  { in[3] | in[2], in[2] | in[1], in[1] | in[0] };
    assign out_different = { in[3] ^ in[0], in[2] ^ in[3], in[1] ^ in[2], in[0] ^ in[1] };

endmodule
