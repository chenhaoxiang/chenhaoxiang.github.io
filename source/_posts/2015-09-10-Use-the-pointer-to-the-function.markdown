---
layout: post
title: "使用指向函数的指针"
date: 2015-09-10 02:34:22 +0800
comments: true
categories: c-plus-plus
tags: [函数,指针,c++]
keyword: 陈浩翔, 谙忆
description: 输入2个整数，然后让用户选择1或2，选1时调用max函数，输出2者中的大数，选2时调用min函数，输出2者中的小数
---

使用指向函数的指针小例子

<!-- more -->
----------

输入2个整数，然后让用户选择1或2，选1时调用max函数，输出2者中的大数，  
选2时调用min函数，输出2者中的小数

```C++
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int max(int x,int y);
    int min(int x,int y);
    int (*p)(int ,int );
    int n,a,b;
    scanf("%d%d",&a,&b);
    scanf("%d",&n);
    if(n==1)
    {
        p=max;
    }
    else p=min;
    int c=(*p)(a,b);
    printf("%d\n",c);
    return 0;
}
int max(int x,int y)
{
    int z;
    if(x>y)
        z=x;
    else z=y;
    return z;
}
int min(int x,int y)
{
    int z;
    if(x<y)
        z=x;
    else
        z=y;
    return z;
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
