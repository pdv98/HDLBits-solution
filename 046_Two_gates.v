module top_module (
    input  wire in1,
    input  wire in2,
    input  wire in3,
    output wire out
);

    wire w1;
    
    assign w1 = ~(in1 ^ in2);
    assign out = w1 ^ in3;

endmodule