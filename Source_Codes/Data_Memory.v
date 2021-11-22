`timescale 1ns/1ns
module Data_Memory (
    input [31:0] WriteDataM,
    input [31:0] ALUResultM,
    input clk,MemWriteM,rst,
    output reg [31:0] ReadData,
    output reg [31:0] DM0
);
    reg [31:0] Data_Mem [255:0];
    integer i;
    always @(*) begin
        //ReadData <= {Data_Mem[A],Data_Mem[A+1],Data_Mem[A+2],Data_Mem[A+3]};
        ReadData <= Data_Mem[ALUResultM];
    end
    always @(posedge clk) begin
        if (rst) begin
            for(i=0;i<255;i=i+1)
                Data_Mem[i] <= 32'd0;
        end else if (MemWriteM) begin
            //{Data_Mem[A],Data_Mem[A+1],Data_Mem[A+2],Data_Mem[A+3]} <= WD;
            Data_Mem[ALUResultM] <= WriteDataM; 
        end
    end
    always @(*) begin
               DM0 <= Data_Mem[32'h0];
    //         DM4 <= Data_Mem[32'h4];
    //         DM8 <= Data_Mem[32'h8];
         end
    
    
endmodule
