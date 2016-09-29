#!/bin/bash

# Add it in a cron
# crontab -e
# * * * * ~/.dotfiles/autosync.sh >> /tmp/autosync.log

#Pull from remote repo
git pull

#Push changes
git add -A && git commit -m "Autosync $(date --iso-8601=hours)" && git push
