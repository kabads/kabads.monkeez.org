---
layout: post
categories:
- sysadmin
date: 2015-08-27T00:00:00Z
title: How to set-up RAID on Linux
url: /2015/08/27/how-to-set-up-raid-drives-linux/
---

[RAID](https://en.wikipedia.org/wiki/RAID) disks offer particular advantages over ordinary single disk set up. Data redundancy is improved (consider it to be a continuous backup) and also significant performance can be seen with the correct configuration.

There are different types of [RAID levels](https://en.wikipedia.org/wiki/Standard_RAID_levels) and each level will need to be chosen on a use-case:

- RAID 0: Uses only striping - this makes two disks appear like one larger disk. Provides a performance boost when accessing disks.

- RAID 1: uses only mirroring - each disk has a duplicate. Ideal for data recovery. At least two disks are required. 

- RAID 5: uses rotating parity strip; a single drive failure will cause no loss of data, only a performance drop. Three disks are required.

- RAID 6: has striped disks with dual parity; it can handle loss of two disks, and requires at least four disks. 

- RAID 10: is a mirrored and striped data set - requires at least 4 drives.

Firstly, you should have at least two partitions that have been set to the file type 'fd', using fdisk.

The command that helps us manage RAID drives is __*mdadm*__ - ensure that it is intalled - the following command will do this on Ubuntu.

	$ sudo apt-get install mdadm

Then, set-up the array with the following command:

	$ sudo mdadm --create /dev/md0 --level=1 --raid-disks=2 /dev/sdbX /dev/sdcX

You will need to change the level according to the RAID level that you chose from above, and the number of disks, if this is different from 2.
Now is the time to create the filesystem:

	$ sudo mkfs.ext3 /dev/md0

Obviously, you can choose the filesystem according to your taste. 
	
Next, /etc/mdadm.conf needs changing, which can be done with the following command:

	$ sudo bash -c "mdadm --detail --scan >> /etc/mdadm.conf"

Create a mount point:

	$ sudo mkdir /myraid

Then mount the drive to the point:

	$ sudo mount /dev/md0 /myraid

That will provide a drive with root permissions, which will need change if you require other users to use this drive.


