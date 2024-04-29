

1. java下载地址：

   ​	https://www.oracle.com/java/technologies/downloads

   

2. java解压：

   ​	tar -zcvf XXX.tar.gz

   

3. java环境变量配置：

   ​	vim /etc/profile

   ​	export JAVA_HOME=/opt/jdk-17.0.10
   ​	export JRE_HOME=$JAVA_HOME/jre
   ​	export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib:$JRE_HOME/lib/rt.jar:$JRE_HOME/lib/ext:$JRE_HOME/lib:$CLASSPATH
   ​	export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

   

4. 配置生效:

   ​	source /etc/profile

   

5. java 检测:

   ​	java -version

   

6. 启动java程序：

   ​    java -jar jenkins.war --httpPort=8999 

   ​	java -jar jenkins.war --httpPort=8999 &    命令窗口关闭时，xxx.jar依然可以运行

   ​	java -jar jenkins.war --httpPort=8999  1> system.log 2>error.log &	标准日志输出到system.log，错误日志输出到error.log 

   ​    0 标准输入(一般是键盘)

   ​	1 标准输出(一般是显示器，是用户终端控制台)

   ​	2 标准错误(错误信息输出)

