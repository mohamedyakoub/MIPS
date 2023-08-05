`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 06:50:39 PM
// Design Name: 
// Module Name: MIPS_top
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


module MIPS_top(
    input clk,
    input reset,
    output [31:0] test_value
    );
    wire[5:0] Funct,Op_code;
    wire[2:0] ALU_control;
    wire jump,Memtoreg,Mem_write,Branch,ALU_src,Reg_dst,Reg_write,zero;
//    PC           pc1(.clk(clk),.reset(reset),.pc_input(pc_input),.pc_output(pc_output));
//    inst_mem     inst_mem1(.PC(pc_output),.Instr(instr));
//    reg_file     reg_file1(.clk(clk),.reset(reset),.w_en(Reg_write),.w_addr(w_addr_reg),.w_data(w_data_reg),.r_addr1(instr[25:21]),.r_addr2(instr[20:16]),.r_data1(SrcA),.r_data2(r_data2));
//    Sign_extend  Sign_extend1(.Instr(instr[15:0]),.SignImm(SignImm));
//    MUX_2X1#(32) ALU    (.sel(ALU_src),.in1(r_data2),.in2(SignImm),.out(SrcB));
//    ALU          ALU1(.SrcA(SrcA),.SrcB(SrcB),.ALU_control(ALU_control),.zero_flag(zero),.ALU_result(ALU_result));
//    Data_mem     Data_mem1(.clk(clk),.reset(reset),.w_en(Mem_write),.addr(ALU_result),.w_data(r_data2),.r_data(r_data_mem),.test_value(test_value));
//    MUX_2X1#(32) Result (.sel(Memtoreg),.in1(ALU_result),.in2(r_data_mem),.out(w_data_reg));
//    MUX_2X1#(5) Writereg (.sel(Reg_dst),.in1(instr[20:16]),.in2(instr[15:11]),.out(w_addr_reg));
//    MUX_2X1#(32) mux_pc_jump (.sel(jump),.in1(branch_jump_wire),.in2({pc_plus_4[31:28],pc_jump}),.out(pc_input));
//    MUX_2X1#(32) mux_pc_branch (.sel(zero&Branch),.in1(pc_plus_4),.in2(pc_branch),.out(branch_jump_wire));
//    shf_left_twice#(32) shf_branch (.in(SignImm),.out(branch_before));
//    Adder adder_pc_branch (.A(branch_before),.B(pc_plus_4),.C(pc_branch));
//    Adder pc_4 (.A(pc_output),.B(32'd4),.C(pc_plus_4));
//    shf_left_twice#(28) shf_jump (.in({2'b00,instr[25:0]}),.out(pc_jump));

   
    Control_Unit cntrl(.Funct(Funct),.Op_code(Op_code),.ALU_control(ALU_control),.jump(jump),.Memtoreg(Memtoreg),.Mem_write(Mem_write),.Branch(Branch),.ALU_src(ALU_src),.Reg_dst(Reg_dst),.Reg_write(Reg_write));
   
   
    Data_path Data_path0(
      .clk(clk),.reset(reset),
      .jump(jump),.Memtoreg(Memtoreg),.Mem_write(Mem_write),.Branch(Branch),.ALU_src(ALU_src),.Reg_dst(Reg_dst),.Reg_write(Reg_write),
       .ALU_control(ALU_control),
       .Funct(Funct),.Op_code(Op_code),
       .test_value(test_value)
    );
    endmodule
