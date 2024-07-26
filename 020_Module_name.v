module top_module ( 
    input wire a, b, c, d, 
    output wire out1, out2
);
	wire in1, in2, in3, in4;
    
    mod_a u0 (.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));
    
endmodule
