/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << B;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> A;
----------------------------------------------------------------------
| 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 if A>B else 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 if A=B else 0;
----------------------------------------------------------------------*/
module alu(
           input [31:0] SrcAE,SrcBE,  // ALU 32-bit Inputs
           input [4:0] ALUControlE,// ALU Selection
           input [2:0] funct3E,
           output[31:0] ALUResult, // ALU 32-bit Output
           output CarryOut, // Carry Out Flag
		   output reg ZeroE	// Zero Flag
    );
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    assign ALUResult = ALU_Result; // ALU out
    assign tmp = {1'b0,SrcAE} + {1'b0,SrcBE};
    assign CarryOut = tmp[32]; // Carryout flag
	//assign Zero = (ALU_Result == 0);  // Zero Flag ALU_Result
	always @(*)
	begin
	   case(funct3E)
	   3'b000: ZeroE <= SrcAE == SrcBE; //beq
	   3'b001: ZeroE <=  SrcAE != SrcBE; //bne
	   3'b100: ZeroE <=  SrcAE < SrcBE; //blt
	   3'b101: ZeroE <=  SrcAE > SrcBE; //bge
	   3'b110: ZeroE <=  SrcAE < SrcBE; //bltu
	   3'b111: ZeroE <=  SrcAE >= SrcBE; //bgeu
	   default : ZeroE <= 0;
	   endcase
	end
    always @(*)
    begin
        case(ALUControlE)
        5'b00000: ALU_Result = SrcAE + SrcBE ;
        5'b00001:  ALU_Result = SrcAE - SrcBE ;
        5'b00010: // Multiplication
           ALU_Result = SrcAE * SrcBE;
        5'b00011: // Division
           ALU_Result = SrcAE/SrcBE;
        5'b00100: // Logical shift left
           ALU_Result = SrcAE<<SrcBE;
         5'b00101: // Logical shift right
           ALU_Result = SrcAE>>SrcBE;
         5'b00110: // Rotate left
           ALU_Result = {SrcAE[30:0],SrcAE[31]};
         5'b00111: // Rotate right
           ALU_Result = {SrcAE[0],SrcAE[31:1]};
          5'b01000: //  Logical and
           ALU_Result = SrcAE & SrcBE;
          5'b01001: //  Logical or
           ALU_Result = SrcAE | SrcBE;
          5'b01010: //  Logical xor
           ALU_Result = SrcAE ^ SrcBE;
          5'b01011: //  Logical nor
           ALU_Result = ~(SrcAE | SrcBE);
          5'b01100: // Logical nand
           ALU_Result = ~(SrcAE & SrcBE);
          5'b01101: // Logical xnor
           ALU_Result = ~(SrcAE ^ SrcBE);
          5'b01110: // Greater comparison
           ALU_Result = (SrcAE>SrcBE)?32'd1:32'd0 ;
          5'b01111: // Equal comparison
            ALU_Result = (SrcAE==SrcBE)?32'd1:32'd0 ;
          5'b10000:
            ALU_Result =   SrcBE;
          default: ALU_Result = SrcAE + SrcBE ;
        endcase
    end
  
   
    //always @(*) begin
      //  Zero <= (ALUResult == 0);
    //end
endmodule
