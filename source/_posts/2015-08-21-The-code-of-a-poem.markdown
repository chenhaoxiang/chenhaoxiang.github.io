---
layout: post
title: "一首诗的代码"
date: 2015-08-21 06:00:58 +0800
comments: true
categories: other
tags: [c-plus-plus]
keyword: 陈浩翔, 谙忆
description: c语言的诗，早期作品
---

将一首诗用代码输出

----------

```C
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
int one1=1,one2=1,one3=1,one4=1,one5=1,one6=1;
void color1()
{
    system("color F4");
    Sleep(500);
}
void color2()
{
    system("color FC");
    Sleep(500);
}
void ai_1(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a-j;
    m=-b-j;
    one1++;
    if(one1%3==0)
        one1=1;
    printf("%c%c",n,m);
    color1();
}
void ai_2(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a+j;
    m=-b+j;
    one2++;
    if(one2%5==0)
        one2=1;
    printf("%c%c",n,m);
    color2();
}
void ai_3(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a-j-1;
    m=-b-j-1;
    one3++;
    if(one3%7==0)
        one3=1;
    printf("%c%c",n,m);
    color1();
}
void ai_4(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a+j+2;
    m=-b+j+2;
    one4++;
    if(one4%9==0)
        one4=1;
    printf("%c%c",n,m);
    color2();
}
void ai_5(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a-j-j;
    m=-b-j-j;
    one5++;
    if(one5%11==0)
        one5=1;
    printf("%c%c",n,m);
    color1();
}
void ai_6(int a,int b,int i)
{
    int j,n,m;
    j=i*i;
    n=-a+j;
    m=-b+j;
    one6++;
    if(one6%13==0)
        one6=1;
    printf("%c%c",n,m);
    color2();
}
void ai(int a,int b,int i)
{
    int j,n,m;
    j=i;
    n=-a+j;
    m=-b+j;
    printf("%c%c",n,m);
    color2();
}
void chx_1()
{
    printf(" ");
    ai_1('D','F',one1);
    ai_2('E',':',one2);
    ai_3('I',';',one3);
    ai_4('N',')',one4);
    ai_4('2','I',one4);
    ai_5('J','0',one5);
    ai_6('E',6,one6);
    ai_3('9',26,one2);
    ai_5('G','8',one2);
    ai_2('<',26,one3);
    ai_5('<','J',one4);
    ai_6('6','@',2*one5);
}
void chx_2()
{
    ai_1('4','1',2*one5);
    ai_4('<','?',one5);
    ai_3(')','+'-8,2*one1);
    ai_5('5','=',one4);
    ai_2('0','3',one6);
    ai_6('Y',')',one3);
    ai_3('*','R',one4);
    ai_4('R','C',one5);
    ai_4('R','-',one5);
    ai_1('*','A',one2);
    ai_5('4',-10,5*one1);
    ai_2('7'+25,'B'+24,3*one1);
    ai_3('?','=',one6);
    ai_6(26,36,one4);
}
void chx_3()
{
    ai_4('9','5',one6);
    ai_2('-',28,one1);
    ai_1('+','W',one3);
    ai_2('9',11,one5);
    ai_5('0',24,one5);
    ai_3('4','1',one4);
    ai_4('8',16,one5);
    ai_6('K','W',one2);
    ai_5('2','>',one4);
    ai_2('Q','B',one6);
    ai_3('*',-4,one4);
    ai_5(39,'9',one1);
    ai(110,79,50);
    ai_1(-11,-1,one1*one1);
}
void chx_4()
{
    ai_4('.','I',one3);
    ai_6('F','I',one2);
    ai_2('T',100,one5);
    ai_3('H','X',one3);
    ai_5('/','G',one1);
    ai_1('.',0,one6-2);
    ai_3('(',':',0);
    ai_5('L','-',one3);
    ai_6(39,'1',one6);
}
void chx_5()
{
    ai_5('.',15,one6-1);
    ai_4('O','@',one5);
    ai_4('H','-',one3);
    ai_6('3','P',one4);
    ai_4('F','7',one5);
    ai_2('@',19,one1);
    ai_1('1','-',one1);
    ai_3('+','7',one4);
    ai_4('9','D',one6);
    ai_1(-19,-9,one6);
}
void chx_6()
{
    ai_1('6',33,one2);
    ai_5(37,33,one3);
    ai_5('*','J',one2);
    ai_2('A','F',one6);
    ai_6('6','2',one1);
    ai_3('*','6',one4);
    ai_6('S','Z',one2);
    ai_3(-22,-12,one6);
}
void chx_7()
{
    ai_3(30,'F',one6);
    ai_1('B',9,one5);
    ai_4(3,13,one6);
    ai_3('.','*',one2);
    ai_2('Z','(',one6);
    ai_5(37,'(',one5);
    ai_6('9','K',one2);
    ai_1('(','?',one4);
    ai_2('K',13,one3);
    ai_3('6','+',one4);
    ai_4('7',27,one3);
    ai_6(15,25,one5);
}
void chx_8()
{
    ai_5(36,';',one5);
    ai_6('N',115,one5);
    ai_4('E',':',one5);
    ai_3('(',12,one4);
    ai_5(37,'7',one1);
    ai_2('.','1',one2);
    ai_1(50,18,one1);
    ai_1(-11,-1,one1);
}
void chx_9()
{
    ai_1('0',44,one1);
    ai_2('?',';',one2);
    ai_3('3',27,one4);
    ai_4('L',33,one3);
    ai_5('B','R',one3);
    ai_6('E',26,one4);
    ai_4(0,10,one5);
}
void chx_10()
{
    ai_4('I',35,one4);
    ai_3('/',35,one3);
    ai_5('3','W',one2);
    ai_4(44,'>',one3);
    ai_1('5',')',one3);
    ai_5(-18,-8,one4);

}
void chx_11()
{
    ai_2('2','I',one4);
    ai_6('3','X',one6);
    ai_3(36,28,one4);
    ai_4('5','B',one1);
    ai_5(36,'G',one5);
    ai_1(-14,-4,one2);

}
void chx_12()
{
    ai_1('1',33,one1);
    ai_5(':',33,one3);
    ai_4(':','=',one5);
    ai_3('A','-',one2);
    ai_6('?','X',one3);
    ai_6(26,36,one4);
    ai_2('6',38,one2);
    ai_3(':',33,one3);
    ai_4(':','=',one5);
    ai_5('B','.',one5);
    ai_1('D',33,one4);
    ai_1(-17,-7,one4);
}
void chx_13()
{
    ai_6('3','N',one5);
    ai_2('5',']',one4);
    ai_6('1','4',one2);
    ai_3('4',21,one4);
    ai_4('0',':',one4*one6);
    ai_5(38,'2',one3);
    ai_4('Y',39,one4);
    ai_1('7',31,one3);
    ai_2('X','V',one6);
    ai_4('?',5,one4);
    ai_6('6','@',one6);

}
void chx_14()
{
    ai_3(36,'?',one3);
    ai_5(34,'J',one3);
    ai_1(36,39,one6);
    ai_4('G','(',one6);
    ai_4(1,11,one6);
    ai_2('J','R',one3);
    ai_3('/','@',one3);
    ai_6('F','I',one4);
    ai_5('G','O',one4);
    ai_1('H',24,one3);
    ai_3(34,11,one6);
    ai_4(-2,8,one5);
}
void chx_15()
{
    ai_3('(','H',one4);
    ai_4('9','L',one6);
    ai_5(24,'6',one6);
    ai_3('B','<',one5);
    ai_6('Z',']',one4);
    ai_2(577,545,520);
    ai_5('(',8,one4);
    ai_6('6','@',one5);
    ai('F',':',0);
    ai('0',23,-1);
    ai_3(-17,-7,one4);
    ai_3(-18,-8,one4);
}
int main()
{
    int i;
    chx_1();
    chx_2();
    chx_3();
    chx_4();
    chx_5();
    chx_6();
    chx_7();
    chx_8();
    chx_9();
    chx_10();
    chx_11();
    chx_12();
    chx_13();
    chx_14();
    chx_15();
    system("pause");
    system("cls");
    float y,x,z,f;
    for (y = 1.5f; y > -1.5f; y -= 0.1f)
    {
        for (x = -1.5f; x < 1.5f; x += 0.05f)
        {
            z = x * x + y * y - 1;
            f = z * z * z - x * x * y * y * y;
            putchar(f <= 0.0f ? ".:-=+*#%@"[(int)(f * -8.0f)] : ' ');
        }
        system("color 0C");
        putchar('\n');
    }
    printf("\n按下任意键结束...\n");
    system("pause");
    return 0;
}
```
回忆而写！

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
