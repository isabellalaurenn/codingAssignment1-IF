//adder.v module
module adder(
  input clk,
  input rst,
  input [31:0] pc_in,
  output [31:0] pc_out
);

  always @(posedge clk) begin
    if (rst) pc_out <= 32'b0;
    else pc_out <= pc_in + 32'd4; //adding a byte to pc result
  end
  
endmodule
