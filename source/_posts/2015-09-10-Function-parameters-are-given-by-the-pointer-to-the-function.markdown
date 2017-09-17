---
layout: post
title: "用指向函数的指针作函数参数"
date: 2015-09-10 03:04:09 +0800
comments: true
categories: c-plus-plus
tags: [函数,指针,C++]
keyword: 陈浩翔, 谙忆
description: 有2个整数a，b，有用户输入1,2,或3，如输入1，程序就给出a和b中大者，输入2，就给出a和b中小者，输入3，就给出a和b的和
---

用指向函数的指针作函数参数小实例 

<!-- more -->
----------

有2个整数a，b，有用户输入1,2,或3，如输入1，  
程序就给出a和b中大者，输入2，就给出a和b中小者，  
输入3，就给出a和b的和  

```C++
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int f(int x,int y,int (*p)(int ,int ));
    int max(int x,int y);
    int min(int x,int y);
    int sum(int x,int y);
    int a=34,b=-10;
    int n;
    scanf("%d",&n);
    if(n==1)
        f(a,b,max);
    if(n==2)
        f(a,b,min);
    if(n==3)
        f(a,b,sum);
    return 0;
}
int f(int x,int y,int (*p)(int ,int ))
{
    int ss;
    ss=(*p)(x,y);
    printf("%d\n",ss);
    return 0;
}
int max(int x,int y)
{
    int z;
    if(x>y)
        z=x;
    else
        z=y;
    return z;
}
int min(int x,int y)
{
    int z;
    if(x>y)
        z=y;
    else
        z=x;
    return z;
}
int sum(int x,int y)
{
    return x+y;
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
