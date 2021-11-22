`timescale 1ns/1ns
module Controller (
    input [6:0] OP,funct77,
    input [2:0] funct3,
    input funct7,
    output reg MemWriteD,ALUSrcD,RegWriteD,BranchD,JumpD, //PCSrc
    output reg [1:0] ResultSrcD,
    output reg [4:0] ALUControlD,
    output reg [2:0] ImmSrcD
);
    
    wire [16:0] checker;
    assign checker={{OP},{funct3},{funct77}};
    //reg Branch;
    reg [1:0] ALUOp;
    always @(*) begin
        casex (OP)
            7'b0000011: begin  //lw
                BranchD <= 0;
                ResultSrcD <= 2'b01;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 1;
                RegWriteD <= 1;   //WE3
                ALUOp <= 2'b00;
                ImmSrcD <= 3'b000;
                JumpD <= 0;
            end 

            7'b0100011:begin  //sw
                BranchD <= 0;
                ResultSrcD <= 2'bxx;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 1;  //WE
                ALUSrcD <= 1;
                RegWriteD <= 0;   //WE3
                ALUOp <= 2'b00;
                ImmSrcD <= 3'b001;
                JumpD <= 0;
            end

            7'b0110011:begin  //R-type
                BranchD <= 0;
                ResultSrcD <= 2'b00;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 0;
                RegWriteD <= 1;   //WE3
                ALUOp <= 2'b10;
                ImmSrcD <= 3'bxxx;
                JumpD <= 0;
            end

            7'b1100011:begin  //branch
                BranchD <= 1;
                ResultSrcD <= 2'bxx;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 0;
                RegWriteD <= 0;   //WE3
                ALUOp <= 2'b01;
                ImmSrcD <= 3'b010;
                JumpD <= 0;
            end

            7'b0010011:begin  //I-Type
                BranchD <= 0;
                ResultSrcD <= 2'b00;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 1;
                RegWriteD <= 1;   //WE3
                ALUOp <= 2'b10;
                ImmSrcD <= 3'b000;
                JumpD <= 0;
            end
            7'b1101111:begin //j
                BranchD <= 0;
                ResultSrcD <= 2'b10;
                //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 1'bx;
                RegWriteD <= 1;   //WE3
                ALUOp <= 2'bxx;
                ImmSrcD <= 3'b011;
                JumpD <= 1;
            end
            /*7'b0110111:begin //U-type
                BranchD <= 0;
                WE3 <= 1;
                ImmSrc <= 3'b100;
                ALUSrc <= 1;
                WE <= 0;
                ResultSrc <= 0;
                ALUOp <= 2'b00;
            end  */  
                
            default:begin
                BranchD <= 0;
                ResultSrcD <= 2'b00;
              //PCSrc <= Zero && Branch;
                MemWriteD <= 0;  //WE
                ALUSrcD <= 1'bx;
                RegWriteD <= 0;   //WE3
                ALUOp <= 2'b00;
                ImmSrcD <= 3'b000;
                JumpD <= 0;
            end 
            
        endcase
        
    end
    // always @(*) begin
    //     PCSrc <= Zero && Branch;     
    // end

    always @(*) begin
        // case ({ALUOp,funct3,OP[5],funct7})
        //     7'b00xxxxx: ALUControl <= 4'b0000;
        //     7'b01xxxxx: ALUControl <= 4'b0001;
        //     7'b1000000 || 7'b1000001 || 7'b1000010: ALUControl <= 4'b0000;
        //     7'b1000011: ALUControl <= 4'b0001;
        //     7'b10010xx: ALUControl <=  
        //     default: 
        // endcase
        casex (checker)
            17'b01100110000000000: ALUControlD <= 5'b00000;
            17'b01100110000100000: ALUControlD <= 5'b00001;
            17'b01100110000000001: ALUControlD <= 5'b00010;
            17'b01100111000000001: ALUControlD <= 5'b00011;
            17'b01100111100000001: ALUControlD <= 5'b00000;//rem defined wrong
            17'b01100111110000000: ALUControlD <= 5'b01000;
            17'b01100111100000000: ALUControlD <= 5'b01001;
            17'b01100111000000000: ALUControlD <= 5'b01010;
            17'b01100110010000000: ALUControlD <= 5'b00100; //sll,logical shift left
            17'b01100111010000000: ALUControlD <= 5'b00101; //srl,logical shift right
            17'b0010011000xxxxxxx: ALUControlD <= 5'b00000;
            17'b11000110001111111: ALUControlD <= 5'b00001; //beq
            17'b1100011001xxxxxxx: ALUControlD <= 5'b00001;
            17'b0000011010xxxxxxx: ALUControlD <= 5'b00000;
            17'b0100011010xxxxxxx: ALUControlD <= 5'b00000; 
            17'b0110111xxxxxxxxxx: ALUControlD <= 5'b10000; //U-type
            default: ALUControlD <= 5'b00000;
        endcase
        
    end
endmodule