`timescale 1ns/1ps

module Data_Memory (
    input      [31:0] WriteDataM,
    input      [31:0] ALUResultM,
    input             clk,
    input             MemWriteM,
    input             rst,
    output reg [31:0] ReadData,
    output reg [31:0] DM0
);

    reg [31:0] Data_Mem [255:0];   //2D array for data memory
    integer i;

    always @(*) begin
        ReadData = Data_Mem[ALUResultM];
    end

    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 255;i = i + 1) begin
                Data_Mem[i] <= 32'd0;
            end
        end else if (MemWriteM && |ALUResultM) begin   //|ALUResultM is to avoid writing at x0
            Data_Mem[ALUResultM] <= WriteDataM; 
        end
    end    
    
endmodule
