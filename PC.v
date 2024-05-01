module PC (
    input clk,
    input rst,
	 input jmp,
	 input [7:0] jmp_address,
    output reg [7:0] PC_out
);

always @(posedge clk) begin
    if (rst) begin
        PC_out <= 0;
    end else if (jmp) begin
		  PC_out <= jmp_address;
    end else begin
		  PC_out <= PC_out + 4;
	 end
	 
end
endmodule
