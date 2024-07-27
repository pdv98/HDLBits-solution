module top_module(
    input  wire       in,
    input  wire [3:0] state,
    output wire [3:0] next_state,
    output wire       out
    );

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[A] & ~in) | (state[C] & ~in);  
    assign next_state[B] = (state[A] &  in) | (state[B] &  in) | (state[D] & in);
    assign next_state[C] = (state[B] & ~in) | (state[D] & ~in);
    assign next_state[D] = state[C] & in;

    // Output logic: 
    assign out = (state[D]);

endmodule
