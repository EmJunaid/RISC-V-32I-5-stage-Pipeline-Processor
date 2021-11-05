`timescale 1ns/1ns
module pipeline_tb ();
    reg clk,rst;
    main zzz (clk,rst);

        initial clk=0;
        always #5 clk=~clk;

        initial begin
            rst = 1;

            #20

            rst = 0;
        end

    
endmodule