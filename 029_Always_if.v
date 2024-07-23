module top_module(
    input wire a,
    input wire b,
    input wire sel_b1,
    input wire sel_b2,
    output wire out_assign,
    output reg out_always
);
    
    assign out_assign = (sel_b1 & sel_b2) ? b : a;
    
    always @(*) begin
        if ((sel_b1 == 1) & (sel_b2 == 1)) 
            out_always = b;
        else 
            out_always = a;
    end
    
endmodule
