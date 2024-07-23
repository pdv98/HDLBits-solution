module top_module(
    input wire [31:0] a,
    input wire [31:0] b, 
    input wire sub,
    output wire [31:0] sum
);

    wire c0, c1;
    wire [31:0] xin;
    
    assign xin = b ^ {32{sub}};
    
    add16 u0 (
        .a(a[15: 0]),
        .b(xin[15: 0]), 
        .cin(sub),
        .sum(sum[15: 0]), 
        .cout(c0)
    );
    
    add16 u1 (
        .a(a[31:16]),
        .b(xin[31:16]), 
        .cin(c0),
        .sum(sum[31:16]), 
        .cout(c1)
    );
    
endmodule
