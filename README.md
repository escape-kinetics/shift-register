1. Problem statement :-
Design& implement a four-bit Register with Four D flip-flops and Four 4 x 1 Multiplexers with
mode selection inputs s1 and s0. The Register operates according to the values of select
lines, if s1s0-00, no change, s1s0-01 complement output, s1s0-10, shift the bits to the right,
& s1s0=11, shift the bits to left

3. implementation Details :-

The project implements shift operations which are essential functions of
bidirectional/universal shift registers through the following modules : -
a.mux41 (4x1 multiplexer totally 4 units)
b.dfrl (D flip flop with clock , load and reset signal totally 4 units)
4x1 multiplexer accepts 4 bit input and has 2 select lines S0 and S1 which perform the
following behavioural operations

S1 S0 Operation Multiplexer (op)
0 0 No change I0
0 1 Compliments input I1
1 0 Right shift I2
1 1 Left shift I3

Load is used to enable the D flip flop and Reset is used to change all the D flip flop outputs
back to 0.
D flip flops will load and store every bit on each clock edge.

1`b0 is included as an input in multiplexer 0 and multiplexer 3 as

• 1'b0 is included for left shift to ensure a 0 is added to the Least Significant Bit (LSB)
position after discarding the Most Significant Bit (MSB).

• For right shifts, 1'b0 fills the Most Significant Bit (MSB) position after discarding the
Least Significant Bit (LSB).

Example input/output
S1S0 Input  Output
00   0110   0110
01   0110   1001
10   0110   0011
11   0110   1100
