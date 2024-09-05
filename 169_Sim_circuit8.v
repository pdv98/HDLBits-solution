module top_module(
    input  wire clock,
    input  wire a,
    output wire p,
    output wire q
	);
    
    always @(negedge clock)
    begin
        q <= a;
    end
    
    always @(*)
    begin
        if (clock) p <= a;
        else p <= p;
    end

endmodule
