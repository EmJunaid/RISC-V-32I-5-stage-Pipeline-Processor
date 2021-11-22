`timescale 1ns/1ns
module Instruction_Memory (
    input [31:0] PCF,
    output reg [31:0] instruction
);
    reg [31:0] instructions_Value[31:0];

    initial begin
       $readmemh("instruction.mem", instructions_Value);

       
            //instructions_Value[0] <= 32'h00000000;
            //instructions_Value[1] <= 32'h00a08093;
            //instructions_Value[2] <= 32'h01410113;
            //instructions_Value[3] <= 32'h002081b3;
            //instructions_Value[4] <= 32'h02800213;
            //instructions_Value[5] <= 32'h002082B3;
            //instructions_Value[6] <= 32'h00102023;
           // instructions_Value[7] <= 32'h00402303;
           // instructions_Value[0] <= 32'h00000000;
            //instructions_Value[1] <= 32'h015a0c33;
            //instructions_Value[2] <= 32'h413c0933;
            //instructions_Value[3] <= 32'h018fecb3;
            //instructions_Value[4] <= 32'h007c7bb3;
            //instructions_Value[5] <= 32'h002082B3;
            
           // instructions_Value[0] <= 32'h00a00513;
            //instructions_Value[1] <= 32'h00a00093;
            //instructions_Value[2] <= 32'h00a00113;
            //instructions_Value[3] <= 32'hfe208ae3;
            //instructions_Value[4] <= 32'h01400513;
         /*   
         
         instructions_Value[0] <= 32'h00000000;
         //instructions_Value[1] <= 32'h00000417;  //32'h00000417
         //instructions_Value[2] <= 32'h00042403;
         instructions_Value[1] <= 32'h01e50513;//32'h00550513; //00550513
         instructions_Value[2] <= 32'h00f58593;//32'h00a58593;
         instructions_Value[3] <= 32'h00060613;
         instructions_Value[4] <= 32'h00068693;
         instructions_Value[5] <= 32'h00170713;
         instructions_Value[6] <= 32'h01f78793;
         instructions_Value[7] <= 32'h02d61c63;
         instructions_Value[8] <= 32'h40b508b3;
         instructions_Value[9] <= 32'h00f8d8b3;
         instructions_Value[10] <= 32'h00e8c8b3;
         instructions_Value[11] <= 32'h00d89a63;
         instructions_Value[12] <= 32'h00a68833;
         instructions_Value[13] <= 32'h00b68533;
         instructions_Value[14] <= 32'h010685b3;
         instructions_Value[15] <= 32'hfed680e3;
         instructions_Value[16] <= 32'h00d59663;
         instructions_Value[17] <= 32'h00160613;
         instructions_Value[18] <= 32'hfcd68ae3;
         instructions_Value[19] <= 32'h40b50533;
         instructions_Value[20] <= 32'hfcd686e3;
         instructions_Value[21] <= 32'h00a688b3;*/
end
begin
/*
    always @(*) begin
        case (PC)
            32'd4:instruction=instructions_Value[1];
            32'd8:instruction=instructions_Value[2];
            32'd12:instruction=instructions_Value[3];
            32'd16:instruction=instructions_Value[4];
            32'd20:instruction=instructions_Value[5];
            32'd24:instruction=instructions_Value[6];
            32'd28:instruction=instructions_Value[7];
            32'd32:instruction=instructions_Value[8];
            32'd36:instruction=instructions_Value[9];
            32'd40:instruction=instructions_Value[10];
            32'd44:instruction=instructions_Value[11];
            32'd48:instruction=instructions_Value[12];
            32'd52:instruction=instructions_Value[13];
            32'd56:instruction=instructions_Value[14];
            32'd60:instruction=instructions_Value[15];
            32'd64:instruction=instructions_Value[16];
            32'd68:instruction=instructions_Value[17];
            32'd72:instruction=instructions_Value[18];
            32'd76:instruction=instructions_Value[19];
            32'd80:instruction=instructions_Value[20];
            32'd84:instruction=instructions_Value[21];
            32'd88:instruction=instructions_Value[22];
            32'd92:instruction=instructions_Value[23];
            default:instruction=instructions_Value[0];
        endcase 
        */  
        
    end
    
    always@(*) begin
    instruction = instructions_Value[PCF/4];
    end

    
endmodule