`timescale 1ns / 1ps

module CLA(term_1, term_2, sum);
input [3:0] term_1, term_2;
output [4:0] sum;

reg [3:0] gen, prop, w;
wire [4:0] carry;

full_adder FA_1
    (.in_1(term_1[0]), .in_2(term_2[0]), .carry_in(carry[0]), .sum_out(sum[0]), .carry_out());
 
full_adder FA_2
    (.in_1(term_1[1]), .in_2(term_2[1]), .carry_in(carry[1]), .sum_out(sum[1]), .carry_out());
 
full_adder FA_3
    (.in_1(term_1[2]), .in_2(term_2[2]), .carry_in(carry[2]), .sum_out(sum[2]), .carry_out());
 
full_adder FA_4
    (.in_1(term_1[3]), .in_2(term_2[3]), .carry_in(carry[3]), .sum_out(sum[3]), .carry_out());

always @(*)
begin

#4 gen[0] = term_1[0] & term_2[0];
#4 gen[1] = term_1[1] & term_2[1];
#4 gen[2] = term_1[2] & term_2[2];
#4 gen[3] = term_1[3] & term_2[3];

#3 prop[0] = term_1[0] | term_2[0];
#3 prop[1] = term_1[1] | term_2[1];
#3 prop[2] = term_1[2] | term_2[2];
#3 prop[3] = term_1[3] | term_2[3];

#4 w[0] = prop[0] & carry[0];
#4 w[1] = prop[1] & carry[1];
#4 w[2] = prop[2] & carry[2];
#4 w[3] = prop[3] & carry[3];

end

assign carry[0] = 1'b0;
assign #3 carry[1] = gen[0] | w[0];
assign #3 carry[2] = gen[1] | w[1];
assign #3 carry[3] = gen[2] | w[2];
assign #3 carry[4] = gen[3] | w[3];
assign sum[4] = carry[4];
endmodule