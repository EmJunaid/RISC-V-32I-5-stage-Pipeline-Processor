`timescale 1ns/1ps

module Instruction_Memory (
    input      [31:0] PCF,
    output reg [31:0] instruction
);
    // reg [31:0] instructions_Value [31:0];   //maximum 32 instruction can be here
    reg [31:0] instructions_Value [255:0];  //maximum 256 instruction can be here

    initial begin
        $readmemh("instruction.mem", instructions_Value);
    end

    always @ (*) begin
        // instruction = instructions_Value[PCF/4];  // dividing will take more hardware resources
        instruction = instructions_Value[PCF[31:2]];  //instead, we can ignore the least 2 LSBs
    end

    
endmodule