module top_module(
    input  wire [1023:0] in, 
    input  wire [7:0]    sel,
    output wire [3:0]    out
);

    assign out = { in[4*sel+3], in[4*sel+2], in[4*sel+1], in[4*sel] };

endmodule