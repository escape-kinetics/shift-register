module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module invert (input wire i, output wire o);
  assign o = !i;
endmodule

module mux21 (input wire i0, i1, s, output wire o);
  assign o = (s==0) ? i0 : i1;
endmodule

module df (input wire clk, in, output wire q);
  reg dfout;
  always @(posedge clk) 
  dfout <= in;
  assign q = dfout;
endmodule

module dfr (input wire clk, reset, in, output wire q); 
  wire resetn, dfin;
  invert invert0 (reset, resetn);
  and2 and20 (in, resetn, dfin);
  df df0 (clk, dfin, q);
endmodule

module dfrl (input wire clk, reset, load, in, output wire q);
  wire inmux;
  mux21 mux20 (q, in, load, inmux);
  dfr dfr1 (clk, reset, inmux, q);
endmodule