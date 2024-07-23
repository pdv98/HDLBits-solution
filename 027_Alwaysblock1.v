module top_module(
    input wire a,
    input wire b,
    output wire out_assign, 
    output reg out_alwaysblock
);

    assign out_assign = a & b;
    
    always @(a, b) begin
        out_alwaysblock = a & b;
    end
    
endmodule