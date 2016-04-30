#!/bin/bash
/usr/local/bin/jekyll build 
/usr/local/bin/rsync -avz /home/private/kabads.monkeez.org/_site/ /home/public/
echo "Done"

