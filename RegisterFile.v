module RegisterFile (
    input	clk,
    input   rst,
    input	write_enable,
	 input  [7:0] 	data_in_A,
	 input  [7:0] 	data_in_B,
	 output [7:0] data_out_A,
	 output [7:0] data_out_B
);

reg [7:0] registers [0:1];

integer i;
always @(posedge clk) begin
    if (rst) begin
		for(i = 0; i < 2; i = i + 1) begin
			registers[i] <= 8'b0;
		end
    end else begin
		if (write_enable) begin
			registers[0] <= data_in_A;
			registers[1] <= data_in_B;
		end
    end
end

assign   data_out_A = registers[0];
assign   data_out_B = registers[1];

endmodule
