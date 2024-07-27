module top_module (
    input wire       clk,
    input wire       reset,
    input wire [3:1] s,
    output reg       fr3,
    output reg       fr2,
    output reg       fr1,
    output reg       dfr
    );

    // [3:1] state, next_state
	// 3'b111	A: higher than S3
    // 3'b011	B: S2 ~ S3
    // 3'b001	C: S1 ~ S2
    // 3'b000	D: lower than S1
    
    // if level lower than previous state -> dfr ON
    // if level higher than previous state -> dfr OFF

    
    parameter A=2'b00, B= 2'b01, C=2'b10, D=2'b11;
    reg [3:1] state, next_state;
    
    always @(posedge clk)
    begin
        if (reset) state <= D;
        else       state <= next_state;
    end
    
    always @(*)
    begin
        case({state, s})
            {A, 3'b111}: {next_state, fr3, fr2, fr1} = {A, 3'b000};
            {A, 3'b011}: {next_state, fr3, fr2, fr1} = {B, 3'b000};
            {A, 3'b001}: {next_state, fr3, fr2, fr1} = {C, 3'b000};
            {A, 3'b000}: {next_state, fr3, fr2, fr1} = {D, 3'b000};
            
            {B, 3'b111}: {next_state, fr3, fr2, fr1} = {A, 3'b001};
            {B, 3'b011}: {next_state, fr3, fr2, fr1} = {B, 3'b001};
            {B, 3'b001}: {next_state, fr3, fr2, fr1} = {C, 3'b001};
            {B, 3'b000}: {next_state, fr3, fr2, fr1} = {D, 3'b001};
            
            {C, 3'b111}: {next_state, fr3, fr2, fr1} = {A, 3'b011};
            {C, 3'b011}: {next_state, fr3, fr2, fr1} = {B, 3'b011};
            {C, 3'b001}: {next_state, fr3, fr2, fr1} = {C, 3'b011};
            {C, 3'b000}: {next_state, fr3, fr2, fr1} = {D, 3'b011};
            
            {D, 3'b111}: {next_state, fr3, fr2, fr1} = {A, 3'b111};
            {D, 3'b011}: {next_state, fr3, fr2, fr1} = {B, 3'b111};
            {D, 3'b001}: {next_state, fr3, fr2, fr1} = {C, 3'b111};
            {D, 3'b000}: {next_state, fr3, fr2, fr1} = {D, 3'b111};
        endcase
    end
    
    always @(posedge clk)
    begin
        if (reset) dfr <= 1'b1;
        else
        begin
            if      (state < next_state) dfr <= 1'b1;
        	else if (state > next_state) dfr <= 1'b0;
        	else                         dfr <= dfr;
        end
    end

endmodule
