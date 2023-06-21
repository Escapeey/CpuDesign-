`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 15:29:29
// Design Name: 
// Module Name: MyPCtopv
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

module MyPCtopv(
    input wire clk, pc_reset
);
    wire stop, ban, jmp, acc_we, ram_we;
    wire [3:0] pc_addr;
    wire [3:0] s;
    wire [7:0] IR, a, b, result;

    //PCʵ����
    MyPC pc(
      //input
      .clk(clk), .pc_reset(pc_reset), .stop(stop), .ban(ban), .jmp(jmp),
      .addrJmp(IR[3:0]),
      //output
      .addr(pc_addr)
    );
    //ACCʵ����
    MyACC acc(
      //input
      .clk(clk), .acc_we(acc_we),
      .in(result), //acc_we=1ʱ result д�� acc
      //output
      .out(a) // =acc
    );
    //RAMʵ����
    MyRAM ram(
      //input
      .ram_we(ram_we), .clk(clk),
      .addr_ins(pc_addr),
      .addr_data(IR[3:0]),
      .dataIn(result),  //ram_we=1ʱ result д�� ram[addr_data]
      //output
      .mdr_ins(IR),     //mdr_ins  = ram[addr_ins]
      .mdr_data(b)      //mdr_data = ram[addr_data]
    );
    //CUʵ����
    MyCU cu(
      //input
      .operate(IR[7:4]),
      //output
      .stop(stop), .jmp(jmp), .acc_we(acc_we), .ram_we(ram_we),.ban(ban),
      .s(s)
    );
    //ALUʵ����
    MyALU alu(
      //input
      .a(a), .b(b),
      .s(s),
      //output
      .ban(ban),
      .result(result)
    );

endmodule
