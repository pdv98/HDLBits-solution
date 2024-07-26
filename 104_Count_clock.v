module top_module(
    input  wire       clk,
    input  wire       reset,  // sync, active-high, most high priority
    input  wire       ena,         
    output reg        pm,    // 1'b0: AM, 1'b1: PM
    output wire [7:0] hh,    // 01 - 12 hours
    output wire [7:0] mm,    // 00 - 59 minutes
    output wire [7:0] ss     // 00 - 59 seconds
    );

    reg [5:0] sec, min, hour;
	
    always @(posedge clk)
    begin
        if (reset)
        begin
            hour <= 6'd12;
            min <= 6'd0;
            sec <= 6'd0;
        end
        else if (ena) 
        begin
            if (sec == 6'd59) 
                if (min == 6'd59)
                    if (hour == 6'd12)
                    begin
                        sec <= 6'd0;
                        min <= 6'd0;
                        hour <= 6'd1;
                    end
                    else
                    begin
                        sec <= 6'd0;
                        min <= 6'd0;
                        hour <= hour + 1'b1;
                    end    
                else
                begin
                    sec <= 6'd0;
                    min <= min + 1'b1;
                end
            else sec <= sec + 1'b1;
        end
    end

    always @(posedge clk)
    begin
        if (reset)
            pm <= 1'b0;
        else if (ena)
            if ({hour, min, sec} == {6'd11, 6'd59, 6'd59}) pm <= ~pm;
            else                                           pm <= pm;
        else 
            pm <= pm;
    end
    
    assign ss[7:4] = sec / 6'd10;
    assign ss[3:0] = sec % 6'd10;

    assign mm[7:4] = min / 6'd10;
    assign mm[3:0] = min % 6'd10;

    assign hh[7:4] = hour / 6'd10;
    assign hh[3:0] = hour % 6'd10;

endmodule