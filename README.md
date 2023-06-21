# CpuDesign-
计算机组成原理 十条指令CPU设计  
**本项目实现了十条指令的CPU 内存大小为 16x8位， 指令字长为8位，前4位为操作码**。
## 1.指令集
![指令集](README图片/指令集.png "指令集")
## 2.文件介绍
- MyPC.v  文件 实现了PC, 其中上升沿为PC的顺序寻址，下降沿为指令的跳跃寻址；
- MyALU.v 文件 实现了ALU,其中s为运算控制信号；
- MyCU.v  文件 实现了CU, 其中通过四位指令操作码输出控制信号；
- MyACC.v 文件 实现了ACC,其中通过acc_we写使能控制信号来控制写入操作；（注：acc一直是可读的，其有一条直达alu的a操作数的线，通过alu对a处理得到result,result与ram有一条直达的线，在ram_we=1时写入ram）；
- MyRAM.v 文件 实现了RAM,其中有**16X8位**的内存空间；保存了指令集和数据，一般前几个字节存放需要顺序执行的指令，后几个字节存放数据；
- MyPCtop.v 文件 是该项目的顶层文件，实现了各设备之间的接线。

## 3.接线图示
![接线图示](README图片/接线图示.png "接线图示")
## 4.测试用例1： 高斯级数 波形展示
![测试样例1波形图](README图片/测试样例1波形图.png "测试样例1波形图")
## 5.测试用例2： 判断大小 波形展示
![测试样例2波形图](README图片/测试样例2波形图.png "测试样例2波形图")
