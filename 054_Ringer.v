module top_module(
    input  wire ring,
    input  wire vibrate_mode,
  	output wire ringer,
    output wire motor
    );
    
    wire [1:0] sig_in;

    assign sig_in = {ring, vibrate_mode};
    
    always @(*) 
    begin
        case(sig_in)
            2'b00: 
            begin 
                ringer = 0; 
                motor = 0; 
            end
            2'b01: 
            begin 
                ringer = 0; 
                motor = 0; 
            end
            2'b10: 
            begin 
                ringer = 1; 
                motor = 0; 
            end
            2'b11: 
            begin 
                ringer = 0; 
                motor = 1; 
            end
        endcase
    end    

endmodule
