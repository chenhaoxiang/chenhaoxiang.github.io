---
layout: post
title: "[C++]C++栈和队列"
date: 2015-08-28 10:46:04 +0800
comments: true
categories: c-plus-plus
tags: [栈,c语言,队列]
keyword: 陈浩翔, 谙忆
description: 使用标准库的栈和队列时，先包含相关的头文件#include<stack>
---

c++栈和队列的操作以及实例

<!-- more -->
----------

使用标准库的栈和队列时，先包含相关的头文件

```
#include<stack>
#include<queue>
```
定义栈如下：

```
stack<int> stk;
```

定义队列如下：

```
queue<int> q;
```

栈提供了如下的操作

```
s.empty()               如果栈为空返回true，否则返回false  
s.size()                返回栈中元素的个数  
s.pop()                 删除栈顶元素但不返回其值  
s.top()                 返回栈顶的元素，但不删除该元素  
s.push()                在栈顶压入新元素  
```

队列提供了下面的操作

```

q.empty()               如果队列为空返回true，否则返回false  
q.size()                返回队列中元素的个数  
q.pop()                 删除队列首元素但不返回其值  
q.front()               返回队首元素的值，但不删除该元素  
q.push()                在队尾压入新元素  
q.back()                返回队列尾元素的值，但不删除该元素  
```
c++stack(堆栈）

 

它是一个容器的改编，它实现了一个先进后出的数据结构（FILO）

使用该容器时需要包含#include头文件；

定义stack对象的示例代码如下：

stacks1;

stacks2;

stack的基本操作有：

1.入栈：如s.push(x);

2.出栈:如 s.pop().注意：出栈操作只是删除栈顶的元素，并不返回该元素。

3.访问栈顶：如s.top();

4.判断栈空：如s.empty().当栈空时返回true。

5.访问栈中的元素个数，如s.size（）;

下面举一个简单的例子：

```c++
  #include<iostream>  
    #include<stack>  
    using namespace std;  
    int main(void)  
    {  
        stack<double>s;//定义一个栈  
        for(int i=0;i<10;i++)  
            s.push(i);  
        while(!s.empty())  
        {  
            printf("%lf\n",s.top());  
            s.pop();  
        }  
        cout<<"栈内的元素的个数为："<<s.size()<<endl; 
    }
```
栈是限定仅在表尾进行插入或删除操作的线性表，  
因此表尾端成为栈顶，相应的，表头端成为栈底，不含有任何元素的栈称为空栈。  
栈的修改遵循后进先出的原则，因此栈又称为后进先出的线性表，简称LIFO结构。  
栈一般采用数组作为其存储结构，这样做可以避免使用指针，简化程序  
，当然数组需要预先声明静态数据区的大小，但这不是问题，因为即便是频繁进出入栈操作，  
任何时刻栈元素的实际个数也不会很多，为栈预留一个足够大但又不占用太多空间并不是很困难，  
如果不能做到这一点，那么节省内存的方法就是使用链表存储栈。  
 
线性表实现栈的基本操作  
```c++
    #include<iostream>  
    #include<cstdio>  
    using namespace std;  
    typedef struct Stacknode//定义链式栈的结构体  
    {  
        int data;//数据域  
        Stacknode *next;//下一节点的指针域  
    }Stacknode,*Stack;  
    //初始化一个链式栈（返回一个链式栈的头节点）  
    Stack InitStack()  
    {  
        Stack stack=(Stack)malloc(sizeof(Stacknode));  
        stack->next=NULL;  
        return stack;  
    }  
    //入栈  
    void Push(Stack stack,int newData)  
    {  
        //判断是否为空  
        if(stack==NULL)  
        {  
            printf("栈未初始化，请初始化以后再使用\n");  
            return;  
        }  
        //找到最后一个节点  
       Stacknode *lastnode=stack;  
       while(lastnode->next)  
        {  
        lastnode=lastnode->next;  
        }  
       lastnode->next=(Stacknode*)malloc(sizeof(Stacknode*));  
       lastnode->next->data=newData;  
       lastnode->next->next=NULL;  
       printf("入栈成功！\n");  
    }  
    //出栈  
    int Pop(Stack stack)  
    {  
        //判断栈是否为空  
        if(!stack->next)  
        {  
            printf("栈为空，无法出栈\n");  
            return -1;//-1只是一个自定义的错误代码  
        }  
        //找到最后一个节点的钱一个节点  
        //tempNode:最后一个节点的前一个节点  
        Stacknode *tempNode=stack;  
        while(tempNode->next->next)  
        {  
            tempNode=tempNode->next;  
        }  
        int data=tempNode->next->data;  
        free(tempNode->next);  
        tempNode->next=NULL;  
        return data;  
    }  
       
    int main()  
    {  
        Stack stack=InitStack();  
        Push(stack,3);//3进栈  
        Push(stack,4);//4进栈  
        Push(stack,5);//5进栈  
        printf("%d\n",Pop(stack));  
        printf("%d\n",Pop(stack));  
        printf("%d\n",Pop(stack));  
        printf("%d\n",Pop(stack));//第4次出栈，应该出错  
        return 0;  
    }  
```
queue模版类的定义在<queue>头文件中。  
queue与stack模版非常类似，queue模版也需要定义两个模版参数，  
一个是元素类型，一个是容器类型，元素类型是必要的，  
容器类型是可选的，默认为dqueue类型。  

定义queue对象的示例代码如下：  
```c++
queue<int>q1;
queue<double>q2;
```
queue的基本操作有：  
1.入队：如q.push(x):将x元素接到队列的末端；  
2.出队：如q.pop() 弹出队列的第一个元素，并不会返回元素的值；  
3,访问队首元素：如q.front()  
4,访问队尾元素，如q.back();  
5,访问队中的元素个数，如q.size();  
二.优先队列  
在<queue>头文件中，还定义了一个非常有用的模版类priority_queue  
(优先队列），优先队列与队列的差别在于优先队列不是按照入队的顺序出队，  
而是按照队列中元素的优先权顺序出队（默认为大者优先，也可以通过指定算子来指定自己的优先顺序）默认是一个大根堆。  
priority_queue模版类有三个模版参数，元素类型，容器类型，比较算子。  
其中后两个都可以省略，默认容器为vector，默认算子为less，即小的往前排，大的往后排（出队时序列尾的元素出队）。  

定义priority_queue对象的示例代码如下：  
```c++
priority_queue<int>q1;
priority_queue<pair<int,int> >q2;
priority_queue<int,vector<int>，greater<int> >q3;
```
//定义小的先出队  
priority_queue的基本操作均与queue相同  
初学者在使用priority_queue时，最困难的可能就是如何定义比较算子了。  
如果是基本数据类型，或已定义了比较运算符的类，可以直接用STL的less算子和greater算子——默认为使用less算子，  
即小的往前排，大的先出队。如果要定义自己的比较算子，方法有多种，  
这里介绍其中的一种：重载比较运算符。优先队列试图将两个元素x和y代入比较运算符  
(对less算子，调用x<y，对greater算子，调用x>y)，若结果为真，则x排在y前面，y将先于x出队，反之，则将y排在x前面，x将先出队。  

看下面这个简单的示例：  
```c++
    #include<iostream>  
    #include<queue>  
    #include<stdlib.h>  
    using namespace std;  
    class T  
    {  
    public:  
        int x,y,z;  
        T(int a,int b,int c):x(a),y(b),z(c)  
        {  
        }  
    };  
    bool operator<(const T&t1,const T&t2)  
    {  
        return t1.z<t2.z; int="" t="">q;  
        q.push(T(4,4,3));  
        q.push(T(2,2,5));  
        q.push(T(1,5,4));  
        q.push(T(3,3,6));  
        while(!q.empty())  
        {  
            T t=q.top();  
            q.pop();  
            cout<<t.x<<endl;  
        }
     }
```

栈的应用

①数制转换：

将一个非负的十进制整数N转换为另一个等价的基为B的B进制数的问题，很容易通过"除B取余法"来解决。

【例】将十进制数13转化为二进制数。  
解答：按除2取余法，得到的余数依次是1、0、1、1，则十进制数转化为二进制数为1101。  
分析：由于最先得到的余数是转化结果的最低位，最后得到的余数是转化结果的最高位，因此很容易用栈来解决。  

具体算法如下：

```C++
#include <STACK>    //C++中使用栈要包含的头文件
using namespace std;//这个也是要加的
 
void conversion(int N,int B)
{//假设N是非负的十进制整数，输出等值的B进制数
   
  stack<int> S;        //创建一个元素类型为int型的空栈
  while(N)
  {
    S.push(N%B); //将转换后的数值，从底位到高位开始入栈
    N=N/B;
  }
  while(!S.empty())//栈非空时退栈输出
  {
    printf("%d",S.top());    //打印栈顶元素
    S.pop();    //将栈顶元素出栈
  }
}
 
int main()
{
  conversion(10,2);
}
```
②表达式求值

表达式求值是程序设计语言编译中的一个最基本的问题。我们讨论一种简单直观的方法“算法优先级法”

算术四则运算的规则：

1、从左到右

2、先乘除后加减

3、先括号内，后括号外  
【例】4 + 2*3 -10/5 每一步的计算顺序应该是：

4 + 2*3 -10/5 = 4 + 6 - 10/5 = 10 - 10/5 = 10 - 2 = 8

算法步骤：（我们假设表达式以字符‘#’结尾）

（1）首先，创建空运算符栈OPTR，将表达式起始符‘#’压入栈底，创建空操作数栈OPND

（2）依次读入表达式中的每个字符，若是操作数则进操作数栈，若是运算符则和运算符栈顶的运算符比较优先级后，做如下相应操作：

1.如果栈顶的运算符优先级较低，则把新的运算符压入OPTR；执行（2）

2.如果栈顶的运算符优先级较高，则将其 和 操作数栈的两个栈顶元素 退栈，计算3个元素组成的表达式的值，再压入操作数栈，然后继续判断；

3.如果栈顶的运算符优先级相等（除了#符外，只有‘(’和‘)’是相等的），则将‘（’出栈；执行（2）

（3）直到整个表达式求值完毕（即OPTR栈顶元素和当前读入的字符均为‘#’）

具体算法实现：

```c++
#include <iostream>   
#include <stack>//C++中使用栈要包含的头文件
 
using namespace std;
 
//符号数组   
char symbol[7] = {'+', '-', '*', '/', '(', ')', '#'};  
 
//栈内元素的优先级   
int in[7] = {3, 3, 5, 5, 1, 6, 0};  
 
//栈外元素的优先级   
int out[7] = {2, 2, 4, 4, 6, 1, 0};  
 
/* 
 * 通过符号字符获取它的数组下标 
 */ 
int get(char c)  
{  
  switch(c)  
  {  
  case '+':  
    return 0;  
  case '-':  
    return 1;  
  case '*':  
    return 2;  
  case  '/':  
    return 3;  
  case '(':  
    return 4;  
  case ')':  
    return 5;  
  case '#':  
    return 6;  
  default:   
    return 6;  
  }  
}  
   
/* 
 * 比较栈内运算符c1和栈外运算符c2的优先级 
 */ 
char precede(char c1, char c2)  
{  
  int i1 = get(c1);  
  int i2 = get(c2);  
   
  if(in[i1] > out[i2])  
  {  
    return '>';  
  }  
  else if(in[i1] < out[i2])  
  {  
    return '<';  
  }  
  else 
  {  
    return '=';  
  }  
}  
   
/* 
 * 计算基本表达式的值 
 */ 
int figure(int a, int theta, int b)  
{  
  switch(theta)  
  {  
  case 0:  
    return a + b;  
  case 1:  
    return a - b;  
  case 2:  
    return a * b;  
  default:  
    return a / b;  
  }  
}  
   
/* 
 * 计算表达式的值 
 */ 
int EvaluateExpression(const char *exp)  
{  
  stack<int> OPND; //操作数栈   
  stack<int> OPTR; //运算符栈   
  OPTR.push(get('#'));
 
  int flag = 1; //表示正负号 1,表示正 0,表示负   
  int a, theta, b;  
   
  if(!('+' == *exp || '-' == *exp || '(' == *exp || isdigit(*exp)))  
  {//如果不是以'+'、'-'、'('或者数字的其中一个开头，则表达式错误  
    cout << "表达式出错1" << endl;  
    return -1;  
  }  
  if('+' == *exp)  
  {   
    exp++;//指向下一个字符   
  }
  else if('-' == *exp)  
  {  
    flag = 0;  
    exp++;//指向下一个字符   
  }  
   
  int index = OPTR.top();                //获取运算符栈顶元素在数组的下标号
  while(*exp || symbol[index] != '#') //如果栈顶元素是'#'且当前元素为空结束计算 
  {  
    if(isdigit(*exp))  
    {//如果当前元素是数字，计算整个操作数的值，然后压入操作数栈
      int sum = 0; 
      while(isdigit(*exp))  
      {//计算操作数的值
        sum = sum * 10 + (*exp - '0');  
        exp++;  
      }
      if (!flag)    //如果是负数
      {
        sum = -sum;
      }
      OPND.push(sum);  
      flag = 1;  
    }  
    else 
    {//如果不是数字
      switch(precede(symbol[OPTR.top()], *exp))//比较栈顶运算符和当前运算符的优先级
      {  
      case '>' :  
        b = OPND.top();
        OPND.pop();
        a = OPND.top();  
        OPND.pop();  
        theta = OPTR.top();  
        OPTR.pop();  
        OPND.push(figure(a, theta, b));  
        break;  
      case '<' :  
        OPTR.push(get(*exp));  
        if(*exp)  
        {  
          exp++;  
        }  
        break;  
      case '=' :  
        OPTR.pop();  
        if(*exp)  
        {  
          exp++;  
        }  
        break;  
      }  
    }
    index = OPTR.top();
  }  
  return OPND.top();  
}  
   
int main()  
{
  char c[50] = {0};
  cout << "请输入一个表达式: ";
  cin.getline(c,50);
  cout << EvaluateExpression(c) << endl;  
 
  return 0;  
}
```
队列的应用  

舞伴问题  

1、问题叙述  
假设在周末舞会上，男士们和女士们进入舞厅时，各自排成一队。跳舞开始时，依次从男队和女队的队头上各出一人配成舞伴。若两队初始人数不相同，则较长的那一队中未配对者，等待下一轮舞曲。现要求写一算法模拟上述舞伴配对问题。  
2、问题分析  
先入队的男士或女士亦先出队配成舞伴。因此该问题具体有典型的先进先出特性，可用队列作为算法的数据结构。  
在算法中，假设男士和女士的记录存放在一个数组中作为输入，然后依次扫描该数组的各元素，并根据性别来决定是进入男队还是女队。当这两个队列构造完成之后，依次将两队当前的队头元素出队来配成舞伴，直至某队列变空为止。此时，若某队仍有等待配对者，算法输出此队列中等待者的人数及排在队头的等待者的名字，他（或她）将是下一轮舞曲开始时第一个可获得舞伴的人。  
3、具体算法及相关的类型定义  

```c++
#include <queue> 
//C++中使用队列要包含的头文件
using namespace std;
typedef struct
{
  char name[20];
  char sex; //性别，'F'表示女性，'M'表示男性
}Person;
 
void DancePartner(Person dancer[],int num)
{//结构数组dancer中存放跳舞的男女，num是跳舞的人数。
 
  Person p;
  queue<Person> Mdancers,Fdancers;
 
  for(int i = 0; i < num; i++)
  {//依次将跳舞者依其性别入队
    p=dancer[i]; 
    if(p.sex=='F')
      Fdancers.push(p); //排入女队
    else
      Mdancers.push(p); //排入男队
  }
  printf("The dancing partners are: \n \n");
  while(!(Fdancers.empty()||Mdancers.empty()))
  {
    //依次输入男女舞伴名
    p=Fdancers.front();        //获取女队第一人
    Fdancers.pop();            //出队
    printf("%s ",p.name);    //打印出队女士名
 
    p=Mdancers.front();        //获取男队第一人
    Mdancers.pop();            //出队
    printf("%s\n",p.name);    //打印出队男士名
  }
  if(!Fdancers.empty())
  {//输出女士剩余人数及队头女士的名字
    printf("\n There are %d women waitin for the next round.\n",Fdancers.size());
    p=Fdancers.front(); //取队头
    printf("%s will be the first to get a partner. \n",p.name);
  }
  else if(!Mdancers.empty())
  {//输出男队剩余人数及队头者名字
    printf("\n There are%d men waiting for the next round.\n",Mdancers.size());
    p=Mdancers.front();
    printf("%s will be the first to get a partner.\n",p.name);
  }
  else
  {
    printf("There is not person in the queue!");
  }
}//DancerPartners
 
int main()
{
  Person p[] = { {"A",'F'},{"B",'F'},{"C",'M'},{"D",'M'} };
  DancePartner(p,4);
}
```

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
