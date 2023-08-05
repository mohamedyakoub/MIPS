`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:08:34 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALU_control,
    output zero_flag,
    output [31:0] ALU_result
    );
    reg [31:0] result;
    parameter[2:0]       And=3'b000,
                         Or= 3'b001,
                         Plus=3'b010,
                         Min=3'b100,
                         Mul=3'b101,
                         Less=3'b110;
    always@(*)begin
    
    case(ALU_control)
        And: result=SrcA & SrcB;
        Or:  result=SrcA | SrcB;
        Plus:result=SrcA + SrcB;
        Min: result=SrcA - SrcB;
        Mul: result=SrcA * SrcB;
        Less:result=(SrcA < SrcB);
        default: result=0;
        
    endcase
    end
    
    assign ALU_result=result;
    assign zero_flag= (ALU_result==0);
endmodule
