module top_module( 
    input wire 		 do_sub,
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [7:0] out,
    output reg 		 result_is_zero
);

    always @(*)
    begin
        case(do_sub)
          1'b0: out = a + b;
          1'b1: out = a - b;
        endcase
    end
    always @(*)
    begin
        if(out == 0)
            result_is_zero = 1'b1;
        else 
            result_is_zero = 1'b0;
    end

endmodule
