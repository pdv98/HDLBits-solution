`default_nettype none

module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out,
    output wire out_n
); 
    
    wire and1, and2;
    
    assign and1 = a & b;
    assign and2 = c & d;
    assign out = and1 | and2;
    assign out_n = ~(and1 | and2);
    
endmodule
