module top_module();

    reg clk;
    reg in;
    reg [2:0] s;
    reg out;
    
    q7 uq7(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out)
	);
	
    always
        #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        in = 1'b0;
        s = 3'd2;
        
        #10
        s = 3'd6;
        
        #10
        s = 3'd2;
        in = 1'b1;
        
        #10
        s = 3'd7;
        in = 1'b0;
        
        #10
        s = 3'd0;
        in = 1'b1;
        
        #30
        in = 1'b0;
    end
    
endmodule
