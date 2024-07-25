module top_module(
    input  wire [99:0] a,
    input  wire [99:0] b, 
    input  wire        sel,
    output wire [99:0] out
);
    
    always @(*)
        case(sel)
            1'b0: out = a;
            1'b1: out = b;
        endcase

endmodule
