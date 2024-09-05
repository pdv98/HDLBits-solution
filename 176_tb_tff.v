module top_module ();

    reg clk;
    reg reset;
    reg t;
    wire q;
    
    tff utff(
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
	);
    
    always
        #10 clk = ~clk;
    
    initial
    begin
        clk = 1'b1;
        reset = 1'b1;
        t = 1'b0;
        
        #5
        reset = 1'b0;
        
        #10
        t = 1'b1;
        
        #10000
        $finish;
    end
    
endmodule
