---
layout: post
categories:
- sysadmin
date: 2017-10-03T00:00:00Z
title: How to create an instance that pulls your website content automatically
url: /2017/10/03/AWS-how-to-automatically-launch-apache-with-your-site-content/
---

Amazon Web Services allows you to spin up instances very quickly. This how to will show you how to upload your content to a S3 bucket and then launch an instance that pulls that content in and starts Apache to serve that content.

Initially, you will need to create a role under IAM. This will have to be able to access S3, so create the role, choose which service you would like to associate it with.

Then create an S3 bucket and upload all the files that your website requires.

<blockquote class="imgur-embed-pub" lang="en" data-id="a/lB2uu"><a href="//imgur.com/lB2uu"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

Provide permissions for your role. Searching for S3 will limit the amount of permissions you can see - you can permit read only or Full Access depending on what your EC2 instance will be doing. Review by giving the role a name and a description.

Then, launch an EC2 instance with this role.

<blockquote class="imgur-embed-pub" lang="en" data-id="a/35ebr"><a href="//imgur.com/35ebr">Allocate the IAM role to the EC2 instance</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

On the same page as the role selection, you will see advanced details at the bottom. You need to type in the script in the user data. This is a script that will run on launch:

    #!/bin/bash
    yum update -y
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    aws s3 cp s3://your-bucket-name/ /var/www/html --recursive

This will run once it has started the EC2 instance. It will update the machine to ensure that all packages are at the latest release, then install Apache, then start Apache, then ensure that apache starts by default if this instance is restarted for some reason, and then the files are pulled down from the S3 bucket and put in to `/var/www/html`. You will need to have created a bucket and put the files in there that you require. 

