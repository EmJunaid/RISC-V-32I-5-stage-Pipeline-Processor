`timescale 1ns/1ns
module third_register (
    input [31:0] WriteDataE,ALUResult,PCPlus4E,
    input [4:0] RdE,
    input clk,rst,RegWriteE,MemWriteE,
    input [1:0] ResultSrcE,
    output reg [31:0] ALUResultM, WriteDataM, PCPlus4M,
    output reg [4:0] RdM,
    output reg RegWriteM,MemWriteM,
    output reg [1:0] ResultSrcM
);
    always @(posedge clk) begin
        if (rst) begin
           RegWriteM <= 0;
           MemWriteM <= 0;
           ResultSrcM <= 2'b00;
           ALUResultM <= 32'd0;
           WriteDataM <= 32'd0;
           RdM <= 5'd0;
           PCPlus4M <= 32'd0;
        end
        else begin
           RegWriteM <= RegWriteE;
           MemWriteM <= MemWriteE;
           ResultSrcM <= ResultSrcE;
           ALUResultM <= ALUResult;
           WriteDataM <= WriteDataE;
           RdM <= RdE;
           PCPlus4M <= PCPlus4E;
        end
    end
    
endmodule