module top_module(
    input wire [99:0] a,
    input wire [99:0] b,
    input wire        cin,
    output reg [99:0] cout,
    output reg [99:0] sum
);
    
    integer i;
    
    always @(*) begin
        {cout[0], sum[0]} = a[0] + b[0]+ cin;
        for (i=1; i<100; i++)
            {cout[i], sum[i]} = a[i] + b[i] + cout[i-1];
    end

endmodule