module extend(input  		[24:0] Imm,
              input  		[2:0]  ImmSrcD,
              output reg 	[31:0] ImmExtD);
    always @(*)
    casex(ImmSrcD)
         // I?type
    3'b000:     ImmExtD = {{20{Imm[24]}}, Imm[24:13]};
        //Lw-Type
    //7'b0000011:     ImmExtD = {{20{Imm[24]}}, Imm[31:13]};
		 // S?type (stores)
    3'b001:     ImmExtD = {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};
         // B?type (branches)
    3'b010:      ImmExtD = {{20{Imm[24]}}, Imm[0],  Imm[23:18], Imm[4:1], 1'b0};                          // J?type (jal)
		// J?type (branches)
	3'b011:      ImmExtD = {{12{Imm[24]}}, Imm[12:5],  Imm[13], Imm[23:14], 1'b0};
	   // U?type
	3'b100:      ImmExtD = {Imm[24:5],12'b000000000000};
           
	default: 	ImmExtD = 32'dx; // undefined
    endcase
endmodule