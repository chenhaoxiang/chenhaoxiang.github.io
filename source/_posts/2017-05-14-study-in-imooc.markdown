---
layout: post
title: "【设计模式】Java设计模式之模板方法模式"
date: 2017-05-14 22:18:54 +0800
comments: true
categories: Java
tags: [design_mode,Java]
keyword: 陈浩翔, 谙忆, 模板方法模式, Java
description: 模板方法模式是类的行为模式。准备一个抽象类，将部分逻辑以具体方法以及具体构造函数的形式实现，然后声明一些抽象方法来迫使子类实现剩余的逻辑。不同的子类可以以不同的方式实现这些抽象方法，从而对剩余的逻辑有不同的实现。这就是模板方法模式的用意。
---

我们先这样来想象一个生活中的场景，  
就是我们在银行柜台进行办理业务的时候，会进行这几步:  
Step1:进门取号  
Step2:填写单据  
Step3:等待叫号  
Step4:窗口办理  
  
在这里，无论是你我还是他/她，都会遵循这个模板进行业务的办理！
我们具体看Step2，银行是无法知道我们的信息的，所以无法由银行具体实现了，所以留下接口，需要我们自己去实现。  
现在我们再继续看下去  

<!-- more -->

----------

##什么是模板方法
模板方法模式是类的行为模式。准备一个抽象类，将部分逻辑以具体方法以及具体构造函数的形式实现，然后声明一些抽象方法来迫使子类实现剩余的逻辑。不同的子类可以以不同的方式实现这些抽象方法，从而对剩余的逻辑有不同的实现。这就是模板方法模式的用意。
比如定义一个操作中的算法的骨架，将步骤延迟到子类中。模板方法使得子类能够不去改变一个算法的结构即可重定义算法的某些特定步骤。


前面那个例子可以这样用图来描述：  

{% img /images/20170514/222935.png %}  

简单明了，就是Step2自己去具体实现。  

----------

#模板方法模式的代码实现

##具体子类实现延迟步骤

```java 抽象基类 为所有子类提供一个算法框架

package com.chenhaoxiang.template;

/**
 * 抽象基类 为所有子类提供一个算法框架
 * 
 * 提神饮料
 * 
 * @author chenhaoxiang
 *
 */
public abstract class RefreshBeverage {
	/**
	 * final阻止子类对方法的复写 制备饮料的模板方法 封装了所有子类共同遵循的算法框架
	 */
	public final void prepareBeverageTemplate() {
		// 步骤1:将水煮沸
		boilWater();
		// 步骤2:泡制饮料
		brew();
		// 步骤3:将饮料倒入杯中
		pourInCup();
		// 步骤4: 加入调味料
		addCondiments();
	}

	/**
	 * 基本方法:将水煮沸
	 */
	private void boilWater() {
		System.out.println("将水煮沸");
	}
	
	
	/**
	 * 抽象的基本方法
	 * 泡制饮料
	 * 注意访问权限为protected
	 */
	protected abstract void brew();
	
	/**
	 * 通用方法
	 * 将饮料倒入杯中
	 */
	private void pourInCup() {
		System.out.println("将饮料倒入杯子中");
	}
	/**
	 * 抽象的基本方法
	 * 加入调味料
	 */
	protected abstract void addCondiments();

}


```

```java 具体子类,提供了咖啡制备的具体实现

package com.chenhaoxiang.template;

/**
 * 具体子类
 * 提供了咖啡制备的具体实现
 * 
 * @author chenhaoxiang
 *
 */
public class Coffee extends RefreshBeverage{

	@Override
	protected void brew() {
		System.out.println("冲泡咖啡...");
	}

	@Override
	protected void addCondiments() {
		System.out.println("加入咖啡调料...");
	}

}

```

```java 具体子类,提供了制备茶的具体实现
package com.chenhaoxiang.template;

/**
 * 具体子类
 * 提供了制备茶的具体实现
 * @author chenhaoxiang
 *
 */
public class Tea extends RefreshBeverage{

	@Override
	protected void brew() {
		System.out.println("用80度的热水浸泡茶叶5分钟...");
	}

	@Override
	protected void addCondiments() {
		System.out.println("茶也要调味品？反正我不加.");
	}

}


```

```java 测试类

package com.chenhaoxiang.template;

public class RefreshBeverageTest {
	
	public static void main(String[] args) {
		
		System.out.println("制备咖啡...");
		
		RefreshBeverage beverage = new Coffee();
		beverage.prepareBeverageTemplate();
		System.out.println("咖啡制作好了.");
		
		System.out.println("---------------------");
		
		System.out.println("开始制备茶.");
		RefreshBeverage beverage2 = new Tea();
		beverage2.prepareBeverageTemplate();
		System.out.println("茶制作成功.");
		
		
		
	}
}


```

