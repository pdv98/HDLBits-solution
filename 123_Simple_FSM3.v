module top_module(
    input wire clk,
    input wire in,
    input wire areset,
    output reg out
    );

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next_state;
    
    always @(posedge clk, posedge areset) 
    begin
        if (areset) state <= A;
        else        state <= next_state;
    end
    
    always @(*) 
    begin
        case({state, in})
            {A, 1'b0}: {next_state, out} = {A, 1'b0};
            {A, 1'b1}: {next_state, out} = {B, 1'b0};
            
            {B, 1'b0}: {next_state, out} = {C, 1'b0};
            {B, 1'b1}: {next_state, out} = {B, 1'b0};
            
            {C, 1'b0}: {next_state, out} = {A, 1'b0};
            {C, 1'b1}: {next_state, out} = {D, 1'b0};
            
            {D, 1'b0}: {next_state, out} = {C, 1'b1};
            {D, 1'b1}: {next_state, out} = {B, 1'b1};
        endcase
    end

endmodule
