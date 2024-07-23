module top_module(
    input wire [99:0] in,
    output wire [99:0] out
);

    integer i;
    
    always @(*) begin
        for (i = 0; i < 100; i++)
            out[i] = in[99-i];
    end

endmodule