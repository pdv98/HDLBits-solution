module top_module (
    input wire [3:0] SW,
    input wire [3:0] KEY,
    output reg [3:0] LEDR
    );
    
    MUXDFF u0 (
        .R(SW[3]),
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(KEY[3]),
        .out(LEDR[3])
    );
    
    MUXDFF u1 (
        .R(SW[2]),
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[3]),
        .out(LEDR[2])
    );

    MUXDFF u2 (
        .R(SW[1]),
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[2]),
        .out(LEDR[1])
    );

    MUXDFF u3 (
        .R(SW[0]),
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[1]),
        .out(LEDR[0])
    );

endmodule

module MUXDFF (
    input wire R,
    input wire clk,
    input wire E,
    input wire L,
    input wire w,
    output reg out
    );
    
    wire [1:0] A;
    
    assign A = {(L ? R : A[0]), (E ? w : out)};
    
    always @(posedge clk)
        out <= A[1];

endmodule
