---
layout: post
title: "用指针方法排序数组"
date: 2015-09-09 06:26:32 +0800
comments: true
categories: c-plus-plus
tags: [数组,指针,算法]
keyword: 陈浩翔, 谙忆
description: 用指针方法排序数组
---

将一维数组中10个数按大到小的顺序排列输出

<!-- more -->
----------

```C++
#include <stdio.h>
#include <stdlib.h>
//将一维数组中10个数按大到小的顺序排列输出
int main()
{
    void sort(int x[],int n);
    //void sort(int *x,int n)
    int i,x[10];
    int *p;
    p=x;
    for(i=0;i<10;i++)
        scanf("%d",p++);
    p=x;
    sort(p,10);
    p=x;
    for(i=0;i<10;i++)
        printf("%d ",*(p++));
        return 0;
}
void sort(int x[],int n)
//void sort(int *x,int n)
{
    int i,j,t;
    for(i=0;i<n;i++)
    {
        for(j=i;j<n;j++)
        {
//if(*(x+j)>*(x+i))
            {
                t=x[j],x[j]=x[i],x[i]=t;
                //t=*(x+j),*(x+j)=*(x+i),*(x+i)=t;
            }
        }
    }
}

```

*(x+j)就是x[j];

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
