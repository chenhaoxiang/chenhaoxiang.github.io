---
layout: post
title: "【问题解决】Mybatis一对多/多对多查询时只查出了一条数据"
date: 2017-08-08 13:38:54 +0800
comments: true
categories: Java
tags: [Mybatis, Java]
keyword: 陈浩翔, 谙忆, Java, Mybatis,sql级联查询
description: 如果三表(包括了关系表)级联查询，主表和明细表的主键都是id的话，明细表的多条数据只能查询出来第一条数据。  
---

问题描述:
如果三表(包括了关系表)级联查询，主表和明细表的主键都是id的话，明细表的多条数据只能查询出来第一条/最后一条数据。  

<!-- more -->
----------

三个表，权限表(Permission)，权限组表(PermissionGroup)，权限组与权限的关系表(PermissionPermissionGroupKey)  

实体类就不写上来了。  

原出错映射文件:
```xml
  <resultMap id="permissionGroupResultMap" type="cn.kx59.admin.entity.PermissionGroup" >
    <id column="id" property="id" jdbcType="INTEGER" />
    <result column="name" property="name" jdbcType="VARCHAR" />
    <result column="decipher" property="decipher" jdbcType="VARCHAR" />
    <result column="create_time" property="createTime" jdbcType="TIMESTAMP" />
    <!-- 一个权限组 对应多个权限-->
    <collection property="permissionArrayList" ofType="cn.kx59.admin.entity.Permission">
      <id column="id" property="id" jdbcType="INTEGER" />
      <result column="url" property="url" jdbcType="VARCHAR" />
      <result column="name" property="name" jdbcType="VARCHAR" />
      <result column="explain" property="explain" jdbcType="VARCHAR" />
      <result column="decipher" property="decipher" jdbcType="VARCHAR" />
      <result column="create_time" property="createTime" jdbcType="TIMESTAMP" />
    </collection>
  </resultMap>
 
  <!--查询所有的权限组以及权限组包含的权限-->
  <select id="selectAllPermissionGroupAndPermission" resultMap="permissionGroupResultMap" >
        SELECT *
  FROM [QPWebDB].[dbo].[permission_group] pg
  left join [QPWebDB].[dbo].[permission_permission_group] ppg on pg.id=ppg.permission_group_id
  left join [QPWebDB].[dbo].[permission] p on p.permission_id=ppg.permission_id
  </select>
```

这是因为主表和明细表的id字段名相同造成的。  
问题的关键在于resultMap中如果不定义类似主键之类的能够区分每一条结果集的字段的话，会引起后面一条数据覆盖前面一条数据的现象。  

解决方法一：  
修改主表或者明细表的id名，保证不一致就行  

解决方法二：  
查询结果起别名   
修改映射文件如下：  
```xml
  <resultMap id="permissionGroupResultMap" type="cn.kx59.admin.entity.PermissionGroup" >
    <id column="id" property="id" jdbcType="INTEGER" />
    <result column="name" property="name" jdbcType="VARCHAR" />
    <result column="decipher" property="decipher" jdbcType="VARCHAR" />
    <result column="create_time" property="createTime" jdbcType="TIMESTAMP" />
    <!-- 一个权限组 对应多个权限-->
    <collection property="permissionArrayList" ofType="cn.kx59.admin.entity.Permission">
      <id column="p_id" property="id" jdbcType="INTEGER" />
      <result column="url" property="url" jdbcType="VARCHAR" />
      <result column="name" property="name" jdbcType="VARCHAR" />
      <result column="explain" property="explain" jdbcType="VARCHAR" />
      <result column="decipher" property="decipher" jdbcType="VARCHAR" />
      <result column="create_time" property="createTime" jdbcType="TIMESTAMP" />
    </collection>
  </resultMap>

  <!--查询所有的权限组以及权限组包含的权限-->
  <select id="selectAllPermissionGroupAndPermission" resultMap="permissionGroupResultMap" >
        SELECT pg.*,
  p.id p_id,
  p.url,
  p.name,
  p.explain,
  p.decipher,
  p.create_time
  FROM [QPWebDB].[dbo].[permission_group] pg
  left join [QPWebDB].[dbo].[permission_permission_group] ppg on pg.id=ppg.permission_group_id
  left join [QPWebDB].[dbo].[permission] p on p.id=ppg.permission_id
  </select>
```

如上两种方法均能解决这个问题，希望对你有帮助   
有知道出现这个问题的原理的大佬欢迎在评论区解释下，O(∩_∩)O谢谢    


本文章由<a href="http://chenhaoxiang.cn/">[谙忆]</a>编写， 所有权利保留。 
欢迎转载，分享是进步的源泉。
<blockquote cite='陈浩翔'>
<p background-color='#D3D3D3'>转载请注明出处：<a href='http://chenhaoxiang.cn'><font color="green">http://chenhaoxiang.cn</font></a><br><br>
本文源自<strong>【<a href='http://chenhaoxiang.cn' target='_blank'>人生之旅_谙忆的博客</a>】</strong></p>
</blockquote>