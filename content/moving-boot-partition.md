---
title: "Moving Boot Partition (EFI/EPS partition)"
date: 2018-03-13T19:42:17Z
draft: true
---

If you've been using Linux for a few years, you'll probably remember that 100MB for a /boot partition was no problem. However, that has changed. Whilst you don't need a datacentre for a /boot partitions, you might want to install other kernels to help you tweak your system and yet not delete kernels that you are using.

This article makes a few assumptions - you will be using systemd-boot to boot and you are familiar with resizing partitions, mounting them and moving files around.

You will need to use gparted to resize a partition to free some space up. This is to create a new EFI partition. This is where the kernels have to live (if you are using systemd-boot) along with the efi files. Using gparted, you can make a partition somewhat smaller, especially if that partition isn't completely full. With the free space you have, use gdisk to create a new EFI partition.

    gdisk /dev/sdb

With gdisk, give that partition a file type of `ef00`. 

Your new partition will have a new letter - to save a reboot you can issue partprobe to pick up the new partition - in this case `/dev/sdb5`. 

Then once you've created the new partition, it will need a file system.

    sudo mkfs.vfat -F32 /dev/sdb5

Mount that partition somewhere:

    sudo mount /dev/sdb5 /media/mountpoint 

Then, copy over all the files you have in your current boot partition.

    sudo cp -R /boot/* /media/mountpoint/.


Then, run the bootctl command to install it. In my case, I will still using `gummiboot`, so I moved that directory out and then issued in the install command:

    bootctl --path=/media/mountpoint install

Then, you can change the filetype of your old EFI partition:

    gdisk /dev/sdb1

Change the filetype to `8300` - this means it won't be selected for boot.

Ensure that the new boot partition is in your `/etc/fstab`.

    /dev/sdb5 /boot 	 defaults 0 0

Time for reboot - have a live CD/DVD handy just in case.

Once the system reboots, you can intall more kernels and have fun messing around withem.

In my case, I had to copy a file in the loader directory in `/boot` partition to create a new conf file for my `linux-lts` kernel.

** Further reading

If you want to get this project underway, you will need more information than just this post - I can highly recommend the [the ArchLinux Wiki](https://wiki.archlinux.org/index.php/Systemd-boot).