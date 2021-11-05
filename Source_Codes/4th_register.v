`timescale 1ns/1ns
module fourth_register (
    input [31:0] ALUResultM,ReadData,PCPlus4M,
    input [4:0] RdM,
    input rst,clk,RegWriteM,
    input [1:0] ResultSrcM,
    output reg [31:0] ALUResultW,ReadDataW,PCPlus4W,
    output reg [4:0] RdW,
    output reg [1:0] ResultSrcW,
    output reg RegWriteW
);
    always @(posedge clk) begin
        if(rst) begin
            ALUResultW <= 32'd0;
            ReadDataW <= 32'd0;
            PCPlus4W <= 32'd0;
            RdW <= 5'd0;
            ResultSrcW <= 2'd0;
            RegWriteW <= 0; 
        end
        else begin
            ALUResultW <= ALUResultM;
            ReadDataW <= ReadData;
            PCPlus4W <= PCPlus4M;
            RdW <= RdM;
            ResultSrcW <= ResultSrcM;
            RegWriteW <= RegWriteM; 
        end

    end
    
endmodule