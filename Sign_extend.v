`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 06:35:54 PM
// Design Name: 
// Module Name: Sign_extend
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


module Sign_extend(
    input [15:0] Instr,
    output [31:0] SignImm
    );
    
    assign SignImm={{16{Instr[15]}},Instr};
endmodule
