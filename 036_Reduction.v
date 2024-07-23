module top_module(
    input wire [7:0] in,
    output wire parity
);
    
    assign parity = ^ in[7:0]; 

endmodule
