module top_module(
    input  wire x3,
    input  wire x2,
    input  wire x1,
    output wire f
);
    
    assign f = (x3 == 0) ? x2 : x1;

endmodule
