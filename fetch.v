//the whole fetch stage combined
module fetch(
  input clk,
  input rst,
  input mem_pc_src,
  input [31:0] mem_npc,
  output [31:0] if_id_instr,
  output [31:0] if_id_npc
);

  wire rst = 1'b0;

  wire [31:0] pc_out, pc_4, pc_mux, instr_data;

  mux mux0(
    .out(pc_mux),
    .in1(mem_npc),
    .in0(pc_4),
    .sel(mem_pc_src)
  );

  pc pc0 (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_mux),
    .pc_out(pc_out)
  );

  adder adder0 (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_out),
    .pc_out(pc_4)
  );

  mem mem0 (
    .clk(clk),
    .rst(rst),
    .addr(pc_out),
    .instr_out(instr_data)
  );

  if_id_latch latch0 (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_4),
    .instr_in(instr_data),
    .pc_out(if_id_npc),
    .instr_out(if_id_instr)
  );

endmodule
