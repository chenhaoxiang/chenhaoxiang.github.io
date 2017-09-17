---
layout: post
title: "将若干字符串按字母顺序（由小到大）输出（用指针）"
date: 2015-09-14 07:59:16 +0800
comments: true
categories: c-plus-plus
tags: [指针,C++]
keyword: 陈浩翔, 谙忆
description: 将若干字符串按字母顺序（由小到大）输出（用指针）
---

将若干字符串按字母顺序（由小到大）输出（用指针）

<!-- more -->
----------

```C++
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void sortt(char *name[],int n)
{
    int i,j;
    char *temp;
    for(i=0;i<5;i++)
    {
        for(j=i+1;j<5;j++)
        {
            if(strcmp(name[i],name[j])>0)
                /**
设这两个字符串为str1，str2，
若str1==str2，则返回零；
若str1>str2，则返回正数；
若str1<str2，则返回负数。**/
            {
                temp=name[i];
                name[i]=name[j];
                name[j]=temp;
            }
/**将name[i]和name[j]对换，也就是将指向第i个字符串的数组元素
（是指针型元素）的值与指向第j个字符串的数组元素的值对换，
也就是把它们的指向互换**/
        }
    }
}
int main()
{
    char *name[]={"i love you","Follow me","FOllOW me","I love you","Basic"};
    int i,n=5;
    sortt(name,n);
    for(i=0;i<n;i++)
    {
        printf("%s\n",name[i]);
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
