module mux2_alu #
(
   parameter WIDTH = 8
) (
   input [WIDTH-1:0]  WriteDataE,
   input [WIDTH-1:0]  ImmExtE,
   input              ALUSrcE,
   output [WIDTH-1:0] SrcBE
);
   assign SrcBE = ALUSrcE ?  ImmExtE:WriteDataE;

endmodule
