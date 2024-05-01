`timescale 1ns/1ps
module MicroprocessorTB();
reg clk, rst;
wire [7:0] result;

Microprocessor M(clk, rst, result);

initial begin
	clk = 0;
	rst = 1;
	#10 rst = 0;
end

initial begin 
	#100 $stop;
end

always begin
	#5 clk = ~clk;
end

endmodule