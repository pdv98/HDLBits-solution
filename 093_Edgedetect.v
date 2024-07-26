module top_module (
    input wire       clk,
    input wire [7:0] in,
    output reg [7:0] pedge
    );

    reg [7:0] prev_in;
    
    integer i;

    always @(posedge clk) begin
        for (i=0; i<8; i++)
        begin
            if (in[i] && !prev_in[i])
                pedge[i] <= 1;
            else
                pedge[i] <= 0;
        prev_in <= in;
        end
    end

endmodule
