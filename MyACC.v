`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 11:21:09
// Design Name: 
// Module Name: MyACC
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


module MyACC(
    input wire clk, acc_we,
    input wire [7:0] in,
    output wire [7:0] out
    );
    reg [7:0] acc;
    initial begin
        acc = 8'b0000000;
    end
    
    assign out = acc;
    
    always@(negedge clk)    begin
        if(acc_we == 1)
            acc = in;
        end
      
endmodule