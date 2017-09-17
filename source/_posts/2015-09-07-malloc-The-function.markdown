---
layout: post
title: "malloc函数详解"
date: 2015-09-07 10:58:31 +0800
comments: true
categories: c-plus-plus
tags: [函数,栈,malloc]
keyword: 陈浩翔, 谙忆
description: 陈浩翔
---

一、原型：extern void *malloc(unsigned int num_bytes);

头文件：#include  或 #include  (注意：alloc.h 与 malloc.h 的内容是完全一致的。)

功能：分配长度为num_bytes字节的内存块

说明：如果分配成功则返回指向被分配内存的指针，否则返回空指针NULL。

<!-- more -->
----------

<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>一、原型：extern void *malloc(unsigned int num_bytes);</strong></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
头文件：#include &lt;malloc.h&gt; 或 #include &lt;alloc.h&gt; (注意：alloc.h 与 malloc.h 的内容是完全一致的。)</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
功能：分配长度为num_bytes字节的内存块</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
说明：如果分配成功则返回指向被分配内存的指针，否则返回空指针NULL。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
当内存不再使用时，应使用free()函数将内存块释放。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
举例：<br>
</p>
<div class="dp-highlighter bg_c-sharp" style="font-family:Consolas,'Courier New',Courier,mono,serif; background-color:rgb(231,229,220); width:700.90625px; overflow:auto; padding-top:1px; margin:18px 0px!important">
<div class="bar" style="padding-left:45px">
<div class="tools" style="padding:3px 8px 10px 10px; font-size:9px; font-family:Verdana,Geneva,Arial,Helvetica,sans-serif; color:silver; background-color:rgb(248,248,248); border-left-width:3px; border-left-style:solid; border-left-color:rgb(108,226,108)">
<strong>[c-sharp]</strong>&nbsp;<a target="_blank" target="_blank" href="http://blog.csdn.net/xw13106209/article/details/4962479#" class="ViewSource" title="view plain" style="color:rgb(160,160,160); text-decoration:none; background-color:inherit; border:none; padding:1px; margin:0px 10px 0px 0px; font-size:9px; display:inline-block; width:16px; height:16px; text-indent:-2000px">view
 plain</a><a target="_blank" target="_blank" href="http://blog.csdn.net/xw13106209/article/details/4962479#" class="CopyToClipboard" title="copy" style="color:rgb(160,160,160); text-decoration:none; background-color:inherit; border:none; padding:1px; margin:0px 10px 0px 0px; font-size:9px; display:inline-block; width:16px; height:16px; text-indent:-2000px">copy</a>
