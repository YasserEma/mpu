module ALU (
    input  [7:0] a,
    input  [7:0] b,
    input  [1:0] opcode,
	 input  enable,
    output reg [7:0] out
);

always @(*) begin
    if(enable) begin
		case (opcode)
        2'b00: out <= a + b; // ADD
        2'b01: out <= a - b; // SUB
        2'b10: out <= a & b; // AND
        2'b11: out <= a | b; // OR
        default: out <= 0;
		endcase
	 end
end
endmodule