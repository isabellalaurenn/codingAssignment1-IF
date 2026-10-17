//final fetch testbench
module fetch_tb();
  reg clk_tb;
  reg rst_tb;
  reg [31:0] mem_pc_src_tb;
  reg [31:0] mem_npc_tb;
  wire [31:0] if_id_instr_tb;
  wire [31:0] if_id_npc_tb;

  fetch DUT(
    .clk(clk_tb),
    .rst(rst_tb).
    .if_id_instr(if_id_instr_tb),
    .if_id_npc(if_id_npc_tb),
    .mem_pc_src(mem_pc_src_tb),
    .mem_npc(mem_npc_tb)
  );

  initial clk_tb <= 0;
  initial begin
    rst_tb <= 1;
    #4;
    rst_tb <= 0;
  end
  always #1 clk_tb <= ~clk_tb;
  initial begin
    mem_pc_src_tb <= 0;
    mem_npc_tb <= 32'hFFFFFFFF;
    #20;
    mem_npc_tb <= 32'h00000000;
    mem_pc_src_tb <= 1;
    #50;
    mem_pc_src_tb <= 0;
    #20;
    $finish;
  end
endmodule
