module top_module (
    input wire       clk,
    input wire       reset,
    output reg [3:0] q
    );
       
    always @(posedge clk)
    begin
        if (reset | q==10) q <= 1'b1;
        else               q <= q + 1'b1;
    end
        
endmodule
