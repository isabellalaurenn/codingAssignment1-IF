//adder.v module
module adder(
  input [31:0] a,
  output [31:0] sum
);

  assign sum = a + 32'd4;
endmodule
