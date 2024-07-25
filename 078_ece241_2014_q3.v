module top_module (
    input  wire       c,
    input  wire       d,
    output wire [3:0] mux_in
);
    
    assign mux_in = {c&d, ~d, 1'b0, c|d};

endmodule