module mux4 #
(
     parameter WIDTH = 8
) (
     input  [WIDTH-1:0] RD2E,
     input  [WIDTH-1:0] ResultW,
     input  [WIDTH-1:0] ALUResultM,
     input  [1:0]       ForwardBE,
     output [WIDTH-1:0] WriteDataE
);
     assign WriteDataE = ForwardBE[1] ? ALUResultM : (ForwardBE[0] ? ResultW : RD2E);
endmodule