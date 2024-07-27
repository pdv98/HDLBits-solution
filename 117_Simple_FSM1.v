module top_module(
    input wire clk,
    input wire areset,    // Asynchronous reset to state B
    input wire in,
    output reg out
    );

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(posedge clk, posedge areset)
    begin
        if (areset) state <= B;
        else        state <= next_state;
    end
    
    always @(*)
    begin  
        case({state, in})
            {A, 1'b0}: {next_state, out} = {B, 1'b0};
            {A, 1'b1}: {next_state, out} = {A, 1'b0};
            
            {B, 1'b0}: {next_state, out} = {A, 1'b1};
            {B, 1'b1}: {next_state, out} = {B, 1'b1};
        endcase
    end

endmodule
