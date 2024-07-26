module top_module (
    input  wire         clk,
    input  wire         reset,
    input  wire         enable,
    output wire [3:0]   Q,
    output wire         c_enable,
    output wire         c_load,
    output wire [3:0]   c_d
);

	initial Q <= 4'b1;

    always @(posedge clk)
    begin
        if (reset | ((Q == 4'd12) & enable)) Q <= 4'b1;
        else Q <= (enable) ? Q + 4'b1 : Q;
    end
    
    assign c_enable = enable;
    assign c_load = (reset | ((Q == 4'd12) & enable));
    assign c_d = c_load ? 4'b1 : 4'b0;

    count4 the_Counter(
	    .clk(clk),
	    .enable(c_enable),
	    .load(c_load),
	    .d(c_d),
	    .Q()
    );

endmodule