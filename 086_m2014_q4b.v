module top_module (
    input  wire clk,
    input  wire d,
    input  wire ar,   // asynchronous reset
    output wire q
    );
    
    always @(posedge clk or posedge ar)
    begin
        if (ar)
            q <= 0;
        else
            q <= d;
    end

endmodule