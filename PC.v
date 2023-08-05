`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:21:43 AM
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input reset,
    input [31:0] pc_input,
    output [31:0] pc_output
    );
    reg [31:0] pc_curr;
    always@(posedge clk, negedge reset)begin
        if(!reset)
           pc_curr<='b0;
        else
         pc_curr<=pc_input;
    end
    
    
      
    assign pc_output=pc_curr;
endmodule
