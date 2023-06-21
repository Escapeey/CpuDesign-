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
    input wire [3:0] operate,    //4λָ�������
    output reg stop, jmp,ban,acc_we, ram_we, //ͣ���źš�������ת��jmp��acc��д���ơ����ݴ洢����д����
    output reg [3:0] s //alu����ѡ��
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
        4'b0000: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0000;   //����ۼ���ָ��CLA
        4'b0001: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0001;   //�ۼ���ȡ��ָ��COM    
        4'b0010: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0010;   //��������һλָ��SHR
        4'b0011: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0011;   //ѭ������һλָ��CSL
        4'b0100: {stop,jmp,ban,acc_we,ram_we,s} = 9'b10000_0100;   //ͣ��STOP
        4'b0101: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0101;   //�ӷ�ָ��ADD
        4'b0110: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00001_0110;   //����ָ��STA
        4'b0111: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00010_0111;   //ȡ��ָ��LDA
        4'b1000: {stop,jmp,ban,acc_we,ram_we,s} = 9'b01000_1000;   //������ת��ָ��JMP
        4'b1001: {stop,jmp,ban,acc_we,ram_we,s} = 9'b00100_1001;   //������ת��BAN
        endcase
    end

endmodule

