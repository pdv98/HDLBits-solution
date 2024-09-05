module top_module(
    input  wire a,
    input  wire b,
    input  wire c,
    output wire out
    );
	
    wire fake_out;
    andgate inst1(
        .a(a),
        .b(b),
        .c(c),
        .d(1'b1),
        .e(1'b1),
        .out(fake_out)
    );
	
    assign out = ~fake_out;
    
endmodule
