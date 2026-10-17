//if id latch module
module if_id_latch(
  input clk,
  input rst,
  input [31:0] pc_in,
  input [31:0] instr_in,
  output reg [31:0] pc_out,
  output reg [31:0] instr_out
);

  always @(posedge clk) begin
    if (rst) begin
      pc_out <= 32'b0;
      instr_out <= 32'b0;
    end else begin
      pc_out <= pc_in; //sending the if results on to the next id stage
      instr_out <= instr_in;
    end
  end 
  
endmodule
