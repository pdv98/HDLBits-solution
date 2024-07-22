module top_module (
    input wire [7:0] in,
    output wire [31:0] out 
);

    assign out = {{24{in[7]}}, {in[7:0]}};
    
endmodule