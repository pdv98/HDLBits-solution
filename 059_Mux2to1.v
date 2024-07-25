module top_module(
    input  wire a,
    input  wire b,
    input  wire sel, 
    output wire out
);
    
    always @(*)
        case(sel)
            1'b0: out = a;
            1'b1: out = b;
        endcase

endmodule
