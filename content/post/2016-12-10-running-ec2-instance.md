---
categories:
- sysadmin
date: 2016-12-10T00:00:00Z
title: Running EC2 Instance
url: /2016/12/10/running-ec2-instance/
---

Amazon have provided a pretty neat infrastructure with Amazon Web Services (AWS). By using this as a platform, you can quickly scale up and down provisioned resources. At times, you may experience peak demand, and AWS will allow you to respond with this. At other times, you can scale your resources down.

The first step in learning about this platform, is running an EC2 instance. This is the 'machine' behind your service. It will hold CPU/RAM and storage resources. Depending on your requirements, you can choose different types of EC2 instances.


|------
| Name | Uses              | Offers                   | 
|------|:-------------------|:--------------------------|  
| T2   |Small use machine  |with burstable performace.| 
| M4   |                   |                          | 


root@openvpnas2:~# ip route
default via 11.0.1.1 dev eth0 
11.0.1.0/24 dev eth0  proto kernel  scope link  src 11.0.1.189 
11.0.1.0/24 dev as0t0  proto kernel  scope link  src 11.0.1.1

root@openvpnas2:~# ip route
default via 11.0.1.1 dev eth0 
11.0.1.0/24 dev eth0  proto kernel  scope link  src 11.0.1.189 
11.0.1.0/24 dev as0t0  proto kernel  scope link  src 11.0.1.1

root@openvpnas2:/home/openvpnas# ps aux | grep openvpn
root       897  0.0  5.0 286164 51428 ?        Sl   08:41   0:05 python -c from pyovpn.sagent.sagent_entry import openvpnas ; openvpnas() --logfile=/var/log/openvpnas.log --pidfile=/var/run/openvpnas.pid
openvpn+   963  0.0  4.1 171900 41712 ?        S    08:41   0:04 python -c from pyovpn.cserv.wserv_entry import start ; start() -no -u openvpn_as -g openvpn_as --pidfile /usr/local/openvpn_as/etc/tmp/wserv.pid -r epoll
openvpn+  1065  0.0  0.5  26224  5860 ?        S    08:41   0:00 openvpn-openssl --errors-to-stderr --config stdin
openvpn+  1079  0.0  0.0  24764   564 ?        S    08:41   0:00 openvpn-openssl --errors-to-stderr --config stdin
root      2303  0.0  0.6  96932  6972 ?        Ss   10:55   0:00 sshd: openvpnas [priv]
openvpn+  2306  0.0  0.4  45272  4584 ?        Ss   10:55   0:00 /lib/systemd/systemd --user
openvpn+  2308  0.0  0.1  63208  1900 ?        S    10:55   0:00 (sd-pam)
openvpn+  2321  0.0  0.3  96932  3204 ?        S    10:55   0:00 sshd: openvpnas@pts/0
openvpn+  2322  0.0  0.4  21268  4968 pts/0    Ss   10:55   0:00 -bash
root      2500  0.0  0.0  12944   972 pts/0    S+   11:22   0:00 grep --color=auto openvpn
