---
layout: post
title: Should updates be automated?
category: sysadmin
---

Server automation seems like a good idea, right? Sometimes, yes, and sometimes, no.

Many services on a server need to be kept running despite the fact that maintenance needs to take place. Some sysadmins will notify their users that downtime will occur and plan this work in and the users will need to ensure that they also work around this. Sometimes this means working through the night, or at a time when people are not using the service. This is a sensible approach, but is costly. You need someone to work at times that most other people don't want to work and they need to be reliable - i.e. get the job done in a timeframe. This is difficult to do.

So, automate the process? Does this remove the problem? Well, yes and no. It does mean that the work can be carried out in the middle of the night. However, when a system upgrades automatically it doesn't necessarily mean that the proess will go smoothly. This is also called an 'unattended upgrade' which is a good term to describe the process. If the system is unattended and something goes wrong during the update, the service might not necessarily come back up. You may wake up in the morning to some support tickets which require sorting out. It might be harder to get hold of a system administrator once things have gone wrong, after the fact.

However, there are times when automation can definitely be used. A good system administrator will automate the boring stuff. You can automate a backup script and run checks on the fact that the backup has run. You can run scripts which manages file transfers to a different location. 
