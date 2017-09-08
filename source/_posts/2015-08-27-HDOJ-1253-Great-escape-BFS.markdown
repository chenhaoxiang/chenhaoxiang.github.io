---
layout: post
title: "HDOJ 1253 胜利大逃亡 BFS"
date: 2015-08-27 04:12:24 +0800
comments: true
categories: acm-c
tags: [bfs,acm,c]
keyword: 陈浩翔, 谙忆
description: 胜利大逃亡Ignatius被魔王抓走了,有一天魔王出差去了,这可是Ignatius逃亡的好机会
---

Problem Description  
Ignatius被魔王抓走了,有一天魔王出差去了,这可是Ignatius逃亡的好机会.  

魔王住在一个城堡里,城堡是一个A*B*C的立方体,可以被表示成A个B*C的矩阵,刚开始Ignatius被关在(0,0,0)的位置,离开城堡的门在(A-1,B-1,C-1)的位置,现在知道魔王将在T分钟后回到城堡,Ignatius每分钟能从一个坐标走到相邻的六个坐标中的其中一个.现在给你城堡的地图,请你计算出Ignatius能否在魔王回来前离开城堡(只要走到出口就算离开城堡,如果走到出口的时候魔王刚好回来也算逃亡成功),如果可以请输出需要多少分钟才能离开,如果不能则输出-1.

<!-- more -->
----------

![](http://img.blog.csdn.net/20150828102336698)   

Input  
输入数据的第一行是一个正整数K,表明测试数据的数量.每组测试数据的第一行是四个正整数A,B,C和T(1<=A,B,C<=50,1<=T<=1000),它们分别代表城堡的大小和魔王回来的时间.然后是A块输入数据(先是第0块,然后是第1块,第2块......),每块输入数据有B行,每行有C个正整数,代表迷宫的布局,其中0代表路,1代表墙.(如果对输入描述不清楚,可以参考Sample Input中的迷宫描述,它表示的就是上图中的迷宫) 

特别注意:本题的测试数据非常大,请使用scanf输入,我不能保证使用cin能不超时.在本OJ上请使用Visual C++提交.  


Output  
对于每组测试数据,如果Ignatius能够在魔王回来前离开城堡,那么请输出他最少需要多少分钟,否则输出-1.  

Sample Input
```
1
3 3 4 20
0 1 1 1
0 0 1 1
0 1 1 1
1 1 1 1
1 0 0 1
0 1 1 1
0 0 0 0
0 1 1 0
0 1 1 0
```

Sample Output  
11  
 
 

```c++
#include <iostream>
#include <stdio.h>
#include<memory.h>
#include <queue>
#include<algorithm>
#include<string.h>
#include<stdio.h>
#define N 50
using namespace std;
struct node
{
    int x,y,z;
    int time;
};
int directions[6][3]={ {1,0,0},{0,1,0},{0,0,1},{-1,0,0},{0,-1,0},{0,0,-1} };
int a,b,c,t;
int map[N][N][N];
node my,cur,nextt;
//用next提交会ce，不能用next的原因是，next可能是其他意思

int BFS(int x,int y,int z)
{

    queue<node>q;/**queue类是为程序员提供了一个队列的功能的容器适配器，
    具体而言，一个FIFO（先入先出）的数据结构**/
    my.x=x;
    my.y=y;
    my.z=z;
    my.time=0;
    q.push(my);/**push()会将一个元素置入queue中。**/
    while(!q.empty())/**empty()判断队列空，当队列空时，返回true。**/
    {
        cur=q.front();/**front()会返回queue内的第一个元素(也就是第一个被置入的元素)。**/
        q.pop();
        /**pop()会从queue中移除一个元素。
注意：pop()虽然会移除下一个元素，但是并不返回它，
front()和back()返回下一个元素但并不移除该元素。**/
        for(int i=0;i<6;i++)
        {
            nextt.x=cur.x+directions[i][0];
            nextt.y=cur.y+directions[i][1];
            nextt.z=cur.z+directions[i][2];
            if(nextt.x<a&&nextt.y<b&&nextt.z<c&&nextt.x>=0&&nextt.y>=0&&nextt.z>=0&&map[nextt.x][nextt.y][nextt.z]!=1&&nextt.time<=t)
            {

                if(nextt.x==a-1&&nextt.y==b-1&&nextt.z==c-1)  /**如果找到了出口 返回当前走的步数**/
                    return cur.time+1;
                nextt.time=cur.time+1;                       /**下一步可以走该方向，将该方向的信息完善后打入队列中**/
                q.push(nextt);/**push()会将一个元素置入queue中。**/
                map[nextt.x][nextt.y][nextt.z]=1;              /**标记一下该方向的节点已经走过**/
            }
        }
    }
    return -1;
}

int main()
{
    int sum,i,j,x,k;
    scanf("%d",&x);
    while(x--)
    {
        scanf("%d%d%d%d",&a,&b,&c,&t);
            for(i=0;i<a;i++)
                {
                    for(k=0;k<b;k++)
                    {
                        for(j=0;j<c;j++)
                        {
                            scanf("%d",&map[i][k][j]);
                        }
                    }
                }
        sum=BFS(0,0,0);
        printf("%d\n",sum);
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