---
title: "Setting Up Fujitsu Snapscan S1300i on Arch Linux"
categories:
- sysadmin
date:  2019-03-10T18:15:30Z
---

I have bought a Fujitsu Snapscan S1300i scanner - mainly because it is duplex - it saves a lot of time and will scan directly to Evernote. So far, I'm pleased with it, but the initial thought when I got it home was, 'how am I going to get it working with Arch Linux?'

Fujitsu Scansnap 1300i is supported by Sane, but does require a little bit of tinkering. You need the file 1300i_0D12.nal - which is only available from installing the file on a windows machine. If you wish to download it, you can from here https://drive.google.com/open?id=1X7fUpu6cM4ow_D9QqAKVvHIGVWOmhvK7 - put that file in the directory /usr/share/sane/epjitsu (on Arch Linux).

Now, edit the /etc/sane.d/epjitsu.conf file - you need to include the settings found at http://www.sane-project.org/cgi-bin/driver.pl?manu=fujitsu&model=scansnap&bus=any&v=&p= 0x04c5/0x128d -

    # Fujitsu S1300i
    firmware /usr/share/sane/epjitsu/1300i_0D12.nal
    usb 0x04c5 0x128d

Once you've done this, you may need to test the config with superuser rights (sudo gscan2pdf).

Running gscan2pdf will present you with a choice of scanners - for some reason gscan2pdf picks up my in built camera, which I change to the Fujitsu. To scan duplex you will need to change the settings to standard_tab > scan source_dropdown= ADF- Duplex.
