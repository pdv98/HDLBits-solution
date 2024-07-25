module top_module (
    input wire       clk,
    input wire       reset,
    input wire [7:0] d,
    output reg [7:0] q
);
    
    my_DFF u0 (.clk(clk), .reset(reset), .d(d[0]), .q(q[0]));
    my_DFF u1 (.clk(clk), .reset(reset), .d(d[1]), .q(q[1]));
    my_DFF u2 (.clk(clk), .reset(reset), .d(d[2]), .q(q[2]));
    my_DFF u3 (.clk(clk), .reset(reset), .d(d[3]), .q(q[3]));
    my_DFF u4 (.clk(clk), .reset(reset), .d(d[4]), .q(q[4]));
    my_DFF u5 (.clk(clk), .reset(reset), .d(d[5]), .q(q[5]));
    my_DFF u6 (.clk(clk), .reset(reset), .d(d[6]), .q(q[6]));
    my_DFF u7 (.clk(clk), .reset(reset), .d(d[7]), .q(q[7]));

endmodule

module my_DFF (
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);
    
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end
    
endmodule