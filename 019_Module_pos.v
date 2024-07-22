module top_module ( 
    input wire a, b, c, d,
    output wire out1, out2
);
	
    wire in, out;
    
    mod_a u0 (out1, out2, a, b, c, d);
    
endmodule