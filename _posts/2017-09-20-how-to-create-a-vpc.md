---
layout: post
categories:
- sysadmin
date: 2017-09-20T00:00:00Z
title: AWS - How to Create A VPC
url: /2017/09/20/how-to-create-a-vpc/
---

AWS allows you to create your own virtual private cloud (or [VPC](https://en.wikipedia.org/wiki/Virtual_private_cloud)). This is a network within which your machines will communicate. You can control the level of access across your VPC through subnets, Network Access Control Lists and Security Groups.

Network Access Control lists allow particular traffic in and outbound, but are stateless; that is, if you allow traffic in, it doesn't necessarily mean that traffic will leave the network. This can cause problems for services that use ephemeral ports (e.g. SSH over port 22 - the incoming port is always port 22, but not always outbound on port 22).


