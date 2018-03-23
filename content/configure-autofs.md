---
title: "Configure Autofs"
date: 2018-03-23T09:09:48Z
draft: true
categories:
- sysadmin
---

# What is Autofs?
It mounts a filesystem that is not always connected (e.g. network or device). Once a connection is made to that device, then autofs will handle the mounting of that device. It can also handle unmounting of a device, if it becomes unavailable. `/etc/fstab` automatically tries to mount during boot - however, it won't try to mount once a device is connected after boot. You may boot whilst you have no network access - this means that you won't be able to mount that device. However, autofs will look after that, once you connect to the network (after boot).

# Install the package

    pacman -S autofs

# Configure the master autofs `/etc/autofs/auto.master`

    /var/autofs		/etc/autofs/auto.misc

Each line in the file has three fields - the first two being mandatory, and the last being optional. The first is the mount-point - where will it get mounted. The second is the map-file that is a template. The last one is a time field.

You can also pass the `--timeout=30` at the end of the file which means it will be unmounted after that time of not being used.

# Configure the `auto.misc` file

    usb     	-fstype=ntfs            :/dev/sdc2


Start the service to test:

    sudo systemctl start autofs.service

And then enable so that it will run at boot:

    sudo systemctl enable autofs. service 

You will need to attempt to use the filesystem for it to mount

    cd /mnt/usb

and the disc should mount.

