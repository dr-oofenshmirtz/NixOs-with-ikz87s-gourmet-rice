#auto backup git

git pull
git commit -am "auto-$EPOCHSECONDS"
git push

bash "echo "$EPOCHSECONDS" > ~/.git-sync-last-run.txt"


