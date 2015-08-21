---
layout: post
category: sysadmin
title: How to set-up LVM on Linux
---
<a data-flickr-embed="true" data-header="false" data-footer="false" data-context="false"  href="https://www.flickr.com/photos/kabads/20580819929/in/datetaken-public/" title="hard-disk-775847_1280"><img src="https://farm1.staticflickr.com/606/20580819929_7109d8f28b_m.jpg" width="240" height="160" alt="hard-disk-775847_1280"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

What are the advantages of [Logical Volume Management (LVM)](https://en.wikipedia.org/wiki/Logical_volume_management)? LVM treats your physical harddrives as 'elastic' storage - that is extents can be across disks allowing filesystems to be across many disks and/or partitions. This allows a lot of flexibility and can allow filesystems to shrink or grow easily.

So, how do you set up LVM? I suggest you learn using a virtual machine - this post  will cover [Ubuntu 14.04 server edition](http://www.ubuntu.com/download/server).

Firstly, set up your partitions with type 8e - this will be done with fdisk - type 't' and then choose the partition number and then type 8e - this is an LVM type partition. This needs to happen for all the partitions that will be included in the LVM device.

After creating the new partitions you will need to do one of a couple of things so that the kernel can see them - reboot or run partprobe. Without this, the kernel won't see the newly created partitions and you will not be able to work on them further. It's at this point that one usually creates a filesystem on these partitions. When setting up LVM, this is not yet the case. 

Then,

	$ sudo pvcreate /dev/sda3
	Physical volume "/dev/sda3" successfully created

	$ sudo pvcreate /dev/sda4
	Physical volume "/dev/sda3" successfully created

	$ sudo pvdisplay
will show you all the physical volumes that are available to LVM.

This will create a physical volume which can be used within a virtual volume.

	$ sudo vgcreate mylvm /dev/sda3 /dev/sda4
	Volume group "mylvm" successfully created

This creates a volume group.

	$ sudo vgdisplay

will show you the newly created volume group. 

Now, for the final key part - creating the logical volume

    $ sudo lvcreate --name myfilesystem --size 1G mylvm
	Logical volume "myfilesystem" created

	$ sudo lvdisplay

will show you the logical volume filesystem that has been created (although it doesn't yet have a filesystem on it). The next step will do that.

	$ sudo mkfs.ext3 /dev/mylvm/myfilesystem

Now this filesystem can be mounted like any other filesystem and written to:
	$ sudo mkdir /mnt/lvmdrive
	$ sudo mount /dev/mylvm/myfilesystem /mnt/lvmdrive

Once you have sorted out permissions for this drive you will be able to write to it.

	$ chmod -R 777 /mnt/lvmdrive

