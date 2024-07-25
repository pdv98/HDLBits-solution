module top_module (
    input  wire d,
    input  wire ena,
    output wire q
    );
    
    always @(*)
    begin
        if (ena)
            q <= d;
        else
            q <= q;
    end

endmodule
