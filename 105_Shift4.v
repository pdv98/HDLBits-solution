module top_module(
    input wire       clk,
    input wire       areset,
    input wire       load,
    input wire       ena,
    input wire [3:0] data,
    output reg [3:0] q
    );
    
    always @(posedge clk, posedge areset)
    begin
		if (areset)		q <= 4'b0;
		else if (load)  q <= data;
		else if (ena)	q <= (q >> 1);	
	end

endmodule
