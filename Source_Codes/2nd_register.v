`timescale 1ns/1ns
module Second_register (
    input [31:0] PCD, ImmExtD,PCPlus4D,RD1,RD2,
    input [4:0] RdD,
    input [2:0] funct3,
    input rst,clk,RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD,ZeroE,
    input [1:0] ResultSrcD,
    input [3:0] ALUControlD,
    output reg RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,PCSrcE,
    output reg [1:0] ResultSrcE,
    output reg [3:0] ALUControlE,
    output reg [31:0] PCE, ImmExtE,PCPlus4E,RD1E,RD2E,
    output reg [2:0] funct3E,
    output reg [4:0] RdE
);
    always @(posedge clk) begin
        if (rst) begin
            RegWriteE <= 0;
            MemWriteE <= 0;
            JumpE <= 0;
            BranchE <= 0;
            ALUSrcE <= 0;
            ResultSrcE <= 2'b00;
            ALUControlE <= 4'b0000;
            PCE <= 32'd0;
            ImmExtE <= 32'd0;
            PCPlus4E <= 32'd0;
            RD1E <= 32'd0;
            RD2E <= 32'd0;
            funct3E <= 3'd0;
            RdE <= 5'd0;
        end
        else begin
            RegWriteE <= RegWriteD;
            MemWriteE <= MemWriteD;
            JumpE <= JumpD;
            BranchE <= BranchD;
            ALUSrcE <= ALUSrcD;
            ResultSrcE <= ResultSrcD;
            ALUControlE <= ALUControlD;
            PCE <= PCD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
            RD1E <= RD1;
            RD2E <= RD2;
            funct3E <= funct3;
            RdE <= RdD;
        end
        
    end
    always @(posedge clk) begin
        PCSrcE <= (ZeroE && BranchE) || JumpE;
    end
    
endmodule