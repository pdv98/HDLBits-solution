module top_module(
    input  wire [99:0] in,
    output wire [98:0] out_both,
    output wire [99:1] out_any,
    output wire [99:0] out_different
);
    
    integer i;
    
    always @(*) 
    begin
        for (i=0; i<99; i++) 
        begin
            out_both[i]         = in[i] & in[i+1];
            out_any[i+1]        = in[i+1] | in[i];
            out_different[i]    = in[i] ^ in[i+1];
        end
        out_different[99] = in[99] ^ in[0];
    end

endmodule
