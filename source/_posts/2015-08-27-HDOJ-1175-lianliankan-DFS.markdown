---
layout: post
title: "HDOJ 1175 连连看 DFS"
date: 2015-08-27 10:40:07 +0800
comments: true
categories: acm-c
tags: [dfs,acm,c]
keyword: 陈浩翔, 谙忆
description: 连连看 
Time Limit: “连连看”相信很多人都玩过。没玩过也没关系，下面我给大家介绍一下游戏规则 在一个棋盘中，放了很多的棋子。如果某两个相同的棋子，可以通过一条线连起来（这条线不能经过其它棋子），而且线的转折次数不超过两次，那么这两个棋子就可以在棋盘上消去。不好意思，由于我以前没有玩过连连看，咨询了同学的意见，连线不能从外面绕过去的，但事实上这是错的。现在已经酿成大祸，就只能将错就错了，连线不能从外围绕过。 
---

连连看  
Problem Description  
“连连看”相信很多人都玩过。没玩过也没关系，下面我给大家介绍一下游戏规则：在一个棋盘中，放了很多的棋子。如果某两个相同的棋子，可以通过一条线连起来（这条线不能经过其它棋子），而且线的转折次数不超过两次，那么这两个棋子就可以在棋盘上消去。不好意思，由于我以前没有玩过连连看，咨询了同学的意见，连线不能从外面绕过去的，但事实上这是错的。现在已经酿成大祸，就只能将错就错了，连线不能从外围绕过。  
玩家鼠标先后点击两块棋子，试图将他们消去，然后游戏的后台判断这两个方格能不能消去。现在你的任务就是写这个后台程序。  

<!-- more -->
----------

Input  
输入数据有多组。每组数据的第一行有两个正整数n,m
(0 < n<=1000,0< m<1000)，分别表示棋盘的行数与列数。在接下来的n行中，每行有m个非负整数描述棋盘的方格分布。0表示这个位置没有棋子，正整数表示棋子的类型。接下来的一行是一个正整数q(0< q<50)，表示下面有q次询问。在接下来的q行里，每行有四个正整数x1,y1,x2,y2,表示询问第x1行y1列的棋子与第x2行y2列的棋子能不能消去。n=0,m=0时，输入结束。  
注意：询问之间无先后关系，都是针对当前状态的！   

Output  
每一组输入数据对应一行输出。如果能消去则输出"YES",不能则输出"NO"。  

Sample Input
```
3 4
1 2 3 4
0 0 0 0
4 3 2 1
4
1 1 3 4
1 1 2 4
1 1 3 3
2 1 2 4
3 4
0 1 4 3
0 2 4 1
0 0 0 0
2
1 1 2 4
1 3 2 3
0 0
```

Sample Output
```
YES
NO
NO
NO
NO
YES
```
必须要有的剪枝就是：  
当转向2次后，来判定当前的点和终点 是否在同一条线路，如果不在同一条线路就直接返回。  

```c++
/**判断拐角的:建立两个拐角变量,记录未开始拐角的坐标lastx,lasty,
如果出现拐角的话,条件就是:x!=lastx&&y!=lasty,
这样就可以拐角叠加了,另外更新一下当前的拐角坐标即可.**/
#include <iostream>
#include<stdio.h>
#include<algorithm>
#include<string.h>
#include<stdlib.h>
#include<math.h>
using namespace std;
int n,m;
int mapp[1010][1010];
int flag[1010][1010];
int q;
int s1,t1,s2,t2;
int tk;/**拐角的数量**/
int dir[4][2]={ {-1,0},{1,0},{0,-1},{0,1} };
int lastx,lasty;
int dfs(int a,int b)
{
    if(a==s2&&b==t2&&tk<=2)
        return 1;
    if(tk==2&&a!=s2&&b!=t2)
        return 0;
    for(int i=0;i<4;i++)
    {
        int tx=a+dir[i][0];
        int ty=b+dir[i][1];
        /**路上除了碰到终点和0，其余的都是路障**/
        if(tx>=1&&tx<=n&&ty>=1&&ty<=m&&(mapp[tx][ty]==0||(tx==s2&&ty==t2))&&flag[tx][ty]==0)
        {
            /**开始计算拐角，如果拐角了，修改拐角坐标，并叠加
            超过2的拐角不DFS下去，反之DFS下去
            没有发生拐角的同样可以dfs下去**/
            if(tx!=lastx&&ty!=lasty&&tk<2)
            {
                tk++;
                int tmpx=lastx,tmpy=lasty;
                lastx=tx;lasty=ty;
                flag[tx][ty]=1;
                if(dfs(tx,ty)==1)
                    return 1;
                tk--;
                lastx=tmpx,lasty=tmpy;
                flag[tx][ty]=0;
            }
            else
                if(tx==lastx||ty==lasty)
            {
                flag[tx][ty]=1;
                if(dfs(tx,ty)==1)
                    return 1;
                flag[tx][ty]=0;
            }
        }
    }
    return 0;
}
int main()
{
    while(~scanf("%d%d",&n,&m)&&(n||m))
    {
        for(int i=1;i<=n;i++)
        {
            for(int j=1;j<=m;j++)
            {
                scanf("%d",&mapp[i][j]);
                flag[i][j]=0;
            }
        }
        scanf("%d",&q);
        for(int i=0;i<q;i++)
        {
            scanf("%d%d%d%d",&s1,&t1,&s2,&t2);
            /**判断特殊情况**/
            if(mapp[s1][t1]!=mapp[s2][t2]||(s1==s2&&t1==t2)||mapp[s1][t1]==0&&mapp[s2][t2]==0)
            {
                printf("NO\n");
                continue;
            }
            memset(flag,0,sizeof(flag));
            tk=0;
            lastx=s1,lasty=t1;/**一开始的拐角坐标就是起始坐标**/
            if(dfs(s1,t1)==1)
                printf("YES\n");
            else
                printf("NO\n");
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