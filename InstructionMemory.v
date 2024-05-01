module InstructionMemory (
    input clk,
    input rst,
    input  [7:0] address,
	 output reg [2:0] opcode,
    output reg [7:0] data_A,
    output reg [7:0] data_B
);

reg [7:0] memory [0:255];

	
always @(posedge clk) begin
    if (rst) begin
	 	// Load the instructions into the memory from the "Instructions.txt" file 
		$readmemb("Instructions.txt", memory);
		
		// First intruction:  (Add 4,1) where A = 4, B = 1
		// Second intruction: (Sub 3,2) where A = 3, B = 2
		// Third intruction:  (AND 4,1) where A = 4, B = 1
		// Fourth intruction: (OR 4,1)  where A = 4, B = 1
		// Fifth intruction:  (Jump A)  where A = 64 which represents the address the PC has to jump to
	 end
	 
		opcode <= memory[address][2:0];
		data_A <= memory[address + 1];
		data_B <= memory[address + 2];	
end
endmodule