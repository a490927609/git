#!/bin/bash

# 程序会自动选择目标yaml文件，并修改当前yaml文件，并打印修改后激活的IP。

ip=1
#:<< block
while [ 1 ]
do
echo -n "input ip field[0 3]:"

	read -p "0 or 3 ? " ip
	case $ip in
	0) break ;;
	3) break ;;
	*) echo "input error, input 1 or 3."
	esac
done
#block

#方法二
:<< block 
echo  "input ip field[0 3]:"
ip1=0
ip2=3
select ip in $ip1 $ip2
do 
	if [ $ip -eq $ip1 ] ; then
		break
	fi
	
	if [ $ip -eq $ip2 ] ; then
		break
	fi

	echo -n "input 0 or 3 :"
	#continue
	
done
block


echo "set ip=192.168.$ip.4"

if [ $ip -eq 0  ]
then
	if [  -e 00-installer-config.yaml.0.x ]
	then
		cp 00-installer-config.yaml.0.x  00-installer-config.yaml
		netplan apply
		sleep 2s
		ip addr
	else
		echo "ERR: 00-installer-config.yaml.0.x is not exist!!"
	fi
fi


if [ $ip -eq 3  ]
then
	if [  -e 00-installer-config.yaml.3.x ]
	then
		cp 00-installer-config.yaml.3.x  00-installer-config.yaml
		netplan apply
		sleep 2s
		ip addr
	else
		echo "ERR: 00-installer-config.yaml.3.x is not exist!!"
	fi
fi