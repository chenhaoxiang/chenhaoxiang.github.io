---
layout: post
title: "结构体类型定义的一般式"
date: 2015-09-08 07:53:14 +0800
comments: true
categories: c-plus-plus
tags: [结构,struct,c++]
keyword: 陈浩翔, 谙忆
description: struct 结构体名说明 结构体类型是用户自定义类型，使用时需要按照规定的形式定义类型标识符，然后才能定义相应类型的变量。
---

```
struct 结构体名  
{  
    类型名1 域名1;   
    类型名2 域名2;  
    类型名3 域名3;  
    类型名4 域名4;  
    ...     ...  
    类型名n 域名n;  
};  
```
说明：结构体类型是用户自定义类型，使用时需要按照规定的  
形式定义类型标识符，然后才能定义相应类型的变量。

<!-- more -->
----------
 
例如：  
```c++
struct student  
/**定义了一个结构体类型，类型标识符为 struct student，其中包含5个域，  
分别用num代表姓名，sex代表性别，age代表年龄，score代表成绩  
**/  
{
    int num;
    char name[16];
    char sex;
    int age;
    float score;
};
struct student s1,s2;
/**用上面定义的结构体类型定义了2个结构体变量s1，s2存放任意2个学生的信息**/
struct student s[30];
/**定义了一个包含30个元素的结构体数组s，s用来存放30个学生的信息**/
```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
