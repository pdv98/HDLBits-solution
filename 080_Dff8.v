module top_module (
    input  wire       clk,
    input  wire [7:0] d,
    output wire [7:0] q
);
    
    always @(posedge clk)
        q <= d;

endmodule