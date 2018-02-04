---
categories:
- sysadmin
date: 2015-12-24T00:00:00Z
title: Setting up a firewall on Linux Ubuntu 14.04
url: /2015/12/24/setting-up-firewall/
---

## Uses
Firewalls allow only particular access to particular network ports and paths. You can remove access to a port or a specific IP address or a range of IP addresses.

Admins can apply rules according to what access they would like - these rules include both outgoing and incoming network traffic. This allows admins to build barriers of trust across machines.

Modern firewalls are based on [_Application Layer Firewalls_](https://en.wikipedia.org/wiki/Application_firewall) and are aware of the kinds of applications and protocols that the connection is using. They can block anything which is not part of the normal flow of traffic.

## Set up

The __firewalld__ package needs to be installed:

    $ sudo aptitude install firewalld 

You should not run the program __iptables__ alongside __firewalld__ as this is the older version and will create a conflict.

__firewalld__ is a service which needs to be running to use and configure the firewall, and is started in the usual way.

    $ sudo /etc/init.d/firewalld start 

You can test if the service is running with:

    $ sudo firewall-cmd --state

If you have more than one network interface on IPV4, you will need to turn on **ip forwarding**. This is achieved with:

    $ sudo sysctl net.ipv4.ip_forward=1

However, this is not persistent across boots. To achieve this, you will need to add the following line to */etc/sysctl.conf*:

    net.ipv4.ip_forward=1 

and then reboot or type:

    $ sudo sysctl -p 

to read in the new setting.

### Zones

Firewalls work with **zones** each which has a level of trust defined. The zones are

* **drop** - only particular incoming connections are allowed
* **block** - all incoming connections are rejected
* **public** - do not trust any computers on the network; only defined incoming connections are permitted
* **external** - used when _masquerading_ is being used, usually in routers. 
* **dmz** - used when access is allowed only to some services to the public. 
* **work** - trust connected nodes to be not harmful
* **home** - mostly trust other network nodes, but still select which incoming connections are allowed
* **internal** - similar to work zone
* **trusted** - everything is allowed.

On installation, nearly all Linux distributions will select the __public__ zone as the default for all interfaces.

Get the default zone:

    $ sudo firewall-cmd --get-default-zone

Obtain a list of zones being used:

    $ sudo firewall-cmd --get-active-zones 

List all available zones:

    $ sudo firewall-cmd --get-zones 

To change the default zone to **trusted** and then change it back.

    $ sudo firewall-cmd --set-default-zone=trusted

    $ sudo firewall-cmd --set-default-zone=public


To assign an interface temporarily to a particular zone:

    $ sudo firewall-cmd --zone=internal --change-interface=eth0

This will only change the interface until the next boot. To make it permanent, we add the **--permanent** flag.

    $ sudo firewall-cmd --permanent --zone=internal --change-interface=eth0

which will create a file in **/etc/firewalld/zones/internal.xml**.

To ascertain the zone associated with a particular interface:

    $ sudo firewall-cmd --get-zone-of-interface=eth0

To get the details of a particular zone:

    $ sudo firewall-cmd --zone=public --list-all 

An admin can also bind a zone to a network address (as well as an interface).

To bind a source to a zone:

    $ sudo firewall-cmd --permanent --zone=trusted --add-source=192.168.1.0/24

With this command, anyone from address 192.168.1.x will be added to the **trusted** zone. 

### Services and ports within a zone

Setting zones is now possible, but for these to become effective, we need to set particular services within each zone.

We can see what services are associated with a particular zone:

    $ sudo firewall-cmd --list-services --zone=public

To add a service to a zone:

    $ sudo firewall-cmd --permanent --zone=work --add-service=http
    $ sudo firewall-cmd --reload 

**--reload** is required to make the change effective and **--permanent** is required to add a service to a zone.

Port management is very similar:

    $ sudo firewall-cmd --zone=work --add-port=21/tcp
    $ sudo firewall-cmd --reload 

You can also remove these with the commands **--remove-service** and **--remove-port**. 
