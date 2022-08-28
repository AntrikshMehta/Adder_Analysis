`timescale 1ns / 1ps

module RCA(term_1, term_2, sum);
input [3:0] term_1, term_2;
output [4:0] sum;

wire [4:0] carry;

full_adder FA_1
    (.in_1(term_1[0]), .in_2(term_2[0]), .carry_in(carry[0]), .sum_out(sum[0]), .carry_out(carry[1]));

full_adder FA_2
    (.in_1(term_1[1]), .in_2(term_2[1]), .carry_in(carry[1]), .sum_out(sum[1]), .carry_out(carry[2]));
 
full_adder FA_3
    (.in_1(term_1[2]), .in_2(term_2[2]), .carry_in(carry[2]), .sum_out(sum[2]), .carry_out(carry[3]));
 
full_adder FA_4
    (.in_1(term_1[3]), .in_2(term_2[3]), .carry_in(carry[3]), .sum_out(sum[3]), .carry_out(carry[4]));

assign carry[0] = 1'b0;
assign sum[4] = carry[4];

endmodule