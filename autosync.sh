#!/bin/bash

# Add it in a cron

#Pull from remote repo
git pull

#Push changes
git add . && git commit -m "Sync $(date --iso-8601=hours)" && git push
