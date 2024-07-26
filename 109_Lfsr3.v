module top_module (
    input  wire [2:0] SW,
    input  wire [1:0] KEY,
    output wire [2:0] LEDR
    );
    
    wire        L;
    wire        clk;
    wire [2:0]  R;
    reg  [2:0]  Q;
    
    assign R = SW;
    assign {L, clk} = KEY;
        
    always @(posedge clk)
    begin
        if (L)  Q <= R;
        else    Q <= {Q[2]^Q[1], Q[0], Q[2]};
    end
    
    assign LEDR = Q;


endmodule
