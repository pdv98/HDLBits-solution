module top_module (
    input  wire [3:0] x, 
    input  wire [3:0] y, 
    output wire [4:0] sum
);
    
    wire w0, w1, w2;
    
    FA u0(
        .x(x[0]), 
        .y(y[0]),
        .cin(1'b0),
        .cout(w0),
        .sum(sum[0])
    );

    FA u1(
        .x(x[1]), 
        .y(y[1]),
        .cin(w0),
        .cout(w1),
        .sum(sum[1])
    );

    FA u2(
        .x(x[2]),
        .y(y[2]),
        .cin(w1),
        .cout(w2),
        .sum(sum[2])
    );

    FA u3(
        .x(x[3]),
        .y(y[3]),
        .cin(w2),
        .cout(sum[4]),
        .sum(sum[3])
    );

endmodule


module FA (
    input  wire x, 
    input  wire y,
    input  wire cin,
    output wire cout,
    output wire sum
);
    
    assign {cout, sum} = x + y + cin;
    
endmodule