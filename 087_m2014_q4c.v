module top_module (
    input  wire clk,
    input  wire d,
    input  wire r,   // synchronous reset
    output wire q
    );
    
    always @(posedge clk) 
    begin
        if (r)
            q <= 0;
        else
            q <= d;
    end

endmodule
