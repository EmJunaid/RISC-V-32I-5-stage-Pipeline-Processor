`timescale 1ns/1ps

module Instruction_Fetch (
    input      [31:0] instrD,
    output reg [4:0]  A1,
    output reg [4:0]  A2,
    output reg [4:0]  RdD,
    output reg [4:0]  Rs1D,
    output reg [4:0]  Rs2D,
    output reg [6:0]  OP,
    output reg [2:0]  funct3,
    output reg        funct7,
    output reg [24:0] Imm,
    output reg [6:0]  funct77
);
    always @ (*) begin
        A1      = instrD[19:15];
        A2      = instrD[24:20];
        RdD     = instrD[11:7];
        OP      = instrD[6:0];
        funct3  = instrD[14:12];
        funct7  = instrD[30];
        Imm     = instrD[31:7];
        funct77 = instrD[31:25];
        Rs1D    = instrD[19:15];
        Rs2D    = instrD[24:20];
    end
    
endmodule
