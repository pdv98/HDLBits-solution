// Conway's Game of Life 16x16
/*
Conway's Game of Life is a two-dimensional cellular automaton.
The "game" is played on a two-dimensional grid of cells, where each cell 
is either 1 (alive) or 0 (dead). At each time step, each cell changes state 
depending on how many neighbours it has:

0-1 neighbour: Cell becomes 0.
2 neighbours: Cell state does not change.
3 neighbours: Cell becomes 1.
4+ neighbours: Cell becomes 0.

The game is formulated for an infinite grid. In this circuit, we will use 
a 16x16 grid. To make things more interesting, we will use a 16x16 toroid, 
where the sides wrap around to the other side of the grid. For example, 
the corner cell (0,0) has 8 neighbours: (15,1), (15,0), (15,15), (0,1), 
(0,15), (1,1), (1,0), and (1,15). The 16x16 grid is represented by a length 
256 vector, where each row of 16 cells is represented by a sub-vector: 
q[15:0] is row 0, q[31:16] is row 1, etc. (This tool accepts SystemVerilog, 
so you may use 2D vectors if you wish.) 

load: Loads data into q at the next clock edge, for loading initial state.
q: The 16x16 current state of the game, updated every clock cycle.

The game state should advance by one timestep every clock cycle.
John Conway, mathematician and creator of the Game of Life cellular automaton, 
passed away from COVID-19 on April 11, 2020.
*/

module top_module(
    input wire         clk,
    input wire         load,
    input wire [255:0] data,
    output reg [255:0] q
    ); 

    reg [255:0] q_next;
    reg [  3:0] neighbours;

    integer i;

    always @(posedge clk)
    begin
        if (load)
            q <= data;
        else 
        begin
            for (i=0; i<256; i++)
            begin
                if (i == 0)
                    neighbours = q[1] + q[16] + q[17] + q[240] + q[241] + q[15] + q[31] + q[255];
                else if (i>0 & i<15)
                    neighbours = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i+239] + q[i+240] + q[i+241];
                else if (i == 15)
                    neighbours = q[14] + q[16] + q[0] + q[240] + q[254] + q[30] + q[31] + q[255];

                else if (i == 240)
                    neighbours = q[0] + q[15] + q[239] + q[241] + q[1] + q[224] + q[225] + q[255];
                else if (i>240 & i<255)
                    neighbours = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i-239] + q[i-240] + q[i-241];
                else if (i == 255)
                    neighbours = q[0] + q[15] + q[14] + q[224] + q[238] + q[240] + q[239] + q[254];
                
                else if (i%16 == 0)
                    neighbours = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i-16] + q[i-15] + q[i+31];
                else if (i%16 == 15)
                    neighbours = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i-17] + q[i-16] + q[i-15] + q[i-31];

                else
                    neighbours = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i+15] + q[i+16] + q[i+17];
          		
                case (neighbours)
                    4'b0010: q_next[i] = q[i];
                    4'b0011: q_next[i] = 1'b1;
                    
                    default: q_next[i] = 1'b0;
                endcase
            end
            q = q_next;
        end
    end

endmodule
