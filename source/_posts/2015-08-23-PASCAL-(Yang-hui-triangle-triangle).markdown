---
layout: post
title: "巴斯卡三角形（杨辉三角）"
date: 2015-08-23 10:50:19 +0800
comments: true
categories: algorithm
tags: [algorithm,c]
keyword: 陈浩翔, 谙忆
description: 巴斯卡是十七世纪的一位法国数学家，也是历史上第一位发明了加法计算机的人！他造出“巴斯卡三角形”的方法是这样的 先在纸上写出一行和一列的“ 1 “ ，然后在各个位置中填入数字，每一个位置上的数字都是它上面一个数和左边一个数的和。接下来，把这个表右转45 ° ，放正了，就得到上面的数字三角形了！ 3. 现在的数学书里，都把这个三角形称为“巴斯卡三角 
---


参考资料：
1.
巴斯卡三角的来历 
2.
巴斯卡是十七世纪的一位法国数学家，也是历史上第一位发明了加法计算机的人！他造出“巴斯卡三角形”的方法是这样的：先在纸上写出一行和一列的“ 1 “ ，然后在各个位置中填入数字，每一个位置上的数字都是它上面一个数和左边一个数的和。接下来，把这个表右转45 ° ，放正了，就得到上面的数字三角形了！  
3.
现在的数学书里，都把这个三角形称为“巴斯卡三角形” ，事实上，在南宋杨辉所写的数学书里面，早就介绍了由北宋贾宪所创造出来的相同三角形了（所以在中国称为“贾宪三角”或“杨辉三角” ） ，时间可要比巴斯卡早了600年。 

<!-- more -->
----------
 
组合数计算方法：```C(n,m)=n!/[m!(n-m)!]```
![](http://img.blog.csdn.net/20150823230450040)

```c
#include <stdio.h>
#define N 12
long combi(int n, int r)
{
    int i;
    long p = 1;
    for(i = 1; i <= r; i++)
        p = p * (n-i+1) / i;
    //这里没有采用斯巴卡三角形的特性，
    //即下数等于上面两数之和，而是通过行列的关系推出。
    //当然也可以利用二维数组计算，利用下数等于上面两数之和。
    return p;
}/**上述程序是解决巴斯卡三角形问题的递归方程式。
在主函数中依次combi(0,0)->combi(1,0)->combi(1,1)->combi(2,0)->combi(2,1)->combi(3,1)->其实很简单，
就是这样一个过程，公式是经过推导的，有兴趣也可以自己推导!
这种问题没有为什么，就只有怎么做到!combi(0,0)->combi(1,0)->combi(1,1)->combi(2,0)->combi(2,1)->combi(3,1)->.
把这些代入得出p并且输出!
懂得如何实现就可以了!高深一点，
就要学会自己推导公式，也就是真正算法的精髓。**/
int main()
{
    int n, r, t;
    for(n = 0; n <= N; n++)
    {
        for(r = 0; r <= n; r++)
        {
            int i;/* 排版设定开始 */
            if(r == 0)
            {
                for(i = 0; i <= (N-n); i++)
                    printf("   ");
            }
            else
            {
                printf("   ");

            } /* 排版设定结束 */
            printf("%3d", combi(n, r));
        }
        printf("\n");
    }
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
