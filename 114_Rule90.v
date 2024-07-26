module top_module(
    input wire          clk,
    input wire          load,
    input wire [511:0]  data,
    output reg [511:0]  q 
    ); 

    always @(posedge clk) 
    begin
        if (load)   q <= data;
        else        q <= {1'b0, q[511:1]} ^ {q[510:0], 1'b0};        
    end

endmodule