`timescale 1ns / 1ps
 
module RCA_16bit(term_1, term_2, sum);
input [15:0] term_1,term_2;
output [16:0] sum;

wire [16:0] carry;

generate
genvar i;
for (i=0; i<16; i = i+1)
    begin
    full_adder FA_i
        (.in_1(term_1[i]), .in_2(term_2[i]), .carry_in(carry[i]), .sum_out(sum[i]), .carry_out(carry[i+1]));
    end
endgenerate

assign carry[0] = 1'b0;   
assign sum[16] = carry[16];

endmodule