---
layout: post
title: "HDOJ1518Square 深搜"
date: 2015-08-24 11:51:53 +0800
comments: true
categories: acm-c
tags: [acm,HDOJ]
keyword: 陈浩翔, 谙忆
description: Square 
Time Limit: Given a set of sticks of various lengths, is it possible to join them end-to-end to form a square?
---

Problem Description
Given a set of sticks of various lengths, is it possible to join them end-to-end to form a square?

<!-- more -->
----------

Input
The first line of input contains N, the number of test cases. Each test case begins with an integer 4 <= M <= 20, the number of sticks. M integers follow; each gives the length of a stick - an integer between 1 and 10,000.

 

Output
For each case, output a line containing "yes" if is is possible to form a square; otherwise output "no".

 
```
Sample Input
3
4 1 1 1 1
5 10 20 30 40 50
8 1 7 2 6 4 4 3 5
 

Sample Output
yes
no
yes
```

 题意就是：看这个数组中的数字组合是否能够构成一个正方形
 不能分割数字，不能重复组合

代码：

```
#include<string.h>
#include<stdio.h>
#include<algorithm>
using namespace std;
int n,s,su,a[1010],vis[1010],len;
bool cmp(int a,int b)
{
    return a>b;//从大到小排序
}
void dfs(int a1,int a2,int a3)//(0,0,1)
{
    if(a1==3)/**只需要筹齐3次，那么剩下的一定能够成len长度**/
    {
        su=1;
        return ;
    }
    if(su==1)
        return ;/**优化时间**/
    for(int i=a3; i<=n; i++)
    {
  /**对于那些用过的和不符合条件的，for那里可以不扫,故从a3开始**/
   /**a3前面的对于最初的a2来说一定不符合**/
        if(vis[i]==0)
        {
            vis[i]=1;
            if(a2+a[i]==len)
            {
                dfs(a1+1,0,1);
                 /**但是换另外一条边的时候a3要改回1,因为那些未用的，对上一条边来说不符合条件的，可能符合这条边的条件**/
            }
            else if(a2+a[i]<len)
            {
                dfs(a1,a2+a[i],i+1);
                /**没筹齐从i+1继续，前面的不符合**/
                while(a[i]==a[i+1])
                    i++;
                    //回溯后如果后面的相同那么不需要再DFS
       //前面的数和后面的相同就可以跳过这个数，剪枝
            }
            vis[i]=0;
        }
    }
}

int main()
{
    int i;
    scanf("%d",&s);
    while(s--)
    {
        su=0;
        len=0;
        memset(vis,0,sizeof(vis));
        //memset函数在string.h头文件中
        scanf("%d",&n);
        for(i=1; i<=n; i++)
        {
            scanf("%d",&a[i]);
            len=len+a[i];
        }
        int mm=len/4;
        sort(a+1,a+n+1,cmp);
        //在algorithm头文件中
        if(len%4==0&&a[1]<=mm&&n>=4)
        {
            len/=4;
            dfs(0,0,1);
            if(su==1)
                printf("yes\n");
            else
                printf("no\n");
        }
        else
        {
            printf("no\n");
        }
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
