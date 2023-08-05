`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 06:41:25 PM
// Design Name: 
// Module Name: shf_left_twice
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


module shf_left_twice#(parameter Data_width=32)(
    input [Data_width-1:0] in,
    output [Data_width-1:0] out
    );
    
    assign out=in<<2;
endmodule
