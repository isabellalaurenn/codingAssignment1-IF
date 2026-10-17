// mem.v - Intruction Memory that stores MIPS instructions and outputs the instruction at the specified address
module mem(
    input wire clk, // Clock signal input (Clk)
    input wire rst, // Reset signal
    input wire [31:0] addr,// 32-bit Address input (Program Counter)
    output reg [31:0] instr_out // 32-bit Instruction output (Instruction)
);

  reg [31:0] mem [0:4294967295]; // 2^32 = 4,294,967,295 words of 32-bit memory (first 10 addresses contain our "Dummy Data")

initial begin
    // Addresses are increased by 4 bytes since MIPS instructions are 32 bits (4 bytes)
    // 32 bits of Hex value: ########
    mem[0] = 32'hA00000AA;  // A00000AA
    mem[4] = 32'h10000011;  // 10000011
    mem[8] = 32'h20000022;  // 20000022
    mem[12] = 32'h30000033; // 30000033
    mem[16] = 32'h40000044; // 40000044
    mem[20] = 32'h50000055; // 50000055
    mem[24] = 32'h60000066; // 60000066
    mem[28] = 32'h70000077; // 70000077
    mem[32] = 32'h80000088; // 80000088
    mem[36] = 32'h90000099; // 90000099

end

always @(*) // Combinational Logic that outputs the instruction at the specified address
begin
    instr_out = mem[addr]; // instruction output is the value stored in the memory array at that address
end

endmodule






