---
categories:
- sysadmin
date: 2016-11-20T00:00:00Z
title: Finding large files in a directory
url: /2016/11/20/finding-large-files-in-a-directory/
---

I have directories that [agedu](http://www.chiark.greenend.org.uk/~sgtatham/agedu/) shows as having large files. However, agedu doesn't tell me what the names of the files are.

A quick find will sort that

```    find . -maxdepth 1 -type f -exec \/usr\/bin\/ls -al {} \; | awk '{print $5,$9}' | sort -nr >  bigfiles.txt
```

Run this, and you will have a file called bigfiles.txt that has the size in bytes and the filename. This does not work recursively, with the flag -maxdepth 1 preventing that. 
