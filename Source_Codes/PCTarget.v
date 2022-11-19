`timescale 1ns/1ps

module PCTarget (
    input      [31:0] PCE,
    input      [31:0] ImmExtE,
    output reg [31:0] PCTargetE
);
    assign PCTargetE = PCE + ImmExtE;

endmodule