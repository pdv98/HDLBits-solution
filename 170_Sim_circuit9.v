module top_module(
    input  wire      clk,
    input  wire      a,
    output reg [3:0] q
	);
    
    always @(posedge clk) 
    begin
        if(a)           q <= 4'd4;
        else if(q < 6)  q <= q + 1'b1;
        else            q <= 1'b0;
    end

endmodule
