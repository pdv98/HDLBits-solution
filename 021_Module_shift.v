module top_module (
    input wire clk,
    input wire d, 
    output wire q
);

    wire n1, n2;
    
    my_dff u0 (.clk(clk), .d(d), .q(n1));
    my_dff u1 (.clk(clk), .d(n1), .q(n2));
    my_dff u2 (.clk(clk), .d(n2), .q(q));
    
endmodule
