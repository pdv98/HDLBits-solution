module top_module(
    input  wire clk,
    input  wire areset,    // Freshly brainwashed Lemmings walk left.
    input  wire bump_left,
    input  wire bump_right,
    input  wire ground,
    output wire walk_left,
    output wire walk_right,
    output wire aaah
);

    parameter Walk_L = 2'b00, Walk_R = 2'b01;
    parameter Fall_L = 2'b10, Fall_R = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk, posedge areset)
    begin
        if (areset) state <= Walk_L;	
        else state <= next_state;
    end

    always @(*)
    begin
        case(state)
            Walk_L : next_state = (ground == 0) ? Fall_L : (bump_left ? Walk_R : Walk_L);
            Walk_R : next_state = (ground == 0) ? Fall_R : (bump_right ? Walk_L : Walk_R);
            Fall_L : next_state = (ground == 1) ? Walk_L : Fall_L;
            Fall_R : next_state = (ground == 1) ? Walk_R : Fall_R;
        endcase    
    end
	
    assign walk_left = (state == Walk_L);
    assign walk_right = (state == Walk_R);

    assign aaah = (state == Fall_L) | (state == Fall_R);
    
endmodule
