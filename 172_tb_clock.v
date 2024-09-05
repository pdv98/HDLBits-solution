module top_module();
    
    reg clk;
    
    dut udut(
        .clk(clk)
    );
    
    always
        #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        
        #100000;
        $finish;
    end
    
endmodule
