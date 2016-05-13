---
layout: post
title: How to upload a file to Amazon S3 and then check that the md5sum matches
---
I have clients who like to back up their work. They are sensible clients. They use [Amazon S3](https://en.wikipedia.org/wiki/Amazon_S3) for cheap storage. Before we do any work on their servers, we like to back stuff up to S3. However, data can become corrupt during transfer.

To mitigate this, we do an [md5sum](https://en.wikipedia.org/wiki/Md5sum) whici is a command line tool that checks a 128-bit MD5 hash. This creates a digital finger print for the file which allows you to check the integrity of that file with a copy.

This is usually used when downloading a file from the internet or from a server so that you can you check the file is exactly the same as the original. 