结果:

{% img /images/20170514/223014.png %}  

##钩子使子类更灵活

看上面代码实现的步骤:
1、把水煮沸
2、泡饮料
3、把饮料倒入杯子
4、加调味品

上面的代码中，我们的子类是必须进行上面的4步的，因为那是在我们的模板方法中定义的。
如果我们不需要加调味品呢，这个时候就需要引入钩子方法的概念了。

对上面的代码进行变化

未写的是未进行修改的类

```java 抽象基类 为所有子类提供一个算法框架

package com.chenhaoxiang.template;

/**
 * 抽象基类 为所有子类提供一个算法框架
 * 
 * 提神饮料
 * 
 * @author chenhaoxiang
 *
 */
public abstract class RefreshBeverage {
	/**
	 * final阻止子类对方法的复写 制备饮料的模板方法 封装了所有子类共同遵循的算法框架
	 */
	public final void prepareBeverageTemplate() {
		// 步骤1:将水煮沸
		boilWater();
		// 步骤2:泡制饮料
		brew();
		// 步骤3:将饮料倒入杯中
		pourInCup();
		if( isCustomerWantsCondiments() ){
			// 步骤4: 加入调味料
			addCondiments();
		}
	}
	
	/**
	 * 钩子(Hook)函数
	 * 提供一个默认或空的实现
	 * 具体的子类可以自行决定是否挂钩以及如何挂钩
	 * (让子类选择性的可以钩或者不钩中实现)
	 * 询问用户是否需要加入调料
	 * @return
	 */
	protected boolean isCustomerWantsCondiments() {
		return true;
	}

	/**
	 * 基本方法:将水煮沸
	 */
	private void boilWater() {
		System.out.println("将水煮沸");
	}
	
	
	/**
	 * 抽象的基本方法
	 * 泡制饮料
	 * 注意访问权限为protected
	 */
	protected abstract void brew();
	
	/**
	 * 通用方法
	 * 将饮料倒入杯中
	 */
	private void pourInCup() {
		System.out.println("将饮料倒入杯子中");
	}
	/**
	 * 抽象的基本方法
	 * 加入调味料
	 */
	protected abstract void addCondiments();

}


```

```java 提供了制备茶的具体实现

package com.chenhaoxiang.template;

/**
 * 具体子类
 * 提供了制备茶的具体实现
 * @author chenhaoxiang
 *
 */
public class Tea extends RefreshBeverage{

	@Override
	protected void brew() {
		System.out.println("用80度的热水浸泡茶叶5分钟...");
	}

	@Override
	protected void addCondiments() {
		System.out.println("茶也要调味品？反正我不加.");
	}

	/**
	 * 子类通过覆盖的形式选择挂载钩子函数并且提供了一个符合自己需求的实现
	 */
	@Override
	protected boolean isCustomerWantsCondiments() {
		return false;//返回false ，addCondiments方法不会执行
	}
	
}


```

演示结果:

{% img /images/20170514/225603.png %}  

#总结

抽象基类：  
1、基本方法  
我们知道所有的子类的实现细节都是一样的，具有共性的  
可以直接在基类中定义实现  
2、抽象方法  
对于只知道原则而不知道细节的方法  
3、可选钩子函数  
只在基类中提供默认或者空的实现，由子类来选择是否使用钩子  
4、Template方法  
把前面的方法按照一定顺序来执行，写成模板方法。  
注意，该方法一定要写成final！  

也就是，你不能改变基类规定的基本原则，执行顺序！

具体子类：  
1、实现基类中的抽象方法  
执行子类的个性化行为  
2、可选择覆盖钩子方法  
可更加个性化的来影响局部行为  

模板方法的适用场景：  
1、算法或操作遵循相似的逻辑  
例如上面代码样例中的茶和咖啡，对饮料的泡制具有相似的逻辑，所以可以抽象成模板方法，供所有子类使用！  
2、重构时(把相同的代码抽取到父类中)  
新功能加入时  
3、重要、复杂的算法，核心算法设计为模板算法  

模板方法模式的优点:  
1、封装性好  
2、复用性好  
3、屏蔽细节  
4、便于维护  
优点具体就不说了，百度一下有很多解释。  
模板方法模式的缺点:  
1、继承  
继承是面向对象的语言的一个核心的特性！  
Java是单继承语言，也就是一个类只能有一个父类！  
这种情况下，设想一个情况，在已有的历史系统中，这个系统的类有大量继承，如果我们想做一些重构，用模板方法的模式抽取共性，以及增加架构的弹性的时候，因为我们的类已经处于继承的某个继承的结构之中，如果想引用模板方法，可能就会遇到一些问题！

本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>
