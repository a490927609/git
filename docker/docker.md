



1. 使用YUM源安装

   wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo

   

   镜像地址：https://developer.aliyun.com/mirror/docker-ce?spm=a2c6h.13651102.0.0.3e941b11ahPny9

   

2. Docker安装

   安装最新：yum -y install docker-ce

   指定版本：yum -y install docker-ce-20.10.17 docker-ce-cli-20.10.17

   

3. 启动Docker服务

   systemctl enable docker；systemctl start docker

   开机启动并现在就启动：systemctl enable --now docker  

   

4. 查看Docker状态

   systemctl status docker 

   

5. 查看Docker版本

   docker version

   

6. 拉取镜像

   阿里linux系统： docker run -it alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3:latest

   

   

   