module top_module (
    input  wire        clk,
    input  wire        reset,
    output wire [ 3:1] ena,
    output reg  [15:0] q
    );
  
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};
    
    count4 u0(
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0])
    );

    count4 u1(
        .clk(clk),
        .reset(reset),
        .ena(ena[1]),
        .q(q[7:4])
    );

    count4 u2(
        .clk(clk),
        .reset(reset),
        .ena(ena[2]),
        .q(q[11:8])
    );

    count4 u3(
        .clk(clk),
        .reset(reset),
        .ena(ena[3]),
        .q(q[15:12])
    );

endmodule

module count4 (
    input wire       clk,
    input wire       reset,
    input wire       ena,
    output reg [3:0] q
    );
    
    always @(posedge clk)
    begin
        if (reset)
            q <= 4'd0;
        else 
        begin
            if (ena)
            begin
                if (q == 4'd9) q <= 4'd0;
                else           q <= q + 1'b1;
            end
        end
    end
endmodule