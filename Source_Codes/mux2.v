module mux2_alu #(parameter WIDTH = 8) 
                    (input [WIDTH-1:0] RD2E, ImmExtE,
                       input              ALUSrcE,
                       output [WIDTH-1:0] SrcBE);
     assign SrcBE = ALUSrcE ?  ImmExtE:RD2E;
endmodule


// To call this module:
//  mux2_alu #(32)   mux(RegisterData, ImmValue, ContSelector, OutB);
