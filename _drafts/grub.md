---
layout: post
category: sysadmin
title: Grub
---
# GRUB
The 'Grand Unified Boot Loader' loads after the BIOS system to load the Operating System. It allows you to choose other operating systems at boot, along with other kernels and boot option parameters.

Configuration files for GRUB 2 are /boot/grub/grub.cfg and for GRUB 1 /boot/grub/grub.conf or /boot/grub/menu.lst.

Once booted, you can use arrow keys to choose the operating system and kernel that need to boot.

GRUB also allows you to edit the config file to change parameters. Just by pressing the 'e' key, editing of the configuration is possible.

Installing GRUB can have different meanings:
1. Installing GRUB program and utilities. GRUB 1 installs a programme called **grub** but GRUB 2 installs **grub2-**
2. Installing the files GRUB needs to operate at boot time - under either /boot/grub or /boot/grub2. These are separate to the kernel files, which will also reside in the /boot directory. 
3. Installing GRUB as the boot loader in the system; usually this is done at the front of the entire disk.

If you didn't install GRUB at the usual system installation, you can do this later on with

    $ sudo grub2-install /dev/sda

Be careful when doing this as this can render your system as unbootable.

In both GRUB versions, the first hard drive is denoted as **hd0** and the second as **hd1**. However, in version 1, partitions start from 0 and in version 2 from 1.

- sda1 is (hd0,1) in GRUB 2 but (hd0,0) in GRUB 1
- sdc4 is (hd2,4) in GRUB 2 but (hd2,3) in GRUB 1

It is much more likely that a recent distribution is using GRUB 2 so the rest of the article will be based on that. 

** Customizing the GRUB config file

Do not edit the grub.cfg file directly. Other files will be used to construct the grub.cfg file. The first file is /etc/default/grub.

The other directory that matters is /etc/grub.d where files run in ascending order when the configuration file is updated or created - it uses a numbering system to order the files.


