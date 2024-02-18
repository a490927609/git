1. 下载地址：

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

   