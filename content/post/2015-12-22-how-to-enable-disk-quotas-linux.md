---
categories:
- sysadmin
date: 2015-12-22T00:00:00Z
title: How to enable disk quotas for users
url: /2015/12/22/how-to-enable-disk-quotas-linux/
---

### Uses

Linux allows setting quotas on a filesystem. This will prevent users from using more diskspace than they are allowed. This can also be used to manage group allowances to enforce the allowance for a collection of users. Stopping users from filling up a diskspace can be an important on a shared system as filling up a physical disk drive can bring a system down, or make it unstable.


###Steps

Initially, you will need to mount a filesystem with a 'usrquota' or 'groupquota' command passed in /etc/fstab. After these have been applied, you will need to remount the drive for the quota to be effective.

     /dev/sda3 /home ext4 defaults,usrquota 1 1 

     $ sudo mount -o remount /home

Next, run **quotacheck** on the filesystem to set up quotas.

    $ sudo quotacheck -vu /home
    
Then, set the quotas as active with **quotaon**

    $ sudo quotaon -vu /home

Finally, edit the quota for each user with **edquota**

    $ sudo edquota someusername

You can also add grace periods with edquota, which allows users to plan for their storage needs if they exceed it with a time limit on moving their data.

When using **edquota** if you set a limit to 0 then this will mean that no limit will be enforced for that user or group. 
