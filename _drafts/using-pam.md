---
layout: post
category: sysadmin
title: Using PAM on Linux
---
[PAM](https://en.wikipedia.org/wiki/Pluggable_authentication_module)(pluggable authentication module) is a tool which other software packages can use to check authentication on a system.

With modern distributions, PAM is normally installed by default. PAM has configuration files (usually within /etc/pam.d) which holds files for a service (e.g. sshd and sudo). The configuration file is made up of different management groups:
- auth: instructs the application to prompt the user for identification (username and password). 
- account: checks on aspects of the user's account such as password aging, access control, etc.)
- password: updates the user authentication token, usually the password.
- session: used to provide functions before and after the session is established.

Each of these groups can be set with the following flags:
- required: must be successful for the service to be granted.
- requisite: same as required, but a failure in any module terminates the stack and a return status is sent to the application. 
- optional: module is not required. If it is the only module then its return status might cause the application to fail.
- sufficient: if this module succeeds, then no further modules in the stack may be required. If it fails, then it will check through the stack for success.

**man pam.d** can give other details on other flags.

## Authentication process using PAM
1. A user invokes a PAM-aware application (e.g. **ssh**).
2. The application calls **libpam**
3. The library checks for files in /etc/pam.d/; these determine which PAM modules to invoke, including **system-auth**
4. Each referenced module is executed in accordance with the rules of the relevant configuartion for that file for that application.