<div style="position:absolute; left:557px; top:723px; width:18px; height:18px; z-index:99">
</div>
</div>
</div>
<ol start="1" class="dp-c" style="padding:0px; border:none; list-style-position:initial; background-color:rgb(255,255,255); color:rgb(92,92,92); margin:0px 0px 1px 45px!important">
<li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit"><span class="preprocessor" style="margin:0px; padding:0px; border:none; color:gray; background-color:inherit">#include&lt;stdio.h&gt;</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit"><span class="preprocessor" style="margin:0px; padding:0px; border:none; color:gray; background-color:inherit">#include&lt;malloc.h&gt;</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;&nbsp;</span></span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit"><span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">int</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;main()&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">{&nbsp;&nbsp;</span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">char</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;*p;&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;</span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;p=(<span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">char</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;*)malloc(100);&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">if</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">(p)&nbsp;&nbsp;</span></span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(<span class="string" style="margin:0px; padding:0px; border:none; color:blue; background-color:inherit">&quot;Memory&nbsp;Allocated&nbsp;at:&nbsp;%x/n&quot;</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">,p);&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">else</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;&nbsp;</span></span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(<span class="string" style="margin:0px; padding:0px; border:none; color:blue; background-color:inherit">&quot;Not&nbsp;Enough&nbsp;Memory!/n&quot;</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">);&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;free(p);&nbsp;&nbsp;</span></li><li class="alt" style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; color:inherit; line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="margin:0px; padding:0px; border:none; color:rgb(0,102,153); background-color:inherit; font-weight:bold">return</span><span style="margin:0px; padding:0px; border:none; background-color:inherit">&nbsp;0;&nbsp;&nbsp;</span></span></li><li style="border-style:none none none solid; border-left-width:3px; border-left-color:rgb(108,226,108); list-style:decimal-leading-zero outside; background-color:rgb(248,248,248); line-height:18px; margin:0px!important; padding:0px 3px 0px 10px!important">
<span style="margin:0px; padding:0px; border:none; color:black; background-color:inherit">}&nbsp;&nbsp;</span></li></ol>
</div>
<p></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>二、函数声明(函数原型)：</strong></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　void *malloc(int size);</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　说明：malloc 向系统申请分配指定size个字节的内存空间。返回类型是 void* 类型。void* 表示未确定类型的指针。C,C&#43;&#43;规定，void* 类型可以强制转换为任何其它类型的指针。这个在MSDN上可以找到相关的解释，具体内容如下：</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>malloc</strong>&nbsp;returns a void pointer to the allocated space, or&nbsp;<strong>NULL</strong>&nbsp;if there is insufficient memory available. To return a pointer to a type other than&nbsp;<strong>void</strong>, use a type cast on the return value. The storage space
 pointed to by the return value is guaranteed to be suitably aligned for storage of any type of object. If size is 0,&nbsp;<strong>malloc</strong>&nbsp;allocates a zero-length item in the heap and returns a valid pointer to that item. Always check the return from&nbsp;<strong>malloc</strong>,
 even if the amount of memory requested is small.</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>三、malloc与new的不同点</strong></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　从函数声明上可以看出。malloc 和 new 至少有两个不同:&nbsp;<em><strong>new 返回指定类型的指针，并且可以自动计算所需要大小。</strong></em>比如：</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *p;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　p = new int; //返回类型为int* 类型(整数型指针)，分配大小为 sizeof(int);</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　或：</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　int* parr;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　parr = new int [100]; //返回类型为 int* 类型(整数型指针)，分配大小为 sizeof(int) * 100;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　&nbsp;&nbsp;&nbsp;<em><strong>而 malloc 则必须由我们计算要字节数，并且在返回后强行转换为实际类型的指针。</strong></em></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;&nbsp; 　int* p;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　p = (int *) malloc (sizeof(int));</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　第一、malloc 函数返回的是 void * 类型，如果你写成：p = malloc (sizeof(int)); 则程序无法通过编译，报错：“不能将 void* 赋&#20540;给 int * 类型变量”。所以必须通过 (int *) 来将强制转换。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　第二、函数的实参为 sizeof(int) ，用于指明一个整型数据需要的大小。如果你写成：</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　int* p = (int *) malloc (1);</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　代码也能通过编译，但事实上只分配了1个字节大小的内存空间，当你往里头存入一个整数，就会有3个字节无家可归，而直接“住进邻居家”！造成的结果是后面的内存中原有数据内容全部被清空。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　malloc 也可以达到 new [] 的效果，申请出一段连续的内存，方法无非是指定你所需要内存大小。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　比如想分配100个int类型的空间：</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　int* p = (int *) malloc ( sizeof(int) * 100 ); //分配可以放得下100个整数的内存空间。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　另外有一点不能直接看出的区别是，malloc 只管分配内存，并不能对所得的内存进行初始化，所以得到的一片新内存中，其&#20540;将是随机的。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
　　除了分配及最后释放的方法不一样以外，通过malloc或new得到指针，在其它操作上保持一致。</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
&nbsp;</p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
<strong>&nbsp;总结：</strong></p>
<p style="color:rgb(51,51,51); font-family:Arial; font-size:14px; line-height:26px">
malloc()函数其实就在内存中找一片指定大小的空间，然后将这个空间的首地址范围给一个指针变量，这里的指针变量可以是一个单独的指针，也可以是一个数组的首地址，这要看malloc()函数中参数size的具体内容。我们这里malloc分配的内存空间在逻辑上连续的，而在物理上可以连续也可以不连续。对于我们程序员来说，我们关注的是逻辑上的连续，因为操作系统会帮我们安排内存分配，所以我们使用起来就可以当做是连续的。</p>


本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
