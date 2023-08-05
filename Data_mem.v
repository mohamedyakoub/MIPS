`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 11:02:58 AM
// Design Name: 
// Module Name: reg_file
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


module Data_mem(
    input clk,reset,
    input w_en,
    input [31:0] addr,
    input [31:0] w_data,
    output [31:0] r_data,
    output [31:0] test_value
    );
    integer i;
    reg [31:0] mem [0:99];
    always@(posedge clk, negedge reset) begin
     if(!reset)
        for(i=0;i<100;i=i+1)
           mem[i]='b0;
     else 
        if(w_en)
            mem[addr]<=w_data;
     
    end
    assign r_data=mem[addr];
    assign test_value=mem[0];
endmodule
