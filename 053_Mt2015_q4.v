module top_module (
    input  wire x,
    input  wire y,
    output wire z
);
    
    wire w1, w2, w3, w4;
    
    module_A IA1 (
        .x(x), 
        .y(y), 
        .z(w1)
    );

    module_B IB1 (
        .x(x), 
        .y(y), 
        .z(w2)
    );

    module_A IA2 (
        .x(x), 
        .y(y), 
        .z(w3)
    );

    module_B IB2 (
        .x(x), 
        .y(y), 
        .z(w4)
    );
    
    assign z = (w1 | w2) ^ (w3 & w4);

endmodule


module module_A (
    input  wire x,
    input  wire y,
    output wire z
);
    
    assign z = (x ^ y) & x;
    
endmodule


module module_B (
    input  wire x,
    input  wire y,
    output wire z
);
    
    assign z = ~(x ^ y);
    
endmodule