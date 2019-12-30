---
layout: post
title: Setting Filesystem ACLs on Linux
date: 2019-12-30
categories: 
- sysadmin
---

ACLs are a method for defining access to files and directories on a system. These can be set at the user level, group level, or via the effective rights mask.

The commands ```getfacl``` and ```setfacl``` are used to get and change ACL permissions respectively. If you are setting for a specific user then the text form of the attribute is ```user:username:rwx```. If you want the permission to apply to the default user (or group) then you would use the text term ```user::rwx```

To check the status of any extended Access Control Lists:

    getfacl filename

To update a file access control list, you would use:

    setfacl -m u:lisa:r filename

This would give the user ```lisa``` read access to the file. 

Where a user is specified, this can also be done for a group:

    setfacl -m g:wheel:r filename

To remove access from a file:

    setfacl -x filename

Note that this will remove all extended permissions from that file.

To remove just one access control use the ```-``` character:

   setfacl -m u:lisa:r-x filename

By adding an ```-R``` flag, an ACL is applied recursively (i.e. to directories and files below the path specified). 

    setfacl -R -m u:lisa:rwx directory_name

This will provide read, write and execute to the directory ```directory_name``` and any files within that directory.


