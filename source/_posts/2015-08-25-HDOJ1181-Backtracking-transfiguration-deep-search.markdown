---
layout: post
title: "HDOJ1181变形课 深搜回溯"
date: 2015-08-25 10:28:06 +0800
comments: true
categories: acm-c
tags: [acm,HDOJ,c]
keyword: 陈浩翔, 谙忆
description: 变形课上Harry碰到了一点小麻烦,因为他并不像Hermione那样能够记住所有的咒语而随意的将一个棒球变成刺猬什么的,但是他发现了变形咒语的一个统一规律:如果咒语是以a开头b结尾的一个单词,那么它的作用就恰好是使A物体变成B物体. Harry已经将他所会的所有咒语都列成了一个表,他想让你帮忙计算一下他是否能完成老师的作业,将一个B(ball)变成一个M(Mouse),你知道,如果他自己不能完成的话,他就只好向Hermione请教,并且被迫听一大堆好好学习的道理.
---
Problem Description
呃......变形课上Harry碰到了一点小麻烦,因为他并不像Hermione那样能够记住所有的咒语而随意的将一个棒球变成刺猬什么的,但是他发现了变形咒语的一个统一规律:如果咒语是以a开头b结尾的一个单词,那么它的作用就恰好是使A物体变成B物体. 
Harry已经将他所会的所有咒语都列成了一个表,他想让你帮忙计算一下他是否能完成老师的作业,将一个B(ball)变成一个M(Mouse),你知道,如果他自己不能完成的话,他就只好向Hermione请教,并且被迫听一大堆好好学习的道理.

<!-- more -->
---------- 

Input
测试数据有多组。每组有多行，每行一个单词,仅包括小写字母,是Harry所会的所有咒语.数字0表示一组输入结束.

 

Output
如果Harry可以完成他的作业,就输出"Yes.",否则就输出"No."(不要忽略了句号)

 ```
Sample Input
so
soon
river
goes
them
got
moon
begin
big
0
 

Sample Output
Yes.
```
HintHint 
Harry 可以念这个咒语:"big-got-them".

这个代码还是很容易理解的，经典的DFS
不过对于没超时，我感到意外哈
我是从m往b搜索的
```c
#include<stdlib.h>
#include<stdio.h>
#include <string.h>
using namespace std;
char a[1000][50];
int len[1000];
int k;int flag;
bool vis[1000];
void dfs(char x)
{
    if(x=='b')
        {
            flag=1;
            return ;
        }
    if(flag==1)
    {
        return;
    }
    for(int i=0;i<k;i++)
    {
        //printf("vis[%d]=%d\n",i,vis[i]);
        if(vis[i]==0)
        {
            if(a[i][len[i]]==x)
            {
   // printf("a[%d][%d]=%c\n",i,len[i],a[i][len[i]]);
                vis[i]=1;
               // printf("x=%c\n",x);
                dfs(a[i][0]);
               // printf("x=%c\n",x);
                vis[i]=0;
            }
        }
    }
}
int main()
{
    while(scanf("%s",a[0])!=EOF)
    {
        flag=0;
         int i=0;
        if(a[0][0]=='0')
        {
            printf("no.\n");
            continue;
        }
        memset(vis,0,sizeof(vis));
        while(a[i][0]!='0')
        {
            len[i]=strlen(a[i])-1;
            i++;
            scanf("%s",a[i]);
        }
        k=i;
        dfs('m');
        if(flag==1)
            printf("Yes.\n");
        else
            printf("No.\n");

    }
}

```
下面这段代码是从b往m搜索的，差不多

```
#include<stdlib.h>
#include<stdio.h>
#include <string.h>
using namespace std;
char a[1000][50];
int len[1000];
int k;int flag;
bool vis[1000];
void dfs(char x)
{
    if(x=='m')
        {
            flag=1;
            return ;
        }
    if(flag==1)
    {
        return;
    }
    for(int i=0;i<k;i++)
    {
        //printf("vis[%d]=%d\n",i,vis[i]);
        if(vis[i]==0)
        {
            if(a[i][0]==x)
            {
               // printf("a[%d][%d]=%c\n",i,len[i],a[i][len[i]]);
                vis[i]=1;
               // printf("x=%c\n",x);
                dfs(a[i][len[i]]);
               // printf("x=%c\n",x);
                vis[i]=0;
            }
        }
    }
}
int main()
{
    while(scanf("%s",a[0])!=EOF)
    {
        flag=0;
         int i=0;
        if(a[0][0]=='0')
        {
            printf("no.\n");
            continue;
        }
        memset(vis,0,sizeof(vis));
        while(a[i][0]!='0')
        {
            len[i]=strlen(a[i])-1;
            i++;
            scanf("%s",a[i]);
        }
        k=i;
        dfs('b');
        if(flag==1)
            printf("Yes.\n");
        else
            printf("No.\n");

    }
}

```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
