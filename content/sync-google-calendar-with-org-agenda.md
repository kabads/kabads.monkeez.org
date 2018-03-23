---
title: "Sync Google Calendar With Org Agenda"
date: 2018-03-18T13:02:55Z
draft: true
categories:
- sysadmin
- emacs
---

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/kabads/40931410022/in/datetaken/" title="screen"><img src="https://farm1.staticflickr.com/790/40931410022_e1823676da.jpg" width="500" height="316" alt="screen"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

I use [org-mode](https://orgmode.org) an awful lot - it helps me manage my tasks and code all in one place. However, the organisation that I work for have just migrated over to Google Suite and manage meetings extensively using Google Calendar. I really wanted my Google Calendar to sync with my [org-agenda](https://orgmode.org/manual/Agenda-commands.html). Org-agenda is a tool that pulls in any scheduled activities from all your files in to one dynamic view. It's pretty much what drives my working day. Having meetings arranged with colleagues in my org-agenda will help me schedule my day.

The package [org-gcal](https://github.com/myuhe/org-gcal.el) provides two way syncing with Google Calendar (and has other documentation).


This is how I did it.

## Install org-cal

Using elpa, I installed the package:

    M-x package-list

Highlight the `org-gcal` package and install. 

## Create Api Credentials

Then, go to google and get credentials to access your calendar. You will need to go to the [google developers portal](https://console.developers.google.com/cloud-resource-manager) where you may need to enable the developers' api. You will need to find Api & Services and then click on credentials. You will create some OAuth 2.0 client IDs credentials - one being the API key and the other being a secret. Make a note of these, or download the JSON file that Google provides. 

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/kabads/26101808357/in/datetaken/" title="Screenshot-2018-3-23 Credentials - org-gcal"><img src="https://farm1.staticflickr.com/799/26101808357_5446e2c69d.jpg" width="500" height="229" alt="Screenshot-2018-3-23 Credentials - org-gcal"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Enable these credentials for Google Calendar. 

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/kabads/40931425052/in/datetaken/" title="Screenshot-2018-3-23 APIs Services - org-gcal"><img src="https://farm1.staticflickr.com/818/40931425052_9051ec90df.jpg" width="500" height="241" alt="Screenshot-2018-3-23 APIs Services - org-gcal"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>


## Identify Calendar

Then, the README for org-cal tells you to find the link for your calendar. This didn't work for me. Instead, I found the link in the url in the address bar of my browser (click on the image to see more detail):

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/kabads/40263945734" title="url"><img src="https://farm1.staticflickr.com/805/40263945734_3272338f4e_c.jpg" width="800" height="105" alt="url"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

## Create settings

   (require 'org-gcal)
   (setq org-gcal-client-id "your-id-foo.apps.googleusercontent.com"
      org-gcal-client-secret "your-secret"
      org-gcal-file-alist '(("your-mail@gmail.com" .  "~/schedule.org")
                            ("another-mail@gmail.com" .  "~/task.org")))

Copy that string in to your `~.emacs` file, substituting the proper parts (your org-gcal-client-id and secret and the files that you wish to create when you sync).

Save the file and then execute `M-x load-file <RET>.emacs` to reload this file. 

## Sync and org-agenda-file-to-front

Now you need to sync your calendar, which will create a new org file (as you specified in the settings.

    M-x org-gcal-sync

Once that file is created open it `C-x C-f` </path/to/file> <RET>` and then `M-x org-agenda-file-to-front`. This command will include the new file.

You can also create a hook to run `org-gcal-sync` when you open your agenda by placing this snippet in your `.emacs` file:

    (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))

