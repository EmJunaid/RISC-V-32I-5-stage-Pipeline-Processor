`timescale 1ns/1ps

module Adress_Generator (
    input             rst,
    input             clk,
    input             PCSrcE,
    input             StallF,

    input      [31:0] PCPlus4F,
    input      [31:0] PCTargetE,
    output reg [31:0] PCF
);
    reg [31:0] PCFbar;

    always @ (*) begin  //combinational block so block assignment (=) and not a non-blocking one (<=)
            PCFbar = PCSrcE ? PCTargetE : PCF + 4;
    end

    always @(posedge clk) begin //sequential block so non-block assigment (<=) is used
        if (rst) begin
            PCF <= 32'd0;
        end

        else if(StallF) begin
             PCF <= PCF;   
        end

        else begin
            PCF <= PCFbar;
        end
    end 
    

endmodule