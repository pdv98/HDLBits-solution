module top_module(
    input wire clk,
    input wire a,
    input wire b,
	output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);

    assign out_assign = a ^ b;
    
    always @(a, b) begin
        out_always_comb = a ^ b;
    end
    
    always @(posedge clk) begin
        out_always_ff = a ^ b;
    end
    
endmodule