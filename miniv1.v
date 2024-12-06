module mux41(input wire i0,i1,i2,i3,input wire s1,s0,output wire o);
wire t0,t1;

mux21 mux2_0 (i0,i1,s1,t0);
mux21 mux2_1 (i2,i3,s1,t1);
mux21 mux2_2 (t0,t1,s0,o);
endmodule

module dff(input wire clk,reset,load,input wire [3:0] in,output wire [3:0] regin);

dfrl df0(clk,reset,load,in[0],regin[0]);
dfrl df1(clk,reset,load,in[1],regin[1]);
dfrl df2(clk,reset,load,in[2],regin[2]);
dfrl df3(clk,reset,load,in[3],regin[3]);
endmodule

module mux(input wire [3:0] regin,input wire s0,s1,output wire [3:0] o);
wire [3:0] inv;

assign inv[0] = !regin[0];
assign inv[1] = !regin[1];
assign inv[2] = !regin[2];
assign inv[3] = !regin[3];

mux41 mux0(regin[0],inv[0],regin[1],1'b0,s0,s1,o[0]);
mux41 mux1(regin[1],inv[1],regin[2],regin[0],s0,s1,o[1]);
mux41 mux2(regin[2],inv[2],regin[3],regin[1],s0,s1,o[2]);
mux41 mux3(regin[3],inv[3],1'b0,regin[2],s0,s1,o[3]);	
endmodule

module register4bit(input wire clk, reset, load, input wire [3:0] i, input wire [1:0] s, output wire [3:0] o);
wire [3:0] out;

mux m0(i, s[0], s[1], out);
dff d0(clk, reset, load, out, o); 	
endmodule