---
layout: post
categories:
- sysadmin
date: 2015-10-18T00:00:00Z
title: Linux group explained
url: /2015/10/18/groups-explained/
---

Users on a linux system belong to at least one group. Groups allow a systems administrator to create parts of the filesystem where a group of users can share files. They also allow a group of users to access particular commands or resources on the system, that other users might not be able to access.

Groups are defined in the **/etc/group** file, which is only root writeable.

To create a group, the **groupadd** command is used.

    $ groupadd editors

will add a group called '''editors'''. This will automatically set gid (a numerical value for the group's ID). 

You may then add a user to this group with the **usermod** commmand.

	$ usermod -G editors username

Obviously, you can choose a name other than 'editor' which better describes the group.

Now, check the membership of the group with the command ***groups***:

	$ groups username

This will show all the groups that the user belongs to. This can be carried out for as many users on the system that you wish to have access to the files (or fileserver).

Now, create a directory with ***mkdir***:

	$ mkdir /path/to/dir

Then add that directory to the group that you created:

	$ chown username.editor /path/to/dir

This will add the directory to the group.

Any user who is a member of the group editor will be able to access the directory that is shared. This may or may not include read/write access, depending on the directory and file permissions across the shared directory. 
