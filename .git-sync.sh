#auto backup git

git pull
git add *.*
git add .*
git commit -m "auto-$EPOCHSECONDS"
git push

echo "$EPOCHSECONDS" > ~/.git-sync-last-run.txt


