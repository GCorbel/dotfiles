#!/bin/bash

# Add it in a cron
# crontab -e
# * * * * * /home/dougui/.dotfiles/autosync.sh

#Pull from remote repo
git pull

#Push changes
git add -A && git commit -m "Autosync $(date --iso-8601=hours)" && git push
