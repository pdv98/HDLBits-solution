module top_module(
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [7:0] c,
    input  wire [7:0] d,
    output wire [7:0] min
);
    
    wire [7:0] result1, result2;
    
    assign result1 = (a < b) ? a : b;
    assign result2 = (c < d) ? c : d;
    assign min = (result1 < result2) ? result1 : result2;

endmodule