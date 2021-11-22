module mux #(parameter WIDTH = 8)
                      (input [WIDTH-1:0] RD2, ImmExt,
                       input              ALUSrc,
                       output [WIDTH-1:0] SrcB);
     assign SrcB = ALUSrc ?  ImmExt:RD2;
endmodule