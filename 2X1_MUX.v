`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 06:46:41 PM
// Design Name: 
// Module Name: 2X1_MUX
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


module MUX_2X1#(parameter width=32)(
    input sel,
    input [width-1:0] in1,
    input [width-1:0] in2,
    output [width-1:0] out
    );
    
    assign out=(sel)? in2:in1;
endmodule
