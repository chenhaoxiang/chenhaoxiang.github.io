---
layout: post
title: "递归简论"
date: 2015-08-26 04:12:09 +0800
comments: true
categories: algorithm
tags: [algorithm,c]
keyword: 陈浩翔, 谙忆
description: 处理基准情况 基准情形：你必须总要有某些基准的情形，它们不用递归就能求解

---

用代码来描述递归

<!-- more -->
----------

```c
/**f(x)=2f(x-1)+x^2;f(0)=0;**/
#include <stdio.h>
#include <stdlib.h>
int f(unsigned int x)
{
    if(x==0)
        return 0;//处理基准情况
    //基准情形：你必须总要有某些基准的情形，它们不用递归就能求解
    else
        return 2*f(x-1)+x*x;
    //不断推进：对于那些需要递归求解的情形，递归调用必须总能够朝着产生基准情形的方向推进
}
int main()
{
    unsigned int n;
    while(~scanf("%d",&n))
    {
        printf("%u\n",f(n));
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
