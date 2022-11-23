module mux3 #
(
     parameter WIDTH = 8
) (
     input  [WIDTH-1:0] ALUResultW,
     input  [WIDTH-1:0] ReadDataW,
     input  [WIDTH-1:0] PCPlus4W,
     input  [1:0]       ResultSrcW,
     output [WIDTH-1:0] ResultW
);
     assign ResultW = ResultSrcW[1] ? PCPlus4W : (ResultSrcW[0] ? ReadDataW : ALUResultW);
endmodule
