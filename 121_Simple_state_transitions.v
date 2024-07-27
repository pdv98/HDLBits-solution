module top_module(
    input wire       in,
    input wire [1:0] state,
    output reg [1:0] next_state,
    output reg       out
    );

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	
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
