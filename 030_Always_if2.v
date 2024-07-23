module top_module(
    input wire cpu_overheated,
    input wire arrived,
    input wire gas_tank_empty,
    output reg shut_off_computer,
    output reg keep_driving
);

    always @(*) begin
        if (cpu_overheated)
            shut_off_computer = 1;
        else
            shut_off_computer = 0;
    end

    always @(*) begin
        if ((~gas_tank_empty) & (~arrived))
            keep_driving = 1;
        else 
            keep_driving = 0;
    end

endmodule