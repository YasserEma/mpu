module ControlUnit (
    input clk,
    input rst,
    input [2:0] opcode,
    output reg jmp_op,
	 output reg alu_op,
	 output reg [1:0] op
);

always @(posedge clk) begin
    if (rst) begin
		jmp_op <= 1'b0;
		alu_op <= 1'b0;
	 end 
	 case (opcode)
        3'b000: begin // ADD
            alu_op <= 1'b1;
				op <= 2'b00;
            jmp_op <= 1'b0;
        end
		  3'b001: begin // SUB
            alu_op <= 1'b1;
				op <= 2'b01;
            jmp_op <= 1'b0;
        end
		  3'b010: begin // AND
            alu_op <= 1'b1;
				op <= 2'b10;
            jmp_op <= 1'b0;
        end
		  3'b011: begin // OR
            alu_op <= 1'b1;
				op <= 2'b11;
            jmp_op <= 1'b0;
        end
		  3'b100: begin // Jump
            alu_op <= 1'b0;
            jmp_op <= 1'b1;
        end
		  default: begin
            alu_op <= 1'b0;
            jmp_op <= 1'b0;
        end
    endcase
end
endmodule