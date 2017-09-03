---
layout: post
title: "课程设计，文件加密"
date: 2015-08-21 06:13:55 +0800
comments: true
categories: other
tags: [algorithm,c,encryption,decryption]
keyword: 陈浩翔, 谙忆,加密,解密
description: 小提示，密码文件需要自己先创建一个txt文件自己输入6个字符密码，路径与代码的运行路径在一起。。。题目 文件加文件的传输会有明文和密文的区别，明文发送时不安全的，用一个程序实现发送文件的加密和解密操作。加密算法，密钥设计由同学自己选现有的加密解密算法或是自己设计的。  要求： （1）对文件的字符根据加密算法，实现文件加密。（2）对操作给出必要的提示。 
---

题目：文件加密
  文件的传输会有明文和密文的区别，明文发送时不安全的，用一个程序实现发送文件的加密和解密操作。
  加密算法，密钥设计由同学自己选择现有的加密解密算法或是自己设计的。 

<!-- more -->
----------

小提示，密码文件需要自己先创建一个txt文件自己输入6个字符密码，路径与代码的运行路径在一起。。。
```
/*题目：文件加密
  文件的传输会有明文和密文的区别，明文发送时不安全的，用一个程序实现发送文件的加密和解密操作。
  加密算法，密钥设计由同学自己选择现有的加密解密算法或是自己设计的。
  要求：
    （1）对文件的字符根据加密算法，实现文件加密。
    （2）对操作给出必要的提示。
    （3）对存在的file1.txt文件，必须先打开，后读写，最后关闭。加密后的文件放在file2.txt。
    （4）解密文件保存在file3.txt中。
*/

#include <stdio.h>  // 标准输入输出函数
#include <stdlib.h>  // 标准库函数
#include <string.h>  // 字符串处理函数
#include  <conio.h>   //控制台输入输出函数
char password[6];//软件初始密码
int jiami();
int check(int type);
int jiemi();
int xianshi();
int zhucaidan();
int fuzhi();
int fanhui();
int gaimima();
int jieshu();
char infile[20];
char outfile[21];

int main()
{
    system("cls");
    // 操作前先校验密码
	if(!check(1))
    {
		printf("抱歉，3次输入密码错误。按任意键退出程序...");
		getchar();
		exit(0);
	}
	// 密码校验成功，显示程序菜单，执行各种操作
	 zhucaidan();
	 return 0;
}

int jiami()
{
    FILE *in;
    FILE *out;
    int i=0;
    char ch;
    char yuanzifu[100000];
    char gaiguodezifu[100000];
    system("cls"); // 清屏
    printf("╔════════════════════════════════════╗\n");
    printf("║                                    ║\n");
    printf("║    欢迎使用本软件进行文件加密      ║\n");
    printf("║                                    ║\n");
    printf("║          祝您体验愉快              ║\n");
    printf("║                                    ║\n");
    printf("╚════════════════════════════════════╝\n");
    printf("请输入需要加密的文件名(含路径)：");
    scanf("%s",infile);
    in=fopen(infile,"rb");//只读文件
    if(in==NULL)
    {
        printf("\n文件[%s]打开失败，请检查文件路径和名称是否输入正确！\n",infile);
        printf("\n按下任意键返回重新输入加密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return jiami();
    }
    printf("\n请输入加密后的文件名(含路径)：");
    scanf("%s",outfile);
    out=fopen(outfile,"wb");//只写文件
    if(out==NULL)
    {
        printf("文件[%s]创建/写入失败，请检查文件路径和名称是否输入正确！\n",outfile);
        printf("\n按下任意键返回重新输入加密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return jiami();
    }
     ch=fgetc(in);//读入一个字符
     while(ch!=EOF)//读入字符直到字符结束
    {
      yuanzifu[i]=ch;//将ch赋给字符串数组
      i++;
      ch=fgetc(in);//读入一个字符
    }
    int n;
    n=i;
    putchar(10);//空行
    printf("原文件内容如下：\n");
    printf("%s\n",yuanzifu);
    //printf("n=%d",n);
    for(i=0;i<n;i++)
    {
        int s=1;
        int m=3000;
        gaiguodezifu[i]=yuanzifu[i]+s*s-m;//进行字符加密处理
        s++;
        m--;
        if(s>5000)
        {
            s=1;
        }
    }
    //printf("%s",gaiguodezifu);
    for(i=0;i<n;i++)
    {
        ch=gaiguodezifu[i];
        fputc(ch,out);
       // putchar(ch);
    }
    putchar(10);
    printf("加密后的文件内容如下：\n");
    printf("%s",gaiguodezifu);
    putchar(10);
    printf("\n按下任意字符后继续:");
    system("pause");//输入任意字符后进行下一步，也就是让输出停留
    fclose(in);
    fclose(out);
    system("cls"); // 清屏
    printf("\n\n恭喜你，文件[%s]加密成功，保存在[%s]。\n", infile, outfile);
    printf("\n\n输入任意字符进行选择下一操作");
    system("pause");
	return fanhui();
}


int jiemi()
{
    system("cls");// 清屏
    FILE *in;
    FILE *out;
    int i=0;
    char ch;
    char yuanzifu[100000];
    char gaiguodezifu[100000];
    printf("╔════════════════════════════════════╗\n");
    printf("║                                    ║\n");
    printf("║    欢迎使用本软件进行文件解密      ║\n");
    printf("║                                    ║\n");
    printf("║          祝您体验愉快              ║\n");
    printf("║                                    ║\n");
    printf("╚════════════════════════════════════╝\n");
    printf("请输入需要解密的文件名(含路径)：");
    scanf("%s",infile);
    in=fopen(infile,"rb");//只读文件
    if(in==NULL)
    {
        printf("\n文件[%s]打开失败，请检查文件路径和名称是否输入正确！\n",infile);
        printf("\n按下任意键返回重新输入解密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return jiemi();
    }
    printf("\n请输入解密后的文件名(含路径)：");
    scanf("%s",outfile);
    out=fopen(outfile,"wb");//只写文件
    if(out==NULL)
    {
        printf("文件[%s]创建/写入失败，请检查文件路径和名称是否输入正确！\n",outfile);
        printf("\n按下任意键返回重新输入解密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return jiemi();
    }
     ch=fgetc(in);//读入一个字符
     while(ch!=EOF)//读入字符直到字符结束
    {
      yuanzifu[i]=ch;//将ch赋给字符串数组
      i++;
      ch=fgetc(in);//读入一个字符
    }
    int n;
    n=i;
    putchar(10);//空行
    printf("加密文件内容如下：\n");
    printf("%s\n",yuanzifu);
    //printf("n=%d",n);
    for(i=0;i<n;i++)
    {
        int s=1;
        int m=3000;
        gaiguodezifu[i]=yuanzifu[i]-s*s+m;//进行字符解密处理
        s++;
        m--;
        if(s>5000)
        {
            s=1;
        }
    }
    //printf("%s",gaiguodezifu);
    for(i=0;i<n;i++)
    {
        ch=gaiguodezifu[i];
        fputc(ch,out);
       // putchar(ch);
    }
    putchar(10);
    printf("解密后的文件内容如下：\n");
    printf("%s",gaiguodezifu);
    putchar(10);
    printf("\n按下任意字符后继续...");
    system("pause");//输入任意字符后进行下一步，也就是让输出停留
    fclose(in);
    fclose(out);
    system("cls"); // 清屏
    printf("\n\n恭喜你，文件[%s]解密成功，保存在[%s]。\n", infile, outfile);
    printf("\n\n输入任意字符进行选择下一操作...");
    system("pause");
	return fanhui();
}

int xianshi()
{
    FILE *in;
    char ch2;
    system("cls");
    printf("************************************\n");
    printf("**   欢迎使用本软件进行文件显示   **\n");
    printf("**         祝您体验愉快           **\n");
    printf("************************************\n");
    printf("\n\n请输入需要显示的文件（包含路径）：");
    scanf("%s",infile);
    in=fopen(infile,"rb");
    if(in==NULL)
    {
        printf("\n打开文件错误，请检查文件名（路径），按任意键重新输入...");
        system("pause");
        return xianshi();
    }
    while(ch2!=EOF)
    {
        ch2=fgetc(in);
        putchar(ch2);
    }
    printf("\n\n按下任意键进入下一选项...");
    system("pause");
    return fanhui();
}

int check(int a)
{
    int i;
    char ch3[6];
    FILE *in;
    in=fopen("mima.txt","r+");
    if(in==NULL)
    {
        printf("\n\n密码文件错误，请检查...\n");
        exit(0);
    }
    for(i=0;i<6;i++)
    {
        ch3[i]=fgetc(in);
    }
    for(i=0;i<6;i++)
    password[i]=ch3[i];
   // printf("%s",password);
	char pwd[6];  //用户输入的密码
	int trytimes;  // 用户尝试输入密码的次数
	printf("作者：陈浩翔 \n");
    printf("\n程序设置了密码，验证通过后才能使用。请输入6位数字密码：");
	for(trytimes=1; trytimes<=3; trytimes++)
    {
		scanf("%s",pwd);
		fflush(stdin);/*清空输入缓冲区。
                        比如scanf("%d",&a);
                            scanf("%c",&c);
                   经常如果这种情况的话，
                   第一次输入的回车可能会被第二次输入操作所捕捉，
                   这个的作用就是清空缓冲，这样就不会出现这种情况了。*/
		if(pwd[0]==password[0]&&pwd[1]==password[1]&&pwd[2]==password[2]&&pwd[3]==password[3]&&pwd[4]==password[4]&&pwd[5]==password[5])
        {
			return 1;
			break;
		}
		else
		if(trytimes==3)
		{
			return 0;
		}
		else
        {
			printf("抱歉，密码错误，您还有%d次机会：", 3-trytimes);
		}
	}
	return 0;
}
int zhucaidan()
{
    system("cls");//清屏
    printf("****************************************************\n");
    printf("**             欢迎来到文件加密解密界面           **\n");
    printf("**                信息科学与工程学院              **\n");
    printf("**                     软件作者：                 **\n");
    printf("**                1406102-15  陈浩翔              **\n");
    printf("**                                                **\n");
    printf("**               请选择即将进行的操作             **\n");
    printf("**               输入1：加密文件                  **\n");
    printf("**               输入2：解密文件                  **\n");
    printf("**               输入3：显示文件内容              **\n");
    printf("**               输入4：将原文件内容复制到另一文件**\n");
    printf("**               输入5：修改程序密码              **\n");
    printf("**               输入6：退出软件                  **\n");
    printf("****************************************************\n");
    int b;
    scanf("%d",&b);
    switch(b)
    {
        case 1:jiami();break;
        case 2:jiemi();break;
        case 3:xianshi();break;
        case 4:fuzhi();break;
        case 5:gaimima();break;
        case 6:jieshu();break;
        default:
                {
                    printf("没有相应的菜单！按任意键返回...");
                    system("pause");
                    return zhucaidan();
                }
        return 0;
    }
}//bug1:在主菜单输入多个字母会自动跳到加密文件菜单；

int fuzhi()
{
    system("cls");//清屏
    printf("╔════════════════════════════════════╗\n");
    printf("║                                    ║\n");
    printf("║    欢迎使用本软件进行文件复制      ║\n");
    printf("║                                    ║\n");
    printf("║          祝您体验愉快              ║\n");
    printf("║                                    ║\n");
    printf("╚════════════════════════════════════╝\n");
    FILE *in1,*out1;
    char ch1;
    printf("请输入需要加密的文件名(含路径)：");
    scanf("%s",infile);
    in1=fopen(infile,"rb");//只读文件
    if(in1==NULL)
    {
        printf("\n文件[%s]打开失败，请检查文件路径和名称是否输入正确！\n",infile);
        printf("\n按下任意键返回重新输入加密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return fuzhi();
    }
    printf("\n请输入加密后的文件名(含路径)：");
    scanf("%s",outfile);
    out1=fopen(outfile,"wb");//只写文件
    if(out1==NULL)
    {
        printf("文件[%s]创建/写入失败，请检查文件路径和名称是否输入正确！\n",outfile);
        printf("\n按下任意键返回重新输入加密文件....");
        system("pause");//输入任意字符后进行下一步，也就是让输出停留
        return fuzhi();
    }
    while(!feof(in1))//如果没有遇到输入文件的结束标志
        //feof(in)是检查in指向的文件是否结束
    {
        ch1=fgetc(in1);//从输入文件读入一个字符，暂时放在变量ch中
        fputc(ch1,out1);//将ch写到out指向的文件中
        putchar(ch1);
    }
    putchar(10);
    fclose(in1);
    fclose(out1);
    return fanhui();
}

int fanhui()
{
      system("cls");//清屏
      int m;
      system("cls");
      printf("############################################\n");
      printf("##           操作成功，请进行选择         ##\n");
      printf("##           1：进入加密菜单              ##\n");
      printf("##           2：进入解密菜单              ##\n");
      printf("##           3：进入显示文件内容菜单      ##\n");
      printf("##           4：进入文件复制菜单          ##\n");
      printf("##           5：返回主菜单                ##\n");
      printf("##           6：退出程序                  ##\n");
      printf("############################################\n");
      scanf("%d",&m);
      switch(m)
      {
          case 1:jiami();break;
          case 2:jiemi();break;
          case 3:xianshi();break;
          case 4:fuzhi();break;
          case 5:main();break;
          case 6:jieshu();break;
          default:
         {
          printf("没有对应选项，按任意键返回");
          system("pause");//输入任意字符后进行下一步，也就是让输出停留
          return fanhui();
         }
      }
}

int gaimima()
{
    system("cls");
    int i;
    char ch[6];
    char cha[6];
    FILE *in;
    in=fopen("mima.txt","w+");
    if(in==NULL)
    {
        printf("\n\n打开（建立）文件出错...\n");
        exit(0);
    }
    getchar();
    printf("\n请输入6个新密码字符或数字：");
    for(i=0;i<6;i++)
    {
        scanf("%c",&ch[i]);
    }
    getchar();
    printf("\n\n请再输入一次6个新密码字符或数字：");
    for(i=0;i<6;i++)
    {
        scanf("%c",&cha[i]);
    }

    for(i=0;i<6;i++)
    {
        if(ch[i]!=cha[i])
        {
            printf("2次输入的密码不同，请重新输入：");
            system("pause");
            return gaimima();
        }
        continue;
    }
    for(i=0;i<6;i++)
    {
        password[i]=ch[i];
    }
    for(i=0;i<6;i++)
    {
        fputc(password[i],in);
    }
    fclose(in);
    printf("按下任意键返回主菜单...");
    system("pause");
    return main();
}

int jieshu()
{
    system("cls");
    printf("***************************\n");
    printf("** 欢迎下次再使用本软件  **\n");
    printf("**    ( ^_^ )/~~拜拜     **\n");
    printf("***************************\n");
    return ;
}

```
我上传部分运行图片：
![密码错误时](http://img.blog.csdn.net/20150821181037970)

![正确的密码](http://img.blog.csdn.net/20150821181130293)

![主界面](http://img.blog.csdn.net/20150821181154033)

![显示文件内容](http://img.blog.csdn.net/20150821181222344)

![结束](http://img.blog.csdn.net/20150821181253954)

大一下期课程设计。

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
