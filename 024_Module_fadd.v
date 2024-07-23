module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
   	output wire [31:0] sum
);

    wire w0, w1;
    
    add16 u0 (.a(a[15: 0]), .b(b[15: 0]),  .cin(1'b0), .sum(sum[15: 0]), .cout(w0));
    add16 u1 (.a(a[31:16]), .b(b[31:16]),  .cin(w0), .sum(sum[31:16]), .cout(w1));
    
endmodule

module add1 (
    input wire a,
    input wire b, 
    input wire cin,
    output wire cout,
    output wire sum
);

    assign {cout, sum} = a + b + cin;

endmodule