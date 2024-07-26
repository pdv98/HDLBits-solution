module top_module (
    input wire        clk, 
    input wire        reset, 
    input wire [31:0] in,
    output reg [31:0] out
    );

    reg [31:0] pre_in;

    always @(posedge clk)
    begin
        if (reset)
            out <= 32'b0;
        else
        begin
            integer i;
            for (i = 0; i < 32; i = i + 1)
                if (pre_in[i] & (~in[i]))
                    out[i] <= 1;
        end
        pre_in <= in;
    end

endmodule
