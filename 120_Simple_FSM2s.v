module top_module(
    input wire clk,
    input wire reset,    // Synchronous reset to OFF
    input wire j,
    input wire k,
    output reg out
    );

    parameter OFF=1'b0, ON=1'b1; 
    reg state, next_state;
	
    // State flip-flops with synchronous reset
    always @(posedge clk) 
    begin
        if (reset) state <= OFF;
        else       state <= next_state;
    end
    
    // State transition logic
    always @(*) 
    begin
        casez({state, j, k})
            {OFF, 1'b0, 1'bz}: {next_state, out} = {OFF, 1'b0};
            {OFF, 1'b1, 1'bz}: {next_state, out} = {ON,  1'b0};
            
            {ON,  1'bz, 1'b0}: {next_state, out} = {ON,  1'b1};
            {ON,  1'bz, 1'b1}: {next_state, out} = {OFF, 1'b1};
        endcase
    end

endmodule