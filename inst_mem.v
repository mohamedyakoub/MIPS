`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:51:27 AM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
    input [31:0] PC,
    output [31:0] Instr
    );
    
     reg [31:0] mem [0:99] ;
     initial
        $readmemh("mem.mem",mem);
     
     assign Instr = mem[PC>>2];
     endmodule
