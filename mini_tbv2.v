module tbregister4bit;

    reg clk; 
    reg reset; 
    reg load; 
    reg [3:0] i; 
    reg [1:0] s; 
    wire [3:0] o;

    register4bit uut (.clk(clk), .reset(reset), .load(load), .i(i), .s(s), .o(o));
	initial begin
        $dumpfile("register_4bit.vcd");
        $dumpvars(0, tbregister4bit);
		clk = 0; 
        reset = 1; 
        load = 1; 
        i = 4'b0110; 
        s = 2'b00;

        #10 reset = 0; 

        #5 clk = 1; 
        s = 2'b00; 
		#5 clk = 0;
        #10; $display("%t: clk=%b reset=%b load=%b Input=%b S=%b Output=%b", $time, clk, reset, load, i, s, o);

        #5 clk = 1; 
        s = 2'b01; 
		#5 clk = 0; 
        #10; $display("%t: clk=%b reset=%b load=%b Input=%b S=%b Output=%b", $time, clk, reset, load, i, s, o);

        #5 clk = 1; 
        s = 2'b10; 
        #5 clk = 0; 
        #10; $display("%t: clk=%b reset=%b load=%b Input=%b S=%b Output=%b", $time, clk, reset, load, i, s, o);
        
		#5 clk = 1; 
        s = 2'b11; 
        #5 clk = 0; 
        #10; $display("%t: clk=%b reset=%b load=%b Input=%b S=%b Output=%b", $time, clk, reset, load, i, s, o);

        #50 $finish;
    end
	always #5 clk = ~clk;
endmodule