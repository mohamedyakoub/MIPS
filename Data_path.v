`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 09:51:32 PM
// Design Name: 
// Module Name: Data_path
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


module Data_path(
     input clk,reset,
     input jump,Memtoreg,Mem_write,Branch,ALU_src,Reg_dst,Reg_write,
     input [2:0] ALU_control,
     output [5:0] Funct,Op_code,
     output [31:0] test_value
    );
    
     wire[31:0] pc_output,pc_input;
    wire[31:0] instr,r_data2,SignImm,SrcA,SrcB,ALU_result,r_data_mem,w_data_reg,branch_before,pc_plus_4,pc_branch,branch_jump_wire;
    wire[27:0] pc_jump;
    wire[4:0]w_addr_reg;
    wire zero;
    
    
    PC           pc1 (.clk(clk),
                      .reset(reset),
                      .pc_input(pc_input),
                      .pc_output(pc_output));
                 
    inst_mem     inst_mem1(.PC(pc_output),
                           .Instr(instr));
                           
    reg_file     reg_file1(.clk(clk),
                           .reset(reset),
                           .w_en(Reg_write),
                           .w_addr(w_addr_reg),
                           .w_data(w_data_reg),
                           .r_addr1(instr[25:21]),
                           .r_addr2(instr[20:16]),
                           .r_data1(SrcA),
                           .r_data2(r_data2));
                           
    Sign_extend   Sign_extend1(.Instr(instr[15:0]),
                               .SignImm(SignImm));
                               
    MUX_2X1#(32)  ALU         (.sel(ALU_src),
                               .in1(r_data2),
                               .in2(SignImm),
                               .out(SrcB));
                               
    ALU           ALU1        (.SrcA(SrcA),
                               .SrcB(SrcB),
                               .ALU_control(ALU_control),
                               .zero_flag(zero),
                               .ALU_result(ALU_result));
                               
    Data_mem     Data_mem1    (.clk(clk),
                               .reset(reset),
                               .w_en(Mem_write),
                               .addr(ALU_result),
                               .w_data(r_data2),
                               .r_data(r_data_mem),
                               .test_value(test_value));
                               
    MUX_2X1#(32)  Result      (.sel(Memtoreg),
                               .in1(ALU_result),
                               .in2(r_data_mem),
                               .out(w_data_reg));
                               
    MUX_2X1#(5)   Writereg    (.sel(Reg_dst),
                               .in1(instr[20:16]),
                               .in2(instr[15:11]),
                               .out(w_addr_reg));
                               
    MUX_2X1#(32)  mux_pc_jump (.sel(jump),
                               .in1(branch_jump_wire),
                               .in2({pc_plus_4[31:28],pc_jump}),
                               .out(pc_input));
                               
    MUX_2X1#(32) mux_pc_branch (.sel(zero&Branch),
                                .in1(pc_plus_4),
                                .in2(pc_branch),
                                .out(branch_jump_wire));
                                
    shf_left_twice#(32) shf_branch (.in(SignImm),
                                    .out(branch_before));
                                    
    Adder adder_pc_branch      (.A(branch_before),
                                .B(pc_plus_4),
                                .C(pc_branch));
                                
    Adder pc_4                 (.A(pc_output),
                                .B(32'd4),
                                .C(pc_plus_4));
                                
    shf_left_twice#(28) shf_jump (.in({2'b00,instr[25:0]}),
                                  .out(pc_jump));
   
    assign Funct=instr[5:0];
    assign Op_code=instr[31:26];
    
endmodule
