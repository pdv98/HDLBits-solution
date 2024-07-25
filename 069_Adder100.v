module top_module(
    input  wire [99:0] a,
    input  wire [99:0] b,
    input  wire        cin,
    output wire        cout,
    output wire [99:0] sum
);
    
    assign {cout, sum} = a + b + cin;    

endmodule
