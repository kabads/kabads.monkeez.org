---
layout: post
categories:
- sysadmin
date: 2015-10-31T00:00:00Z
title: How and why you should be using 2 factor authentication
url: /2015/10/31/how-and-why-2-factor-authentication/
---

[Two factor authentication](https://en.wikipedia.org/wiki/Two-factor_authentication) provides another layer of security to any sign in for services you use. By enabling 2 factor authentication, you are using another layer of security when signing in. However, this extra layer of security is a physical one, not necessarily digital. The 2 factor authentication requires a particular object which cannot be replicated. This can be the form of a USB key or a mobile phone. Banks have used this before with card readers which produce a particular code. Without the card reader and card you cannot produce a code. 

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/yubikey/8188472266/in/photolist-dtA4wj-aHvbsV-aHvgug-wJWq6w-aHvbLt-aHvbCZ-btbiYN-zH9a8E-aHvbR8-5TkRQn-85uwKS-85roY8-85roA8-85uxj3-85rnGF-85rnCB-67V1ci-aHvbPa-6D1tTY-dtuwC4-dtA4rY-6CWjkK-dtA4A9-6C9tJE-6CWiRk-7o6R3s-aD61qy-4MZZ6R-4Rq6tZ-5272VG-oTMLP1-ejtLZs-dtA4KU-o43Lex-6C4FGg-6C4FDB-egjg7H-ikat1i-a2NWgr-a2RMKh-a2NVRZ-a2NW2K-oivyHA-okkMLL-okvsCU-oivyCL-okfQGT-okfQyM-okkMtb-okfQx4" title="Three YubiKeys"><img src="https://farm9.staticflickr.com/8342/8188472266_df1e448ab9_k.jpg" width="2048" height="1280" alt="Three YubiKeys"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

There are some simple steps when signing in:

1. sign in using your regular username and password
2. using a different object produce a code and enter that in when signing in.

Understanding this is important, because if you do not have the object to hand, you will not be able to sign in, regardless of having your username and password. If you like to sign in regularly without your phone close by, or your USB key, then you will find this service very inconvenient. 

[Yubikey](http://yubico.com) is a form of physical 2 factor authentication which is secure and portable. It is a small USB key that when inserted acts as a keyboard, sending one time passwords to an application. That application hands off the password to a Yubico server who then authenticates whether it was geniune or not. A yubikey can be used on any hardware with a USB port and with later versions (the Yubikey Neo) you can use Near Field Communication (NFC), which means that the hardware only need be close to the other device to transmit a one time password. The Neo version can also store OpenPGP keys which means that you can store encryption keys securely without them ever (being transported through another machine).

The Yubikey is easy to use and set up and provides a very secure way of accessing data in the cloud. You can integrate later versions with Google Apps and Dropbox and access to servers through SSH. By using a service like [Lastpass](https://www.lastpass.com), you can have one master password and a Yubikey to store all your passwords. Lastpass allows you to create unique passwords for every site, each one being randomized and very long. These passwords are particularly secure. Lastpass stores them in an encrypted 'vault' which requires you to have a password to access this. By also using a Yubikey, this protects your passwords by having a physical device and a long secure password.

Google also provide two factor authenitcation through an android phone, where you use an app called Google Authenticator (available through the Play Store for free) which creates a code for each machine you log in to in your google account.

By using these methods, you greatly increase your security and chances of being hacked. Using strong passwords through a service like Lastpass means that a malicious user will have a hard job trying to brute force your password. Even if this is successful, the malicious user will only have access to one of your online accounts. 
