//adder.v module
module adder(
  input clk,
  input rst,
  input [31:0] pcin,
  output [31:0] pcout
);

  always @(posedge clk) begin
    if (rst) pcout <= 32'b0;
    else pcout <= pcin + 32'd4; //adding a byte to pc result
  end
  
endmodule
