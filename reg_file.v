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


module reg_file(
    input clk,reset,
    input w_en,
    input [4:0] w_addr,
    input [31:0] w_data,
    input [4:0] r_addr1,
    input [4:0] r_addr2,
    output [31:0] r_data1,
    output [31:0] r_data2
    );
    integer i;
    reg [31:0] mem [0:99];
    always@(posedge clk, negedge reset) begin
     if(!reset)
        for(i=0;i<100;i=i+1)
           mem[i]='b0;
     else 
        if(w_en)
            mem[w_addr]<=w_data;
     
    end
    assign r_data1=mem[r_addr1];
    assign r_data2=mem[r_addr2];
endmodule
