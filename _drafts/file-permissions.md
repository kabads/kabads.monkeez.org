---
title: File Permissions on Linux
category: sysdamin
layout: post
---

## File Permissions
The linux kernel provides a way of protecting access to particular parts of the filesystem, controlled with permissions. There are three groups of permissions that the kernel allows files to be attributed to. User permissions are the permission of the owner of the file/directory. Group permissions are permissions that can access the file according to that group. World (or other) permissions are for every other useron the system.

You can provide no access, read access, write access or executable access to each of the three types of group (user, group, other). Read allows the contents of the file to be read, but nothing else. Write allows the file to be read and written to (i.e. the contents can be changed). Executable, means that you can run the file (if it is a script or executable program).

Using the combinations above you can prevent other users from accessing sensitive information on the system. 