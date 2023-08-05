`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 06:05:02 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] Funct,
    input [5:0] Op_code,
    output reg [2:0] ALU_control,
    output reg jump,
    output reg Memtoreg,
    output reg Mem_write,
    output reg Branch,
    output reg ALU_src,
    output reg Reg_dst,
    output reg Reg_write
    );
    reg [1:0] ALU_op;
    
    
    always@(*)begin
        jump=0;
        Memtoreg=0;
        Mem_write=0;
        Branch=0;
        ALU_src=0;
        Reg_dst=0;
        Reg_write=0;
        ALU_op=0;
        case(Op_code)
        
            6'b10_0011:begin //load Word
                Reg_write=1;
                ALU_src=1;
                Memtoreg=1;
            end
            
            6'b10_1011:begin //storeWord
                Mem_write=1;
                ALU_src=1;
                Memtoreg=1;
            end

            6'b00_0000:begin //rType
                ALU_op=2'b10;
                Reg_write=1;
                Reg_dst=1;
            end
            
            6'b00_1000:begin //add Immediate
                Reg_write=1;
                ALU_src=1;
            end
            
            6'b00_0100:begin //branch If Equal
                ALU_op=2'b01;
                Branch=1;
            end
            
            6'b00_0010:begin
                jump=1;
            end
            
            default:begin
                jump=0;
                ALU_op=0;
                Memtoreg=0;
                Mem_write=0;
                Branch=0;
                ALU_src=0;
                Reg_dst=0;
                Reg_write=0;
            end
        endcase
   
    end
   
    always@(*)begin
        ALU_control=3'b000;
        casex({ALU_op,Funct})
            'b00XXXXXX: ALU_control = 3'b010;
            'b01XXXXXX: ALU_control = 3'b100;
            'b10100000: ALU_control = 3'b010;
            'b10100010: ALU_control = 3'b100;
            'b10101010: ALU_control = 3'b110;
            'b10011100: ALU_control = 3'b101;
            default: ALU_control = 3'b010;
            
        endcase
    end
endmodule
