module top_module(
    input  wire a,
    input  wire b,
    input  wire c,
    input  wire d,
    output wire out
);
    
    assign out = (~a)&(~c)&((~b)|(~d)) | (~a)&c&(~d) | c&d&(a|b) | a&(~b)&((~c)|d);

endmodule