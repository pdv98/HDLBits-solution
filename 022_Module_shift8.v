module top_module (
    input wire clk, 
   	input wire [7:0] d, 
    input wire [1:0] sel,  
  	output wire [7:0] q
);

    wire [7:0] m3, m2, m1, m0;
    
    my_dff8 u0 (.clk(clk), .d(d), .q(m1));
    my_dff8 u1 (.clk(clk), .d(m1), .q(m2));
    my_dff8 u2 (.clk(clk), .d(m2), .q(m3));
    
    assign m0 = d;
    
    always @(*) begin
        case(sel)
            2'b00: q = m0;
            2'b01: q = m1;
            2'b10: q = m2;
            2'b11: q = m3;
        endcase
    end
    
endmodule