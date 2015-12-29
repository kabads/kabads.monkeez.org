---
title: Using sed
category: sysadmin
layout: post
---
## Uses

*_sed_* is a quick command line utility to change text within a file, or input stream. Typically, it is used within a pipe situation (i.e. using the character | on the command line). If you are not familiar with that command, you will need to research that before continuing.

A simple use of *_sed_* is to replace characters in a stream or file. This is done using [regular expressions](https://en.wikipedia.org/wiki/Regular_expression). This will help you search for a set of characters and then replace them with the alternative. This is done using the ***s*** command.

### Replacing text with **sed**
