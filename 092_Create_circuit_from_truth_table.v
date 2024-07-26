module top_module (
    input wire clk,
    input wire j,
    input wire k,
    output reg Q
    );
    
    always @(posedge clk) begin
        if (j!=k)
            Q <= j;
        else if (j)
            Q <= ~Q;
        else if (~j)
            Q <= Q;
    end

endmodule