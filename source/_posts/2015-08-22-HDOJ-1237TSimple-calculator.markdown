---
layout: post
title: "HDOJ 1237题  简单计算器"
date: 2015-08-22 05:49:01 +0800
comments: true
categories: acm-c
tags: [acm,c]
keyword: 陈浩翔, 谙忆
description: 简单计算器 Time Limit  2000/1000 MS (Java/Others) Memory Limit 65536/32768 K (Java/Others)Total Submission(s) 15220  Accepted Submission(s) 5195Problem Description 读入一个只包含 +, -, *, / 的非负整数计算表达式
---


简单计算器 
Time Limit: 2000/1000 MS (Java/Others)    Memory Limit: 65536/32768 K (Java/Others) 
Total Submission(s): 15220    Accepted Submission(s): 5195Problem Description 

<!-- more -->
----------

简单计算器
Time Limit: 2000/1000 MS (Java/Others)    Memory Limit: 65536/32768 K (Java/Others)
Total Submission(s): 15220    Accepted Submission(s): 5195


Problem Description
读入一个只包含 +, -, *, / 的非负整数计算表达式，计算该表达式的值。

 

Input
测试输入包含若干测试用例，每个测试用例占一行，每行不超过200个字符，整数和运算符之间用一个空格分隔。没有非法表达式。当一行中只有0时输入结束，相应的结果不要输出。

 

Output
对每个测试用例输出1行，即该表达式的值，精确到小数点后2位。

```
Sample Input
1 + 2
4 + 2 * 5 - 7 / 11
0
 

Sample Output
3.00
13.36
```
听说大部分人是用栈做的，可惜我现在还不太懂，所以就直接一个一个读入数组做了，开始的时候我出了一个小错误，就是那个0 + 0输出应该是0，而我开始写的判断是直接结束了。
ac代码：（很容易理解吧）

```
#include <stdio.h>
#include<string.h>
#include<stdlib.h>
int main()
{
    char a;
    double s,a1,b[500];
    int i,j;
    while(scanf("%lf",&a1))
    {
        b[0]=a1;
        if(a1==0)
        {
            a=getchar();
            if(a=='\n')
                break;
        }
        i=1;
        while(1)
        {
            a=getchar();
            if(a=='+')
                {
                    scanf("%lf",&b[i]);
                    b[i]=b[i];
                    i++;
                }
            if(a=='-')
            {
                scanf("%lf",&b[i]);
                b[i]=-b[i];
                i++;
            }
            if(a=='/')
            {
                scanf("%lf",&b[i]);
                b[i]=b[i-1]/b[i];
                b[i-1]=0;
                i++;
            }
            if(a=='*')
            {
                scanf("%lf",&b[i]);
                b[i]=b[i-1]*b[i];
                b[i-1]=0;
                i++;
            }
            if(a=='\n')
                break;
        }
        s=0;
        for(j=0;j<i;j++)
        {
            s=s+b[j];
        }
        printf("%0.2lf\n",s);
    }
    return 0;
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
