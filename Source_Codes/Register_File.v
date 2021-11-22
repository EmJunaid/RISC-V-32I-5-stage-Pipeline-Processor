`timescale 1ns/1ns
module Register_File (
    input [4:0] A1,A2,RdW,
    input [31:0] ResultW,
    input clk,RegWriteW,rst,
    output reg [31:0] RD1,RD2,
    output reg [31:0] checkx1,checkx2,checkx3,checkx4,checkx5,checkx6
   // output reg [31:0] check_x4
);
    reg [31:0] Registers[31:0];
    integer i;
    always @(*) begin
        Registers[28] <= 32'd6;
        Registers[22] <= 32'd4;
        Registers[18] <= 32'd6;
        //Registers[31] <= 32'd1;
       // Registers[24] <= 32'd6;
       // Registers[7] <= 32'd3;
        //Registers[22] <= 32'd4;
        //Registers[4] <= 32'd4;
        
        RD1 <= Registers[A1];
        RD2 <= Registers[A2];
        //checkx1 <= Registers[1];
        //checkx2 <= Registers[2];
        //checkx3 <= Registers[3];
        //checkx4 <= Registers[4];
        //checkx5 <= Registers[5];
        //checkx6 <= Registers[6];
        checkx1 <= Registers[1];
        checkx2 <= Registers[2];
        checkx3 <= Registers[3];
        checkx4 <= Registers[19];
        checkx5 <= Registers[5];
        checkx6 <= Registers[6];
        
    end
    always @(negedge clk) begin
        if (rst) begin
            for(i=0;i<32;i=i+1)
                Registers[i]<=32'd0;
        end else if (RegWriteW) begin
            Registers[RdW]<=ResultW;
            end
    end
    
endmodule