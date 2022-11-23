`timescale 1ns/1ps

module Register_File (
    input      [4:0]  A1,
    input      [4:0]  A2,
    input      [4:0]  RdW,
    input      [31:0] ResultW,
    input             clk,
    input             RegWriteW,
    input             rst,
    output reg [31:0] RD1,
    output reg [31:0] RD2,
    output reg [31:0] checkx1,  //it is to see x1 of register file (you can ignore it if your simulator allows you to see full RF)
    output reg [31:0] checkx2,
    output reg [31:0] checkx3,
    output reg [31:0] checkx4,
    output reg [31:0] checkx5,
    output reg [31:0] checkx6

);
    reg [31:0] Registers[31:0];
    integer i;

    always @(*) begin
        Registers[28] = 32'd6;
        Registers[22] = 32'd4;
        Registers[18] = 32'd6;

        
        RD1 = Registers[A1];
        RD2 = Registers[A2];

        checkx1 = Registers[1];
        checkx2 = Registers[2];
        checkx3 = Registers[3];
        checkx4 = Registers[19];
        checkx5 = Registers[5];
        checkx6 = Registers[6];
        
    end

    always @(negedge clk) begin
        if (rst) begin
            for(i = 0; i < 32;i = i + 1) begin
                Registers[i] <= 32'd0;
            end

        end else if (RegWriteW && (|RdW)) begin    //|RdW, avoid writing at x0
            Registers[RdW] <= ResultW;
        end
    end
    
endmodule