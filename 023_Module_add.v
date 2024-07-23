module top_module(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum
);

    wire wc1, wc2;
    wire [15:0] a1, a2, b1, b2, sum1, sum2;
    
    assign {a2, a1} = a;
    assign {b2, b1} = b;

    add16 u0 (.a(a1), .b(b1), .cin(1'b0), .sum(sum1), .cout(wc1));
    add16 u1 (.a(a2), .b(b2), .cin(wc1), .sum(sum2), .cout(wc2));
        
    assign sum = {sum2, sum1};
    
endmodule

