#!/bin/sh
rake generate 
echo '已经编译成最新的页面'
rake deploy
echo '已将本地的静态网站部署到github'
git add .
echo 请输入本次提交的注释 如输入空白字符则使用"commit",倒计时600s
read -t 600 var
#会读取一行到var变量
if [ -z $var ];then
echo 未输入注释 空白注释
git commit -am "commit"
else
echo commit is $var
git commit -am "$var"
fi
git push origin source
echo '已提交代码至source分支'
sleep 5