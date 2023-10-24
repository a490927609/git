#### vi/vim替换：

vi/vim使用：s命令来替换字符串

```
在vi/vim编辑器中，按下“:”键进入命令模式，然后输入“%s/原字符串/新字符串/g”，其中“%”代表替换整个文件中的所有匹配字符串，“s”代表替换操作，“/”是分隔符，“g”代表全局替换。
```



替换当前选中行的第一个匹配项，其中“deb”是要被替换的文本，“deb_”是替换后的文本。

```
s/deb/deb_/
```

替换当前选中行的第一个匹配项，其中“deb”是要被替换的文本，“deb_”是替换后的文本，g表示全局替换。

```
s/deb/deb_/g
```



以“+”符号为分割符，将"http://cn.archive.ubuntu.com/ubuntu"替换为“http://mirrors.aliyun.com”

```
%s+http://cn.archive.ubuntu.com/ubuntu+http://mirrors.aliyun.com+
```

#### 修改文件名称：

```
mv [旧文件名] [新文件名]			#修改文件名称
```





#### 用户组：

```
cat /etc/group					#查询用户组
```

```
sudo gpasswd -a $USER docker	#将当前用户加入“docker”用户组
								#-a : 添加用户到组
								#-d : 从组删除用户
								#-A：指定管理员
								#-M：指定组成员和-A的用途差不多
								#-r：删除密码
								#-R：限制用户登入组，只有组中的成员才可以用newgrp加入该组
```

```
newgrp docker					#切换到docker用户组
```





**Shutdown命令使用详解：**

```
1)shutdown -h now 现在立即关机
2)shutdown -r now 现在立即重启
3)shutdown -r +3 三分钟后重启
4)shutdown -h +3 “The System will shutdown after 3 minutes” 提示使用者将在三分钟后关机
5)shutdown -r 21:00 在21:00时将重启计算机
6)shutdown -r 20:30 & 可以将在20:30时重启的任务放到后台去，用户可以继续操作终端
```



#### Ubuntu配置网络：

新的 IP 配置方法不会再用到 /etc/network/interfaces 这个文件，取而代之的是一个 YAML 文件。默认的 Netplan 配置文件一般在 /etc/netplan 目录下。

首先先找到 Netplan 默认的网络配置文件所在之处：

```text
$ ls /etc/netplan/
00-installer-config.yaml
```

文件的内容：

```text
$ cat /etc/netplan/00-installer-config.yaml
network:
    ethernets:
        ens33:
            dhcp4: yes
            addresses: [] 	 
            
    version: 2
```

网卡默认配置为从 DHCP 服务器中获取 IP，如果是双网卡，可能还会有一路配置，比如像下面这种：

```text
network:
    ethernets:
        ens33:
            dhcp4: yes
            addresses: [] 
	  	ensxx:
            dhcp4: yes
            addresses: []
version: 2
```

给网卡配置为静态 IP 地址（分别添加 IP 地址、子网掩码、网关、DNS 服务器等配置）：

​	用 192.168.0.4 作为网卡 enp33 的 IP 地址，

​	192.168.0.1 作为网关地址，

​	255.255.255.0 作为子网掩码，

​	用 8.8.8.8 、 8.8.4.4 这两个 DNS 服务器 IP。

```text
# This is the network config written by 'subiquity'
network:
        ethernets:
                ens33:
                        addresses: [192.168.0.4/24]
                        #addresses: []
                        gateway4: 192.168.0.1
                        dhcp4: no
                        #dhcp4: true
                        nameservers:
                               addresses: [8.8.8.8]
                        optional: true
        renderer: networkd
        version: 2
```

注意：在 Ubuntu 18.04 里，这个配置文件的每一行都必须靠空格来缩进，不能用 TAB 来代替，否则配置会不起作用。



配置完成之后保存并关闭配置文件。然后用下面这行命令来应用刚才的配置：

```text
$ sudo netplan apply
```