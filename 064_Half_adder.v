module top_module(
    input  wire a,
    input  wire b,
    output wire cout, 
    output wire sum
);
    
    assign {cout, sum} = a + b;

endmodule
