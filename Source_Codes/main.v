`timescale 1ns/1ps

module main (
    input clk,
    input rst,

    //checkx1 ... upto checkx6 are used to check the contents of RF register
    //for example: x1, x2 upto x6.
    //If you simulator has a support to see contents of RF and DM then
    //you can remove all of the following outputs
    //Like QuetaSim can help you see the contents of RF and DM

    output wire [31:0] checkx1,
    output wire [31:0] checkx2,
    output wire [31:0] checkx3,
    output wire [31:0] checkx4,
    output wire [31:0] checkx5,
    output wire [31:0] checkx6,
    output wire [31:0] DM0,
    output wire [31:0] instruction
);
    wire [31:0] PCF;
    wire [31:0] PCPlus4F, instrD, PCD, PCPlus4D, SrcAE;
    wire [4:0]  A1, A2, RdD, RdW, RdE, RdM, Rs1E, Rs2E, Rs1D, Rs2D;
    wire [6:0]  OP;
    wire [2:0]  funct3, funct3E;
    wire        funct7;
    wire        WE3;
    wire        RegWriteW;
    wire        RegWriteD;
    wire        MemWriteD;
    wire        JumpD;
    wire        BranchD;
    wire        ALUSrcD;
    wire        ZeroE;
    wire        RegWriteE;
    wire        MemWriteE, JumpE, BranchE, ALUSrcE, PCSrcE;

    wire [24:0] Imm;
    wire [6:0]  funct77;
    wire [31:0] ResultW, RD1, RD2;
    wire [31:0] ImmExtD;
    wire [2:0]  ImmSrcD;
    wire [1:0]  ResultSrcD, ResultSrcE, ResultSrcM, ResultSrcW;
    wire [4:0]  ALUControlD, ALUControlE;
    wire [31:0] RD1E, RD2E, PCE, ImmExtE, PCPlus4E;
    wire [31:0] PCTargetE;
    wire [31:0] SrcBE;
    wire [31:0] ALUResult, ALUResultM, ALUResultW;
    wire [31:0] WriteDataM, PCPlus4M, PCPlus4W;
    wire        CarryOut, RegWriteM, MemWriteM;
    wire [31:0] ReadData, ReadDataW, WriteDataE ;
    wire [1:0]  ForwardAE, ForwardBE;
    wire        StallF, StallD, FlushE, FlushD;
                //multiple signals at one line are just to reduce the space




    Adress_Generator i_ag (
        .rst      (rst      ),
        .clk      (clk      ),
        .PCSrcE   (PCSrcE   ),
        .StallF   (StallF   ),
        .PCPlus4F (PCPlus4F ),
        .PCTargetE(PCTargetE),
        .PCF      (PCF      )
    );

    Instruction_Memory i_im (
        .PCF        (PCF        ),
        .instruction(instruction)
    );

    first_register i_1 (
        .clk        (clk        ),
        .rst        (rst        ),
        .StallD     (StallD     ),
        .FlushD     (FlushD     ),
        .instruction(instruction),
        .PCF        (PCF        ),
        .PCPlus4F   (PCPlus4F   ),
        .instrD     (instrD     ),
        .PCD        (PCD        ),
        .PCPlus4D   (PCPlus4D   )
    );

    PCPlus4 i_pcp4 (
        .PCF     (PCF     ),
        .PCPlus4F(PCPlus4F)
    );

    Instruction_Fetch i_iff (
        .instrD (instrD ),
        .A1     (A1     ),
        .A2     (A2     ),
        .RdD    (RdD    ),
        .Rs1D   (Rs1D   ),
        .Rs2D   (Rs2D   ),
        .OP     (OP     ),
        .funct3 (funct3 ),
        .funct7 (funct7 ),
        .Imm    (Imm    ),
        .funct77(funct77)
    );

    Register_File i_rf (
        .A1       (A1       ),
        .A2       (A2       ),
        .RdW      (RdW      ),
        .ResultW  (ResultW  ),
        .clk      (clk      ),
        .RegWriteW(RegWriteW),
        .rst      (rst      ),
        .RD1      (RD1      ),
        .RD2      (RD2      ),
        .checkx1  (checkx1  ),
        .checkx2  (checkx2  ),
        .checkx3  (checkx3  ),
        .checkx4  (checkx4  ),
        .checkx5  (checkx5  ),
        .checkx6  (checkx6  )
    );

    sign_extend i_se (
        .Imm    (Imm    ),
        .ImmSrcD(ImmSrcD),
        .ImmExtD(ImmExtD)
    );

    Second_register i_2 (
        .PCD         (PCD        ),
        .ImmExtD     (ImmExtD    ),
        .PCPlus4D    (PCPlus4D   ),
        .RD1         (RD1        ),
        .RD2         (RD2        ),
        .RdD         (RdD        ),
        .Rs1D        (Rs1D       ),
        .Rs2D        (Rs2D       ),
        .funct3      (funct3     ),
        .rst         (rst        ),
        .clk         (clk        ),
        .RegWriteD   (RegWriteD  ),
        .MemWriteD   (MemWriteD  ),
        .JumpD       (JumpD      ),
        .BranchD     (BranchD    ),
        .ALUSrcD     (ALUSrcD    ),
        .ZeroE       (ZeroE      ),
        .FlushE      (FlushE     ),
        .ResultSrcD  (ResultSrcD ),
        .ALUControlD (ALUControlD),
        .RegWriteE   (RegWriteE  ),
        .MemWriteE   (MemWriteE  ),
        .JumpE       (JumpE      ),
        .BranchE     (BranchE    ),
        .ALUSrcE     (ALUSrcE    ),
        .PCSrcE      (PCSrcE     ),
        .ResultSrcE  (ResultSrcE ),
        .ALUControlE (ALUControlE),
        .PCE         (PCE        ),
        .ImmExtE     (ImmExtE    ),
        .PCPlus4E    (PCPlus4E   ),
        .RD1E        (RD1E       ),
        .RD2E        (RD2E       ),
        .funct3E     (funct3E    ),
        .RdE         (RdE        ),
        .Rs1E        (Rs1E       ),
        .Rs2E        (Rs2E       )
    );

    PCTarget i_pct (
        .PCE       (PCE      ),
        .ImmExtE   (ImmExtE  ),
        .PCTargetE (PCTargetE)
    );

    mux2_alu #(32) mux_scrb (
        .WriteDataE (WriteDataE),
        .ImmExtE    (ImmExtE   ),
        .ALUSrcE    (ALUSrcE   ),
        .SrcBE      (SrcBE     )
    );

    alu i_alu (
        .SrcAE       (SrcAE      ),
        .SrcBE       (SrcBE      ),
        .ALUControlE (ALUControlE),
        .funct3E     (funct3E    ),
        .ALUResult   (ALUResult  ),
        .CarryOut    (CarryOut   ),
        .ZeroE       (ZeroE      )
    );

    third_register i_3 (
        .WriteDataE (WriteDataE),
        .ALUResult  (ALUResult ),
        .PCPlus4E   (PCPlus4E  ),
        .RdE        (RdE       ),
        .clk        (clk       ),
        .rst        (rst       ),
        .RegWriteE  (RegWriteE ),
        .MemWriteE  (MemWriteE ),
        .ResultSrcE (ResultSrcE),
        .ALUResultM (ALUResultM),
        .WriteDataM (WriteDataM),
        .PCPlus4M   (PCPlus4M  ),
        .RdM        (RdM       ),
        .RegWriteM  (RegWriteM ),
        .MemWriteM  (MemWriteM ),
        .ResultSrcM (ResultSrcM)
    );

    Data_Memory i_dm (
        .WriteDataM (WriteDataM),
        .ALUResultM (ALUResultM),
        .clk        (clk       ),
        .MemWriteM  (MemWriteM ),
        .rst        (rst       ),
        .ReadData   (ReadData  ),
        .DM0        (DM0       )
    );

    fourth_register i_4 (
        .ALUResultM (ALUResultM),
        .ReadData   (ReadData  ),
        .PCPlus4M   (PCPlus4M  ),
        .RdM        (RdM       ),
        .rst        (rst       ),
        .clk        (clk       ),
        .RegWriteM  (RegWriteM ),
        .ResultSrcM (ResultSrcM),
        .ALUResultW (ALUResultW),
        .ReadDataW  (ReadDataW ),
        .PCPlus4W   (PCPlus4W  ),
        .RdW        (RdW       ),
        .ResultSrcW (ResultSrcW),
        .RegWriteW  (RegWriteW )
    );
    mux3 #(32) mux1 (
        .ALUResultW (ALUResultW),
        .ReadDataW  (ReadDataW ),
        .PCPlus4W   (PCPlus4W  ),
        .ResultSrcW (ResultSrcW),
        .ResultW    (ResultW   )
    );

    Controller i_c (
        .OP          (OP         ),
        .funct77     (funct77    ),
        .funct3      (funct3     ),
        .funct7      (funct7     ),
        .MemWriteD   (MemWriteD  ),
        .ALUSrcD     (ALUSrcD    ),
        .RegWriteD   (RegWriteD  ),
        .BranchD     (BranchD    ),
        .JumpD       (JumpD      ),
        .ResultSrcD  (ResultSrcD ),
        .ALUControlD (ALUControlD),
        .ImmSrcD     (ImmSrcD    )
    );

    hazard_unit i_hu (
        .Rs1E      (Rs1E      ),
        .Rs2E      (Rs2E      ),
        .RdM       (RdM       ),
        .RdW       (RdW       ),
        .Rs1D      (Rs1D      ),
        .Rs2D      (Rs2D      ),
        .RdE       (RdE       ),
        .ResultSrcE(ResultSrcE),
        .RegWriteM (RegWriteM ),
        .RegWriteW (RegWriteW ),
        .PCSrcE    (PCSrcE    ),
        .StallF    (StallF    ),
        .StallD    (StallD    ),
        .FlushE    (FlushE    ),
        .FlushD    (FlushD    ),
        .ForwardAE (ForwardAE ),
        .ForwardBE (ForwardBE )
    );

    mux5 #(32) muxxx (
        .RD1E      (RD1E      ),
        .ResultW   (ResultW   ),
        .ALUResultM(ALUResultM),
        .ForwardAE (ForwardAE ),
        .SrcAE     (SrcAE     )
    );

    mux4 #(32) muxxxxx (
        .RD2E      (RD2E      ),
        .ResultW   (ResultW   ),
        .ALUResultM(ALUResultM),
        .ForwardBE (ForwardBE ),
        .WriteDataE(WriteDataE)
    );
endmodule