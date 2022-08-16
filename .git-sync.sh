#!/bin/sh

#auto backup git

echo ${EPOCHSECONDS}

git pull
git add .
git commit -m "auto-${EPOCHSECONDS}"
git push

echo "${EPOCHSECONDS}" > ~/.git-sync-last-run.txt


