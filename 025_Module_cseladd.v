module top_module(
    input wire [31:0] a,
    input wire [31:0]  b,
    output wire [31:0] sum
);

    wire sel, c1, c2; 
    wire [15:0] s1, s2;
    
    always @(*) begin
        case(sel)
            1'b0: sum[31:16] = s1;
            1'b1: sum[31:16] = s2;
        endcase
    end
    
    add16 u0 (
        .a(a[15: 0]),
        .b(b[15: 0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(sel)
    );

    add16 u1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(s1),
        .cout(c1)
    );

    add16 u2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(s2),
        .cout(c2)
    );

endmodule
