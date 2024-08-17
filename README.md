# 陈浩翔

地址：https://chenhaoxiang.gitee.io/


使用方法
修改_config.yml文件中的内容
# 个人名称或昵称
name: chenhaoxiang
# 页面个人头像信息中地址展示信息
location: 杭州
# 页面个人头像信息中公司展示信息
company: 飞链云
# 页面个人头像信息中职位展示信息
position: CEO
# 页面个人头像信息中GITHUB展示信息
github: https://github.com/chenhaoxiang
# 页面个人头像信息中EMAIL展示信息
email: fly@feilianyun.cn

#本项目的baseurl
baseurl: "/resume.io"
修改个人头像信息

修改 _config.yml 文件中内容

修改基本信息

修改 _includes/resumer_01-basic.html 文件中内容

修改职业技能

修改 _includes/resumer_02-profetional.html 文件中内容

修改教育经历

修改 _includes/resumer_03-education.html 文件中内容

修改工作经历

修改 _includes/resumer_04-experience.html 文件中内容

修改获得证书

修改 _includes/resumer_05-certification.html 文件中内容

修改个人作品

修改 _includes/resumer_06-personal_project.html 文件中内容

本地搭建
在本地安装 Jekyll . 然后在项目目录执行jekyll s命令,如下

启动项目命令：
```shell
jekyll s
```

```shell
[root@localhost ~]# jekyll s
Configuration file: C:/..../resume.io/_config.yml
Source: C:/..../resume.io
Destination: C:/..../resume.io/_site
Incremental build: disabled. Enable with --incremental
Generating...
done in 0.371 seconds.
Please add the following to your Gemfile to avoid polling for changes:
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
Auto-regeneration: enabled for 'C:/..../resume.io'
Server address: http://127.0.0.1:4000/resume.io/
Server running... press ctrl-c to stop.
```
然后可以访问http://127.0.0.1:4000/resume.io/来访问本地的服务了。