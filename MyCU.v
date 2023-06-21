`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 14:43:12
// Design Name: 
// Module Name: MyCU
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

module MyCU(
    input wire [3:0] operate,    //4位指令操作码
    output reg stop, jmp,ban,acc_we, ram_we, //停机信号、非条件转移jmp、acc读写控制、数据存储器读写控制
    output reg [3:0] s //alu操作选择
);
    initial begin
      stop = 0;
      jmp = 0;
      acc_we = 0;
      ram_we = 0;
      s = 4'b1111;
    end

    always @(operate) begin
      case(operate)
        4'b0000: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0000;   //清除累加器指令CLA
        4'b0001: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0001;   //累加器取反指令COM    
        4'b0010: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0010;   //算术右移一位指令SHR
        4'b0011: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0011;   //循环左移一位指令CSL
        4'b0100: {stop,jmp,ban,acc_we,ram_we,s} = 9'b10000_0100;   //停机STOP
        4'b0101: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0101;   //加法指令ADD
        4'b0110: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00001_0110;   //存数指令STA
        4'b0111: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0111;   //取数指令LDA
        4'b1000: {stop,jmp,ban,acc_we,ram_we,s} = 9'b01000_1000;   //无条件转移指令JMP
        4'b1001: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00100_1001;   //有条件转移BAN
        endcase
    end

endmodule

