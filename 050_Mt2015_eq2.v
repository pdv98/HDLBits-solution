module top_module (
    input  wire [1:0]   A,
    input  wire [1:0]   B, 
    output wire         z
);
    
    assign z = (A == B) ? 1 : 0;

endmodule
