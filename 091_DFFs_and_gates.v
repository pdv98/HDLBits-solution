module top_module (
    input wire clk,
    input wire x,
    output reg z
    );
    
    wire q0, q1, q2;
    
    initial begin
        q0 = 0;
        q1 = 0;
        q2 = 0;
    end
    
    my_dff u0 (clk, q0^x, q0);
    my_dff u1 (clk, (~q1)&x, q1);
    my_dff u2 (clk, (~q2)|x, q2);
    
    assign z = ~(q0|q1|q2);

endmodule

module my_dff (
    input wire clk,
    input wire d,
    output reg q
    );
    
    always @(posedge clk)
        q <= d;
    
endmodule