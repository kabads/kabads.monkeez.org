---
layout: post
category: sysadmin
title: Bash find command

---
## Find command
I've been using the find command simply since I can remember, but I've never really got to see the true power of this command. Combined with the -exec flag this command can throw up a lot of different uses. -exec allows you to work with other bash commands and operate on them.

A basic use would look like this:

    $ find . -name "*" -type f -size +10M -exec rm {} \;

Let's break this down. The first full-stop (sometimes called a period) tells the command which directory to work on - in this case, the current directory.

The second flag, **-name**, tells the command which file we are looking for. In this case the wildcard __*__ will search all files in the directory.

The third falg, **-type f** directs that we are only looking for files (i.e. do not carry out this command on directories).

The fourth flag, **-size +10M** states that we are looking for files which are 10MB or greater.

Here comes the magic - the **--exec** flag does the grunt of the work. It will execute the **rm** (remove) command on the file which is denoted by **{}**.

Finally, we finish off the whole script with a __\;__, which is required due to using the **-exec** flag. You can string more than one **-exec** flag together after this semi-colon to carry out more than one command.



