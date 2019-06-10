---
layout: post
categories:
- reading
date: 2016-08-25T00:00:00Z
title: How to download newspapers with Calibre and deliver to your Kindle
url: /2016/08/25/downloading-newspaper-using-calibre/
---

So, I have read a few pages which outline how to do this, but none seem to sum all of it. I've set up my Raspberry to download a newspaper and then deliver it daily to my Kindle. I paid for a subscription (in fact, I pay for more than one subscription) so I feel entitled to do this, as I'm supporting the journalists financially.

Firstly, you will need to install [Calibre](https://calibre-ebook.com). My RaspberryPi doesn't have an X server running and this made it trickier, as I don't want a lot of bloat on this machine (it's not hugely powerful). Calibre does pull in a load of libraries, but they will only use up space, not resources. Then you will need the newspaper .recipe file. This was the trickiest part. I didn't know how other people were getting these recipes on their machine and they didn't seem to mention. I know that when you run Calibre through the gui you can easily choose one of the recipes. However, I didn't have that luxury. To get around this, I visited the [github repository for Calibre](https://github.com/kovidgoyal/calibre/tree/master/recipes) and found the .recipe file I was looking for and posted that on to the RaspberryPi.

Then I ran the command:

    ebook-convert ./PATH-TO-CALIBRE-RECIPES/newspaper.recipe newspaper.epub --output-profile=kindle

You can change the filenames so that it suits your particular situation. Once this is run, it will look at the recipe script and start downloading the files, and constructing the .epub file. If you want to read this on your Kindle, you will need to convert it to a .mobi file.

Calibre will also allow you to email the file to your Kindle (this is one of the good features that Amazon have built in to the Kindle). If you have a Kobo or other e-reader, you can connect a cable and put it on your device. If you have a different way of uploading this file on to your device, please let me know in the comments below. It is possible to run Calibre as a web service, so you could browse this server from your e-reader (if it has a browser) and then download it that way.

    /usr/bin/calibre-stmp from@email.com to@email.com "Sent from" -r smtp.gmail.com -u user@gmail.com -a newspaper.epub -p password -e TLS --port 587 

This command can be put in to a script file and then called from cron. 
