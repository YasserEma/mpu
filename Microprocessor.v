module Microprocessor (
    input clk,
    input rst,
	 output  [7:0] result	 
);

wire [7:0] pc_wire, data_A_mem, data_B_mem, data_A_reg, data_B_reg, alu_result;
wire alu_op_wire, jmp_op_wire;
wire [2:0] opcode_wire;
wire [1:0] op_control_wire;


PC pc(
	.clk(clk),
	.rst(rst), 
	.jmp(jmp_op_wire), 
	.jmp_address(data_A_reg), 
	.PC_out(pc_wire)
);

InstructionMemory mem(
	.clk(clk),
	.rst(rst),
	.address(pc_wire),
	.opcode(opcode_wire),
	.data_A(data_A_mem),
	.data_B(data_B_mem)
);

RegisterFile rf(
    .clk(clk),
    .rst(rst),
    .write_enable(1'b1),
	 .data_in_A(data_A_mem),
	 .data_in_B(data_B_mem),
	 .data_out_A(data_A_reg),
	 .data_out_B(data_B_reg)
);

ALU alu (
	 .a(data_A_reg),
    .b(data_B_reg),
    .opcode(op_control_wire),
	 .enable(alu_op_wire),
    .out(alu_result)
);

ControlUnit cu(
    .clk(clk),
    .rst(rst),
    .opcode(opcode_wire),
    .jmp_op(jmp_op_wire),
	 .alu_op(alu_op_wire),
	 .op(op_control_wire)
);

assign result = alu_result;

endmodule