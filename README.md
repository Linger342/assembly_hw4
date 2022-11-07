# 多模块 & 宏

11/7 实验记录:
1. 将原本十六进制转换十进制的代码替换成三个macro文件
    macro为宏文件，macro-a为主程序，macro-b为子程序
2. 将.asm文件更换成.mac, .txt后缀可以直接替换为这些文本文件后缀
3. link时的语法为 link macro-a.obj+macro-b.obj，本次实验好像与顺序无关
4. 得到的exe默认为macro-a，即前者
5. 此时即可将一个冗长的代码段，划分成三个文件，做到和.cpp的分层处理
