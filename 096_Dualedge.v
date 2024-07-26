module top_module (
    input  wire clk,
    input  wire d,
    output wire q
    );
    
    reg [1:0] i;
    
    always @(posedge clk)
        i[1] <= d;
    
    always @(negedge clk)
        i[0] <= d;
    
    assign q = (clk) ? i[1] : i[0];

endmodule
