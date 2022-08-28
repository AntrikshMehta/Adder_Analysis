`timescale 1ns / 1ps

module full_adder(in_1, in_2, carry_in, sum_out, carry_out);
input in_1, in_2, carry_in;
output reg sum_out, carry_out;
reg p,q,r,s;

always @(*)
begin

#7 p = in_1 ^ in_2;
#7 sum_out = p ^ carry_in;

#4 q = in_1 & in_2;
#4 r = carry_in & in_2;
#4 s = in_1 & carry_in;

#3 carry_out = q | r | s;

end
endmodule
