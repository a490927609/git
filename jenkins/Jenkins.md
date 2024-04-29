





# 一.下载安装启动

1.载地址：

https://www.jenkins.io/download/





1. 启动命令：   

  ​	java -jar jenkins.war --httpPort=8999 

  ​	java -jar jenkins.war --httpPort=8999 &    命令窗口关闭时，xxx.jar依然可以运行

  ​	java -jar jenkins.war --httpPort=8999  1> system.log 2>error.log &	标准日志输出到system.log，错误日志输出到error.log 

  ​    0 标准输入(一般是键盘)

  ​	1 标准输出(一般是显示器，是用户终端控制台)

  ​	2 标准错误(错误信息输出)





2. hudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION = true





​	3. GitHub自动触发配置

```
【超详细傻瓜式教程】向GitHub提交代码时触发Jenkins自动构建
https://zhuanlan.zhihu.com/p/556462914?utm_id=0
```



​	4. Gitee自动触发配置

```
https://www.cnblogs.com/root-123/p/16570916.html
```

```
https://gitee.com/terry0230/pytest-kv.git
047@kiloview.com
hufei@12
```



5. Gitlab自动触发配置

   ```
   https://www.cnblogs.com/linagcheng/p/17402174.html
   ```

   

# 二.设置定时任务

```
https://blog.csdn.net/IT_LanTian/article/details/123049778
```



# 二.远程Windows

1. Jenkins远程连接Windows执行命令

```
https://blog.csdn.net/v781423070/article/details/131326930
```

2. windows安装OpenSSH

   ```
   https://blog.csdn.net/v781423070/article/details/131322758
   ```

3. 适用于 Windows 的 OpenSSH 入门

```
https://learn.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui
```



# 三.疑难杂症解决

1.忘记Jenkins管理员密码的解决办法

```
https://blog.csdn.net/jlminghui/article/details/54952148
```

2.gitee连接Jenkins，webhook返回404问题

```
https://blog.csdn.net/weixin_58887621/article/details/135242286
```

