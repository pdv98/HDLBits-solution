module top_module (
    input wire        clk,
    input wire        resetn,
    input wire [ 1:0] byteena,
    input wire [15:0] d,
    output reg [15:0] q
    );
    
    always @(posedge clk) 
    begin
        if (~resetn)
            q <= 0;
        else 
        begin
            if (byteena[1])  q[15:8] <= d[15:8];
        	if (byteena[0])  q[ 7:0] <= d[7:0];
        end
    end

endmodule