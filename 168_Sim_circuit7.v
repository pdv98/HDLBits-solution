module top_module(
    input  wire clk,
    input  wire a,
    output wire q
	);
    
    always @(posedge clk)
    begin
       q <= ~a; 
    end

endmodule
