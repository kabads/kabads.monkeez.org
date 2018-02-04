---
layout: post
category: sysadmin
title: How to extend a LVM drive from an additional hard drive
---

### Problem
You have a drive that you want to add more space to. However, you want all the data to remain intact. This would usually involve a lot of copying data and then installing a rescue disk and trying something complicated with gparted.

However, with [LVM](https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux) (logical volume management), this is easily managed. LVM lets you resize partitions and grow filesystems with very little hassle and risk of data loss.

Initially, you add the harddrive and then find out the drive letter that has been assigned. This might be something like ***/dev/sdb***. Once you have found this you can partition the drive:

    $ fdisk /dev/sdb

n for new partition, accept or adapt the values that you are presented with, then set the type of the drive to the hex value ***8e*** - this is the LVM filesystem. Then exit fdisk with the 'w' key which will write the changes to disk.

    $ fdisk -l /dev/sdb

will show the partition state afterwards.


