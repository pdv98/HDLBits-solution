module top_module (
    input wire       clk,
    input wire       reset,
    input wire       slowena,
    output reg [3:0] q
    );
       
    always @(posedge clk)
    begin
        if (slowena & ~reset)
        begin
            if (q != 4'd9) q <= q + 1'b1;
            else       	   q <= 1'b0;
        end
        else if (reset)
            q <= 1'b0;
    end
        
endmodule