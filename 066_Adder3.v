module top_module (
    input  wire [2:0] a,
    input  wire [2:0] b, 
    input  wire       cin,
    output wire [2:0] cout, 
    output wire [2:0] sum
);
    
    fadd u0 (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .cout(cout[0]),
    .sum(sum[0])
    );

    fadd u1 (
    .a(a[1]),
    .b(b[1]),
    .cin(cout[0]),
    .cout(cout[1]),
    .sum(sum[1])
    );
    
    fadd u2 (
    .a(a[2]),
    .b(b[2]),
    .cin(cout[1]),
    .cout(cout[2]),
    .sum(sum[2])
    );

endmodule

module fadd (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire cout,
    output wire sum
);

    assign {cout, sum} = a + b + cin;

endmodule