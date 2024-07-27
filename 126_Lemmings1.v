module top_module(
    input  wire clk,
    input  wire areset,    // Freshly brainwashed Lemmings walk left.
    input  wire bump_left,
    input  wire bump_right,
    output wire walk_left,
    output wire walk_right
    );

    parameter LEFT = 1'b0, RIGHT = 1'b1;
    reg state, next_state;

    always @(posedge clk, posedge areset)
    begin
        if (areset) state <= LEFT;	
        else        state <= next_state;
    end

    always @(*)
    begin
        case(state)
            LEFT  : next_state = bump_left  ? RIGHT :  LEFT;
            RIGHT : next_state = bump_right ? LEFT  : RIGHT;
        endcase    
    end
	
    assign walk_left  = (state ==  LEFT);
    assign walk_right = (state == RIGHT);
    
endmodule
