`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 09:36:19 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );
        reg clk,reset;
wire [31:0] test_value;
    MIPS_top mips(
     clk,
     reset,
     test_value
    );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
   initial begin
   reset=1;
   #(2*T);
   reset=0;
   #(2*T);
   reset=1;
   #T;
   end 
endmodule
