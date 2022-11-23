`timescale 1ns/1ps

module hazard_unit (
    input      [4:0] Rs1E,
    input      [4:0] Rs2E,
    input      [4:0] RdM,
    input      [4:0] RdW,
    input      [4:0] Rs1D,
    input      [4:0] Rs2D,
    input      [4:0] RdE,
    input      [1:0] ResultSrcE,
    input            RegWriteM,
    input            RegWriteW,
    input            PCSrcE,
    output reg       StallF,
    output reg       StallD,
    output reg       FlushE,
    output reg       FlushD,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
);
    reg lwStall;

    always @(*) begin
        if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 0) ) begin
            ForwardAE = 2'b10;
        end
        else if ( ((Rs1E == RdW) && RegWriteW) && (Rs1E != 0) ) begin
            ForwardAE = 2'b01;
        end
        else begin
            ForwardAE = 2'b00;
        end
        
    end

    always @ (*) begin
        if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 0) ) begin
            ForwardBE = 2'b10;
        end
        else if ( ((Rs2E == RdW) && RegWriteW) && (Rs2E != 0) ) begin
            ForwardBE = 2'b01;
        end
        else begin
            ForwardBE = 2'b00;
        end
        
    end

    always @ (*) begin
        lwStall = (ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE)));
        StallD  = lwStall;
        FlushE  = lwStall | PCSrcE;
        StallF  = lwStall; 
        FlushD  = PCSrcE;
    end

endmodule