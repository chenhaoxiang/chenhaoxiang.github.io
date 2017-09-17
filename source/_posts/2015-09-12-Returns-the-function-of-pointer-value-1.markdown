---
layout: post
title: "返回指针值的函数（1）"
date: 2015-09-12 04:40:34 +0800
comments: true
categories: c-plus-plus
tags: [函数,指针]
keyword: 陈浩翔, 谙忆
description: 有a个学生，每个学生有b门课程的成绩。要求在用户输入学生序号以后
---

返回指针值的函数(一)

<!-- more -->
----------

```C++
/**有a个学生，每个学生有b门课程的成绩。要求在用户输入学生序号以后，
**/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    float *aa(int (*p)[4],int n);
    float a[3][4]={ {50,99,80,50},{55,60,85,90},{10,54,74,26} };
    float *pt;
    int k;
    scanf("%d",&k);
    pt=aa(a,k);
    int i;
    for(i=0;i<4;i++)
        printf("%.2f ",*(pt+i));
    return 0;
}

float *aa(int (*p)[4],int n)
{
    float *pp;
    pp=*(p+n);
    return pp;
}
/**函数aa定义为指针型函数，它的形参p是指向包含4个元素的
一维数组的指针变量。p+1指向aa数组序号为1的行（学生序号从0开始）
pt是指向float型数据的指针变量,*(pt+i)表示该学生的第i门课程的成绩**/

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
