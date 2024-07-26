module top_module (
    input wire       clk, 
    input wire [7:0] in,
    output reg [7:0] anyedge
    );
    
    reg [7:0] prev_in;
    
    always @(posedge clk)
    begin
        prev_in <= in;
        anyedge <= prev_in ^ in;
    end
        
endmodule
