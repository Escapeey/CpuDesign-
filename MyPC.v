`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 14:41:23
// Design Name: 
// Module Name: MyPC
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


module MyPC(
    input wire clk, pc_reset, stop, jmp, ban, //ʱ�ӡ����á�ͣ����������ת�ơ�����ת��
    input wire [3:0] addrJmp,   // 4 λ ��תָ��
    output reg [3:0] addr       // 4 λ ָ���ַ��
);
    assign stop = 0;            // ��ʼ������

    
    always@(posedge clk) begin
        if(pc_reset == 1)
            addr[3:0] <=  0;
        else
            addr = addr + 1;
        end
        
    always@(posedge clk) begin
        if(jmp == 1)            // ������ת��
            addr = addrJmp;
        if(ban == 1)
            addr = addr + addrJmp-1;
    end
    
    

endmodule
