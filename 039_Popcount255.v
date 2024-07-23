module top_module(
    input wire [254:0] in,
    output reg [7:0]   out
);
    
    integer i;
    
    always @(*) begin
        out = 0;
        for (i = 0; i < 255; i++)
            out = out + in[i];
    end

endmodule