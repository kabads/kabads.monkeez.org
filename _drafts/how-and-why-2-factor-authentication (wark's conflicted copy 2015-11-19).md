---
layout: post
category: sysadmin
title: How and why you should be using 2 factor authentication
---
[Two factor authentication](https://en.wikipedia.org/wiki/Two-factor_authentication) provides another layer of security to any sign in for services you use. By enabling 2 factor authentication, you are using another layer of security when signing in. However, this extra layer of security is a physical one, not necessarily digital. The 2 factor authentication requires a particular object which cannot be replicated. This can be the form of a USB key or a mobile phone. Banks have used this before with card readers which produce a particular code. Without the card reader and card you cannot produce a code. There are some simple steps when signing in:

1. sign in using your regular username and password
2. using a different object produce a code and enter that in when signing in.

Understanding this is important, because if you do not have the object to hand, you will not be able to sign in, regardless of having your username and password. If you like to sign in regularly without your phone close by, or your USB key, then you will find this service very inconvenient. 

[Yubikey](http://yubico.com) is a form of physical 2 factor authentication which is secure and portable. It is a small USB key that when inserted acts as a keyboard, sending one time passwords to an application. That application hands off the password to a Yubico server who then authenticates whether it was geniune or not. 