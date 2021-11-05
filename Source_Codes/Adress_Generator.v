`timescale 1ns/1ns
module Adress_Generator (
     input rst,clk,PCSrcE,
     //input PCFbar,
     //input [31:0] ImmExt,
     input [31:0] PCPlus4F,PCTargetE,
    output reg [31:0] PCF
);
    reg[31:0] PCFbar;
    always @(*) begin
            PCFbar <= PCSrcE?  PCF + PCTargetE : PCF + 4;
        end
    always @(posedge clk) begin
        if (rst)
            PCF <= 32'd0;
        else
            PCF <= PCFbar;    
    end 
    

endmodule