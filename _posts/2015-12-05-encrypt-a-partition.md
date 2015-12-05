---
layout: post
title: Encrypt a partition on Linux
category: sysadmin
---
### Introduction

An encrypted partition can add a layer of security to your system. When initialized, it will ask for the passphrase which, if unavailable, will not allow proper mounting. This renders the information on the drive as unreadable.

Most systems use the [Linux Unified Key Setup](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) (LUKS for short) format for encryption and this can be a standard install for most distribution.

## Steps for setting up LUKS

### Setting up the drive 

Firstly you should have a partition drive that is unmounted and unformatted (no filesystem). The filesystem will be added once encryption has been setup. 

You must also have the cryptsetup tool install. On Ubuntu, this is achieved with:

    $ sudo aptitude install cryptsetup

__sudo__ must be used for all of these commands.

To set up the drive for LUKS, enter this command:

    $ sudo cryptsetup luksFormat /dev/drive

This drive can be a Logical Volume Management drive, or some other disk.

After this, you will need to enter "YES" (without quotes) to confirm that you want to encrypt the drive. Note that the response is all uppercase.

Then you will need to enter a passphrase which will be used to encrypt the drive.

You will need to open the drive with:

    $ cryptsetup --verbose luksOpen /dev/drive/ SECRET_NAME

Replace SECRET_DRIVE with a name of your choice - this will be referred to later.

Formatting the drive is done as usual

    $ sudo mkfs.ext4 /dev/mapper/SECRET_NAME

### Opening the drive

Mounting the drive for use:

    $ sudo mount /dev/mapper/SECRET_NAME /mnt/encrypted_disk

### Closing the drive once finished

You must __luksClose__ the drive once you have finished writing to it.

    $ sudo umount /mnt/encrypted_disk

    $ sudo cryptsetup luksClose /dev/mapper/SECRET_NAME

This will write out all data and finish with it. To reuse you must start again at the step above with __luksOpen__ command.

### Conclusion

This will encrypt and mount a drive on your machine which will stay safe if you don't reveal the passphrase to anyone. You can auotmount this at boot, and either be prompted for the passphrase, or have the passphrase stored in a file. However, automatically decrypting and mounting on boot will be a waste of time, as anyone who has access to that machine will already have bypassed the encryption stage.
