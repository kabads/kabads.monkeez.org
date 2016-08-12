---
layout: post
title: How to upload a file to Amazon S3 and then check that the md5sum matches
category: sysadmin
---

<img src="https://dl.dropboxusercontent.com/u/264998/site/kabads.monkeez.org/photos/md5.png" class="pull-left myclass"/>I have a client who likes to back up their work. They are a sensible client. They use [Amazon S3](https://en.wikipedia.org/wiki/Amazon_S3) for cheap storage. Before we do any work on their servers, I like to back stuff up to S3. However, data can become corrupt during transfer.

To mitigate this, we do an [md5sum](https://en.wikipedia.org/wiki/Md5sum) whici is a command line tool that checks a 128-bit MD5 hash. This creates a digital finger print for the file which allows you to check the integrity of that file with a copy.

This is usually used when downloading a file from the internet or from a server so that you can you check the file is exactly the same as the original.

The first thing to do is to create your Amazon S3 bucket through the AWS console. Then, create a user and put them in a group so that they have read/write access to the bucket. Then run

   s3cmd config

You will need to enter in all the access key and credentials. This will run a test access to that bucket. Once it is completed, you will be able to upload the file to S3.

    s3cmd put s3://your-bucket-name

Once that uploads the file you can check the md5sum with:

    md5sum your-local-file

    s3cmd ls --check-md5 s3://your-bucket-name

If they are the same string, then the files are exactly the same.

