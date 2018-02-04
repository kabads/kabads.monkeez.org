---
categories:
- tech
date: 2017-06-10T00:00:00Z
title: How to install LineageOS on Wileyfox Swift
url: /2017/06/10/how-to-install-lineageos-wileyfox-swift/
---

With the demise of Cyanogenmod and CyanogenOS people who like to keep a cheaper phone up to date will have to familiarise themselves with [LineageOS](http://lineageos.org). This is the fork of the latest version where CyanogenMod left off. As the company shutdown, users are left with no updates. LineageOS will resolve this for you. 

It had been a while (8 months) since installing a new custom ROM, so I wasn't so familiar with the TWRP recovery boot process. I had a couple of problems installing this - it seems that the latest image doesn't work and neither does 3.0.1 - so had to go for 3.0.0. Download that to your computer, then make sure you have a working copy of [adb](https://developer.android.com/studio/command-line/adb.html). Then in the command line with your phone plugged in via USB with USB debugging switched on, type: 

    adb flash recovery twrp-3.0.0.img 


This booted and allowed me to update the files. From there it was very simple.

    adb push lineageos.zip /sdcard/

If you want to install Google Apps (go for open_gapps), push that zip file to in the same way:

    adb push open_gapps.zip /sdcard/ 

If root is required push the [addonsu zip file](https://download.lineageos.org/extra):

    adb push addonsu.zip /sdcard/

and then run power off and reboot in to recovery mode. Once in recovery mode, you need to wipe the system and data partitions. Then, install the .zip files that you pushed earlier - firstly with the lineageos.zip, then gapps.zip and then as an optional the root zip.

Once you reboot, you will have a new lineageos install and have to feed in any particular personal details or Google Accounts. 
