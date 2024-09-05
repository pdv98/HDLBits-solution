module top_module(
    input wire clk,
    input wire a,
    input wire b,
    output reg q,
    output reg state
	);

    always @(posedge clk)
    begin
        if (a&b)            state <= 1'b1;
        else if (~(a|b))    state = 1'b0;
        else                state <= state;
    end
    
    always @(*)
    begin
        if (state)  q = ~(a^b);
        else        q = a^b;
    end
    
endmodule
