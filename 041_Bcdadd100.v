module top_module (
    input   wire [399:0]    a,
    input   wire [399:0]    b, 
    input   wire            cin,
   	output  wire            cout, 
    output  wire [399:0]    sum
);
    
    wire [100:0] carry; // Internal carry signals

    assign carry[0] = cin;

    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder
            bcd_fadd u_bcd_fadd (
                .a(a[4*i +: 4]),    // Select 4 bits for each BCD digit from a
                .b(b[4*i +: 4]),    // Select 4 bits for each BCD digit from b
                .cin(carry[i]),     // Carry-in from previous stage
                .cout(carry[i+1]),  // Carry-out to next stage
                .sum(sum[4*i +: 4]) // Sum of this stage
            );
        end
    endgenerate

    assign cout = carry[100];       // Final carry-out from the last stage

endmodule