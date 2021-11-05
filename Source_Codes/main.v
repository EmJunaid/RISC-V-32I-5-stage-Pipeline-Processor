`timescale 1ns/1ns
module main (
    input clk,rst
);
    wire [31:0] instruction,PCF;
    wire [31:0] PCPlus4F,instrD,PCD,PCPlus4D;
    wire [4:0] A1,A2,RdD,RdW,RdE,RdM;
    wire [6:0] OP;
    wire [2:0] funct3,funct3E;
    wire funct7,WE3,RegWriteW,RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD,ZeroE,RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,PCSrcE;
    wire [24:0] Imm;
    wire [6:0] funct77;
    wire [31:0] ResultW,RD1,RD2;
    wire [31:0] ImmExtD;
    wire [2:0] ImmSrcD;
    wire [1:0] ResultSrcD,ResultSrcE,ResultSrcM,ResultSrcW;
    wire [3:0] ALUControlD,ALUControlE;
    wire [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E;
    wire [31:0] PCTargetE;
    wire [31:0] SrcBE;
    wire [31:0] ALUResult,ALUResultM,ALUResultW;
    wire [31:0] WriteDataM,PCPlus4M,PCPlus4W ;
    wire CarryOut,RegWriteM,MemWriteM;
    wire [31:0] ReadData,ReadDataW ;





    Adress_Generator AAB (.rst(rst),.clk(clk),.PCSrcE(PCSrcE),.PCPlus4F(PCPlus4F),.PCTargetE(PCTargetE),.PCF(PCF));
    Instruction_Memory AAA (.PCF(PCF),.instruction(instruction));
    first_register BBB (.clk(clk),.rst(rst),.instruction(instruction),.PCF(PCF),.PCPlus4F(PCPlus4F), .instrD(instrD), .PCD(PCD),.PCPlus4D(PCPlus4D));
    PCPlus4 CCC (.PCF(PCF), .PCPlus4F(PCPlus4F));
    Instruction_Fetch DDD (.instrD(instrD),.A1(A1),.A2(A2),.RdD(RdD),.OP(OP),.funct3(funct3),.funct7(funct7),.Imm(Imm),.funct77(funct77));
    Register_File EEE (.A1(A1),.A2(A2),.RdW(RdW),.ResultW(ResultW),.clk(clk),.RegWriteW(RegWriteW),.rst(rst),.RD1(RD1),.RD2(RD2));
    extend FFF (.Imm(Imm),.ImmSrcD(ImmSrcD),.ImmExtD(ImmExtD));
    Second_register GGG (.PCD(PCD), .ImmExtD(ImmExtD),.PCPlus4D(PCPlus4D),.RD1(RD1),.RD2(RD2),.RdD(RdD),.funct3(funct3),.rst(rst),.clk(clk),.RegWriteD(RegWriteD),.MemWriteD(MemWriteD),.JumpD(JumpD),.BranchD(BranchD),.ALUSrcD(ALUSrcD),.ZeroE(ZeroE),.ResultSrcD(ResultSrcD),.ALUControlD(ALUControlD),.RegWriteE(RegWriteE),.MemWriteE(MemWriteE),.JumpE(JumpE),.BranchE(BranchE),.ALUSrcE(ALUSrcE),.PCSrcE(PCSrcE),.ResultSrcE(ResultSrcE),.ALUControlE(ALUControlE),.PCE(PCE), .ImmExtE(ImmExtE),.PCPlus4E(PCPlus4E),.RD1E(RD1E),.RD2E(RD2E),.funct3E(funct3E),.RdE(RdE));
    PCTarget HHH (.PCE(PCE),.ImmExtE(ImmExtE),.PCTargetE(PCTargetE));
    mux2_alu #(32) mux (.RD2E(RD2E), .ImmExtE(ImmExtE),.ALUSrcE(ALUSrcE),.SrcBE(SrcBE));
    alu III (.RD1E(RD1E),.SrcBE(SrcBE),.ALUControlE(ALUControlE),.funct3E(funct3E),.ALUResult(ALUResult),.CarryOut(CarryOut),.ZeroE(ZeroE));
    third_register JJJ (.RD2E(RD2E),.ALUResult(ALUResult),.PCPlus4E(PCPlus4E),.RdE(RdE),.clk(clk),.rst(rst),.RegWriteE(RegWriteE),.MemWriteE(MemWriteE),.ResultSrcE(ResultSrcE),.ALUResultM(ALUResultM), .WriteDataM(WriteDataM), .PCPlus4M(PCPlus4M),.RdM(RdM),.RegWriteM(RegWriteM),.MemWriteM(MemWriteM),.ResultSrcM(ResultSrcM));
    Data_Memory KKK (.WriteDataM(WriteDataM),.ALUResultM(ALUResultM),.clk(clk),.MemWriteM(MemWriteM),.rst(rst),.ReadData(ReadData));
    fourth_register LLL (.ALUResultM(ALUResultM),.ReadData(ReadData),.PCPlus4M(PCPlus4M),.RdM(RdM),.rst(rst),.clk(clk),.RegWriteM(RegWriteM),.ResultSrcM(ResultSrcM),.ALUResultW(ALUResultW),.ReadDataW(ReadDataW),.PCPlus4W(PCPlus4W),.RdW(RdW),.ResultSrcW(ResultSrcW),.RegWriteW(RegWriteW));
    mux3 #(32) mux1 (.ALUResultW(ALUResultW), .ReadDataW(ReadDataW), .PCPlus4W(PCPlus4W),.ResultSrcW(ResultSrcW),.ResultW(ResultW));
    Controller ZZZ (.OP(OP),.funct77(funct77),.funct3(funct3),.funct7(funct7),.MemWriteD(MemWriteD),.ALUSrcD(ALUSrcD),.RegWriteD(RegWriteD),.BranchD(BranchD),.JumpD(JumpD),.ResultSrcD(ResultSrcD),.ALUControlD(ALUControlD),.ImmSrcD(ImmSrcD));
endmodule