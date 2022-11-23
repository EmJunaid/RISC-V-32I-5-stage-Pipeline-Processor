module mux5 #
(    
     parameter WIDTH = 8
)(
     input  [WIDTH-1:0] RD1E, 
     input  [WIDTH-1:0] ResultW, 
     input  [WIDTH-1:0] ALUResultM,
     input  [1:0]       ForwardAE,
     output [WIDTH-1:0] SrcAE
);
     assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);
endmodule