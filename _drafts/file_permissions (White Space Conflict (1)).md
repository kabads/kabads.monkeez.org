---
title: File Permissions on Linux
category: sysdamin
layout: post
---

## File Permissions
The linux kernel provides a way of protecting access to particular parts of the filesystem, controlled with permissions. There are three groups of permissions that the kernel allows files to be attributed to. User permissions are the permission of the owner of the file/directory. Group permissions are permissions that can access the file according to that group. World (or other) permissions are for every other useron the system.

You can provide no access, read access, write access or executable access to each of the three types of group (user, group, other). 