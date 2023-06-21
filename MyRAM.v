`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/11 21:03:12
// Design Name: 
// Module Name: MyRAM
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


// ��������ɸ�λ�ĵ��˿�RAM��Read_first
module MyRAM (
    input wire clk, ram_we, 
    input wire [3:0] addr_ins, addr_data, 
    input wire [7:0] dataIn, 
    output wire [7:0] mdr_ins, mdr_data
);
    reg [7:0] ram [15:0];
    
    assign mdr_data = ram[addr_data];

    initial begin
        // ָ�
        ram[0] = 8'b0000_0000;   // 0000 xxxx CLA
        ram[1] = 8'b0001_0000;   // 0001 xxxx COM
        ram[2] = 8'b0010_0000;   // 0010 xxxx SHR
        ram[3] = 8'b0011_0000;   // 0011 xxxx CSL
        ram[4] = 8'b0100_0000;   // 0100 xxxx STP
        ram[5] = 8'b0101_0000;   // 0101 bbbb ADD X
        ram[6] = 8'b0110_0000;   // 0110 bbbb STA X
        ram[7] = 8'b0111_0000;   // 0111_bbbb LDA X
        ram[8] = 8'b1000_0001;   // 1000_bbbb JMP X
        ram[9] = 8'b1001_0000;   // 1001_rrrr BAN X


        // ��������1�� ��˹����
        ram[0] = 8'b0111_1001;   // 0111_bbbb LDA X
        ram[1] = 8'b0101_1010;   // 0101 bbbb ADD X
        ram[2] = 8'b0110_1010;   // 0110 bbbb STA X
        ram[3] = 8'b0111_1001;   // 0111_bbbb LDA X
        ram[4] = 8'b0101_1011;   // 0101 bbbb ADD X
        ram[5] = 8'b1001_0011;   // 1001_rrrr BAN X
        ram[6] = 8'b0110_1001;   // 0110 bbbb STA X
        ram[7] = 8'b1000_0001;   // 1000_bbbb JMP X
        ram[8] = 8'b0100_0000;   // 0100 xxxx STP
        
        ram[9]  = 8'b0000_1001;  // ��ʼ�� ���� N
        ram[10] = 8'b0000_0000;  // ��ʼ�� ���� SUM
        ram[11] = 8'b1111_1111;  // ��ʼ�� ���� M1 = -1
        
        
//        // ��������2�� �жϴ�С
//        ram[0] = 8'b0111_1100;   // 0111_bbbb LDA X
//        ram[1] = 8'b0001_0000;   // 0001 xxxx COM
//        ram[2] = 8'b0101_1101;   // 0101 bbbb ADD X
//        ram[3] = 8'b0101_1011;   // 0101 bbbb ADD X
//        ram[4] = 8'b1001_0100;   // 1001_rrrr BAN X
//        ram[5] = 8'b0111_1101;   // 0111_bbbb LDA X
//        ram[6] = 8'b0110_1111;   // 0110 bbbb STA X
//        ram[7] = 8'b0100_0000;   // 0100 xxxx STP
//        ram[8] = 8'b0111_1110;   // 0111_bbbb LDA X
//        ram[9] = 8'b0110_1111;   // 0110 bbbb STA X
//        ram[10] = 8'b0100_0000;   // 0100 xxxx STP
        
//        ram[11] = 8'b1111_1111;  // ��ʼ�� ���� A
//        ram[12] = 8'b1111_1110;  // ��ʼ�� ���� B
//        ram[13] = 8'b0000_0001;  // ��ʼ�� ���� M1 = 1
//        ram[14] = 8'b0000_0000;  // ��ʼ�� ���� M2 = 0

    end
    
    assign mdr_ins = ram[addr_ins];
    
    always@ (negedge clk) begin
        if(ram_we == 1)
            ram[addr_data] = dataIn;
    end
       
endmodule