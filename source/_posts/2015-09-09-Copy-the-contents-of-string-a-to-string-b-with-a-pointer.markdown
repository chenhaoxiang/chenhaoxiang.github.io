---
layout: post
title: "用指针将字符串a的内容复制到字符串b"
date: 2015-09-09 09:50:08 +0800
comments: true
categories: c-plus-plus
tags: [指针.c++]
keyword: 陈浩翔, 谙忆
description: 用指针将字符串a的内容复制到字符串b
---

用指针将字符串a的内容复制到字符串b
 
<!-- more -->
----------

```c++
#include <stdio.h>
#include <stdlib.h>

/**int main()
{
    char a[]="i love you very mach!",b[100];
    int i;
    for(i=0;*(a+i)!='\0';i++)
    {
        *(b+i)=*(a+i);
    }
    *(b+i)='\0';
    printf("a:%s\n",a);
    printf("b:");
    for(i=0;*(b+i)!='\0';i++)
        printf("%c",*(b+i));
    printf("\n");
    return 0;
}**/
/**下面用指针来处理这个问题**/
int main()
{
    char a[]="i love you!",b[100];
    char *p1,*p2;
    p1=a;p2=b;
    for(;*p1!='\0';p1++,p2++)
        *p2=*p1;
    *p2='\0';
    printf("a:%s\n",a);
    printf("b:%s\n",b);
    return 0;
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
