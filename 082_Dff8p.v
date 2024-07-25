module top_module (
    input  wire       clk,
    input  wire       reset,
    input  wire [7:0] d,
    output wire [7:0] q
    );
    
    my_dff0 u0 (.clk(clk), .reset(reset), .d(d[0]), .q(q[0]));
    my_dff0 u1 (.clk(clk), .reset(reset), .d(d[1]), .q(q[1]));
    my_dff1 u2 (.clk(clk), .reset(reset), .d(d[2]), .q(q[2]));
    my_dff0 u3 (.clk(clk), .reset(reset), .d(d[3]), .q(q[3]));
    my_dff1 u4 (.clk(clk), .reset(reset), .d(d[4]), .q(q[4]));
    my_dff1 u5 (.clk(clk), .reset(reset), .d(d[5]), .q(q[5]));
    my_dff0 u6 (.clk(clk), .reset(reset), .d(d[6]), .q(q[6]));
    my_dff0 u7 (.clk(clk), .reset(reset), .d(d[7]), .q(q[7]));

endmodule

module my_dff0 (
    input  wire clk,
    input  wire reset,
    input  wire d,
    output wire q
    );
    
    always @(negedge clk) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end

endmodule

module my_dff1 (
    input  wire clk,
    input  wire reset,
    input  wire d,
    output wire q
    );
    
    always @(negedge clk) begin
        if (reset)
            q <= 1;
        else
            q <= d;
    end

endmodule
