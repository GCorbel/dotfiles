#!/bin/bash

# Add it in a cron

#Pull from remote repo
git pull

#Push changes
git add -A && git commit -m "Sync $(date --iso-8601=hours)" && git push
