---
layout: post
title: "返回指针值的函数（2）"
date: 2015-09-12 05:00:32 +0800
comments: true
categories: c-plus-plus
tags: [函数,指针,c++]
keyword: 陈浩翔, 谙忆
description: 请自己理解，比较简单 对前面那个问题，输出有不及格成绩的学生的所有成绩
---

返回指针值的函数(二)

<!-- more -->
----------

请自己理解，比较简单

```C++
/**对前面那个问题，输出有不及格成绩的学生的所有成绩**/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    float a[3][4]={ {50,99,80,50},{55,60,85,90},{10,54,74,26} };
    float *p;
    float  *aa(float (*pt)[4]);
    int i;
    for(i=0;i<3;i++)
    {
        p=aa((a+i));
        if(p==*(a+i))
        {
            int j;
            for(j=0;j<4;j++)
                printf("%5.2f ",*(p+j));
            printf("\n");
        }
    }
    return 0;
}

float *aa(float (*pt)[4])
{
    float *ps;
    ps=NULL;
    int i;
    for(i=0;i<4;i++)
    {
        if(*(*pt+i)<60)
            ps=*pt;
    }
    return ps;
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
