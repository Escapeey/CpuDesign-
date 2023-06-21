`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 10:32:13
// Design Name: 
// Module Name: MyALU
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


module MyALU(
    input wire [3:0] s,
    input wire [7:0] a, b,
    output reg cf, zf,
    output reg ban,
    output reg [7:0] result
    );
reg [8:0] temp;
    initial begin
        ban = 0;
        result = 0;
    end
    
    always @(*) begin
        zf = 1'b0;
        cf = 1'b0;
        case (s)

            4'b0000:    //CLA
                result = 8'b0000_0000;
            4'b0001:    //COM
                result = ~a;
            4'b0010:    //SHR 算术右移
                begin
                    result[6:0] = a[7:1];
                    result[7] = a[7];
                end

            4'b0011:    //CSL 循环左移
                begin
                    result[7:1] = a[6:0];
                    result[0] = a[7];
                end 
                
            4'b0100:    //STP
                $finish;  
            4'b0101:    //ADD
                begin
                    result = a + b;
                    //查看和是否为0
                    if(result == 8'b0000_0000)
                        zf = 1;
                    else
                        zf = 0;
                    //查看进位
                    temp = a + b;
                    if(temp[8] == 1'b0)
                        cf = 0;
                    else
                        cf = 1;
                end
            4'b0110:    //STA
                result = a;
            4'b0111:    //LDA
                result = b;
            4'b1001:    //BAN
                ban = a[7]==1?1:0;
        endcase
     end
     
endmodule
