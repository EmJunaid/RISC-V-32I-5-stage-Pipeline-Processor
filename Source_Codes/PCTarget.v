`timescale 1ns/1ns
module PCTarget (
    input [31:0] PCE,ImmExtE,
    output [31:0] PCTargetE
);
    assign PCTargetE = PCE + ImmExtE;

endmodule